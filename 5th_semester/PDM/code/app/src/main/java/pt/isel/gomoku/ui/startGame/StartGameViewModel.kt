package pt.isel.gomoku.ui.startGame

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.lifecycle.viewmodel.initializer
import androidx.lifecycle.viewmodel.viewModelFactory
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import pt.isel.gomoku.domain.games.Monitor
import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.services.GamesService
import pt.isel.gomoku.domain.services.UsersService
import pt.isel.gomoku.domain.states.IOState
import pt.isel.gomoku.domain.states.LoadState
import pt.isel.gomoku.domain.states.LoadState.Companion.failure
import pt.isel.gomoku.domain.states.LoadState.Companion.initial
import pt.isel.gomoku.domain.states.getOrNull
import pt.isel.gomoku.domain.states.idle
import pt.isel.gomoku.domain.states.loadFailure
import pt.isel.gomoku.domain.states.loadSuccess
import pt.isel.gomoku.domain.states.loading
import pt.isel.gomoku.domain.states.loggedOut
import pt.isel.gomoku.domain.states.ready
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.domain.users.UserInfoRepository
import pt.isel.gomoku.domain.variants.Variant
import pt.isel.gomoku.domain.variants.Variants

/**
 * The view model for the start game screen of the Gomoku app.
 * @property gamesService The service used to fetch variants and start game.
 * @property usersService The service used to log out.
 * @property userInfoRepository The repository for the user information.
 * @property linkMe the link to obtain the "me" resource or null if not known.
 */
class StartGameViewModel(
    private val usersService: UsersService,
    private val gamesService: GamesService,
    private val userInfoRepository: UserInfoRepository,
    private val linkMe: Link?
) : ViewModel() {

    companion object {
        fun factory(
            usersService: UsersService,
            gamesService: GamesService,
            userInfoRepository: UserInfoRepository,
            linkMe: Link?,
        ) =
            viewModelFactory {
                initializer {
                    StartGameViewModel(
                        usersService,
                        gamesService,
                        userInfoRepository,
                        linkMe
                    )
                }
            }
    }

    private val _loadStateFlow: MutableStateFlow<LoadState<Siren<Variants>>> =
        MutableStateFlow(initial())

    /**
     * The flow of states the view model traverses.
     */
    val loadState: Flow<LoadState<Siren<Variants>>>
        get() = _loadStateFlow.asStateFlow()

    private val _userInfoFlow: MutableStateFlow<IOState<UserInfo?>> = MutableStateFlow(idle())

    private var logOutAction: Action? = null

    /**
     * The flow of userInfo the view model traverses.
     */
    val userInfo: Flow<IOState<UserInfo?>>
        get() = _userInfoFlow.asStateFlow()

    private val _monitorFlow: MutableStateFlow<Siren<Monitor?>?> = MutableStateFlow(null)

    /**
     * The flow of monitor of game start the view model traverses.
     */
    val monitor: Flow<Siren<Monitor?>?>
        get() = _monitorFlow.asStateFlow()

    /**
     * The mutable state that store the variant chosen to start a game.
     */
    var variant by mutableStateOf<Variant?>(null)
        private set

    /**
     * Gets the information needed, i.e., the user information and the list of available variants.
     * @throws IllegalStateException if the view model is already in the loading state.
     */
    fun fetchUserInfoAndVariants() {
        if (_loadStateFlow.value is LoadState.Loading)
            throw IllegalStateException("The view model is already in the loading state.")

        _loadStateFlow.value = LoadState.loading()
        _userInfoFlow.value = loading()
        viewModelScope.launch {
            // Get the user information saved in the repository ...
            runCatching {
                userInfoRepository.getUserInfo()
            }.onSuccess { userInfo ->
                requireNotNull(userInfo)
                // ... if successful then save the user information ...
                _userInfoFlow.value = loadSuccess(userInfo)
                // ... and obtain the variants.
                fetchVariants(userInfo.token)
            }.onFailure { error ->
                // ... if fails then save the error.
                _userInfoFlow.value = loadFailure(error)
                _loadStateFlow.value = failure(error)
            }
        }
    }

    /**
     * Gets the available variants.
     */
    private suspend fun fetchVariants(token: String) {
        val result = runCatching {
            val sirenMe = usersService.me(token, linkMe)
            logOutAction = usersService.getActionNames()?.let { sirenMe.getAction(it.LOGOUT) }
            gamesService.fetchVariants(
                token = token,
                link = gamesService.getLinkRelations()?.let { sirenMe.getLink(it.VARIANTS) }
            )
        }
        _loadStateFlow.value = LoadState.loaded(result)
        // Save the first variant as default
        variant = _loadStateFlow.value.getOrNull()?.properties?.variants?.firstOrNull()
    }

    /**
     * Start a game.
     * @throws IllegalStateException if the view model is already in the loading state.
     */
    fun startGame() {
        if (_loadStateFlow.value is LoadState.Loading)
            throw IllegalStateException("The view model is already in the loading state.")

        val action = gamesService.getActionNames()?.let {
            _loadStateFlow.value.getOrNull()?.getAction(it.START)
        }
        val token = requireNotNull(_userInfoFlow.value.getOrNull()?.token)
        _loadStateFlow.value = LoadState.loading()
        viewModelScope.launch {
            // Start a game ...
            runCatching {
                gamesService.startGame(token, requireNotNull(variant).variantId, action)
            }.onSuccess { monitor ->
                // ... if successful then save the monitor of start game or null ...
                _monitorFlow.value = monitor
                // ... and change state.
                _loadStateFlow.value = ready()
            }.onFailure { error ->
                // ... if fails then save the error.
                _loadStateFlow.value = failure(error)
            }
        }
    }

    /**
     * Logout.
     * @throws IllegalStateException if the view model is already in the loading state.
     */
    fun logout() {
        if (_loadStateFlow.value is LoadState.Loading)
            throw IllegalStateException("The view model is already in the loading state.")

        _loadStateFlow.value = LoadState.loading()
        val token = requireNotNull(_userInfoFlow.value.getOrNull()?.token)

        viewModelScope.launch {
            // Logout ...
            runCatching {
                usersService.logout(token, logOutAction)
            }.onSuccess {
                // ... if successful then removes from user repository ...
                removesUserInfo()
            }.onFailure { error ->
                // ... if fails then save the error.
                _loadStateFlow.value = failure(error)
            }
        }
    }

    /**
     * Removes user information from the repository.
     */
    private suspend fun removesUserInfo() {
        _userInfoFlow.value = loading()
        runCatching {
            // Removes from user repository ...
            userInfoRepository.removeUserInfo()
        }.onSuccess {
            // ... if successful then removes user from user info flow ...
            _userInfoFlow.value = loadSuccess(null)
            // ... and change state.
            _loadStateFlow.value = loggedOut()
        }.onFailure { error ->
            // ... if fails then save the error.
            _userInfoFlow.value = loadFailure(error)
            _loadStateFlow.value = failure(error)
        }
    }

    /**
     *  Change a variant, i.e., changes the variant mutable state to the next variant.
     *  If you reach the end, start over from the beginning, it's cyclical.
     */
    fun changeVariant() {
        val variants = _loadStateFlow.value.getOrNull()?.properties?.variants
        requireNotNull(variants) { "Variants need to exist" }
        val nextVariant = if (variant != null) {
            val currentIndex = variants.indexOf(variant)
            val nextIndex = (currentIndex + 1) % variants.size
            variants[nextIndex]
        } else {
            null
        }
        this.variant = nextVariant
    }

    /**
     * Resets both flows to the initial state, i.e., load state flow to initial state and user info
     * flow to idle.
     * @throws IllegalStateException if the view model is in the loading state.
     */
    fun reset() {
        if (_loadStateFlow.value is LoadState.Loading)
            throw IllegalStateException("The view model is in the loading state.")

        _loadStateFlow.value = initial()
        _userInfoFlow.value = idle()
    }
}