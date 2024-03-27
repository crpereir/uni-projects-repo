package pt.isel.gomoku.ui.game

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.lifecycle.viewmodel.initializer
import androidx.lifecycle.viewmodel.viewModelFactory
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import pt.isel.gomoku.domain.games.Game
import pt.isel.gomoku.domain.games.Monitor
import pt.isel.gomoku.domain.games.Player
import pt.isel.gomoku.domain.games.isMyTurnNow
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.services.GamesService
import pt.isel.gomoku.domain.services.GomokuError
import pt.isel.gomoku.domain.services.local.LocalGamesService
import pt.isel.gomoku.domain.states.GameState.Companion.gaveUp
import pt.isel.gomoku.domain.states.GameState.Companion.playing
import pt.isel.gomoku.domain.states.GameState.Companion.waiting
import pt.isel.gomoku.domain.states.GameState.Companion.waitingForNew
import pt.isel.gomoku.domain.states.GameState.Playing
import pt.isel.gomoku.domain.states.GameState.Waiting
import pt.isel.gomoku.domain.states.IOState
import pt.isel.gomoku.domain.states.LoadState
import pt.isel.gomoku.domain.states.LoadState.Companion.failure
import pt.isel.gomoku.domain.states.LoadState.Companion.initial
import pt.isel.gomoku.domain.states.LoadState.Loading
import pt.isel.gomoku.domain.states.getOrNull
import pt.isel.gomoku.domain.states.idle
import pt.isel.gomoku.domain.states.loadFailure
import pt.isel.gomoku.domain.states.loadSuccess
import pt.isel.gomoku.domain.states.loading
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.domain.users.UserInfoRepository
import pt.isel.gomoku.domain.variants.Variant
import kotlin.time.Duration.Companion.parse
import kotlin.time.Duration.Companion.seconds

/**
 * View model used on GameActivity.
 * @param service Service used to retrieve data for render.
 * @param userInfoRepo Repository where user details are stored, including token
 * @param siren Siren that includes either monitor to poll for new game or nothing, indicating
 *              that there is an already existing game.
 * @param variant [Variant] for the game.
 */
class GameViewModel(
    private val service: GamesService,
    private val userInfoRepo: UserInfoRepository,
    private val siren: Siren<Monitor?>,
    private val variant: Variant
) : ViewModel() {

    companion object {
        /**
         * Factory for the [GameViewModel].
         * @param service Service used to retrieve data for render.
         * @param userInfoRepo Repository where user details are stored, including token
         * @param monitorSiren Siren that includes either monitor to poll for new game or nothing, indicating
         *                     that there is an already existing game.
         * @param variant [Variant] for the game.
         */
        fun factory(
            service: GamesService,
            userInfoRepo: UserInfoRepository,
            monitorSiren: Siren<Monitor?>,
            variant: Variant
        ) = viewModelFactory {
            initializer { GameViewModel(service, userInfoRepo, monitorSiren, variant) }
        }
    }

    // Represents the coroutine tasked with polling.
    // Used for both polling on the monitor and polling on the game.
    private var polling: Job? = null

    private lateinit var gameId: String

    /**
     * The flow of states the view model traverses.
     */
    private val _loadStateFlow: MutableStateFlow<LoadState<Siren<Game>?>> =
        MutableStateFlow(initial())

    val loadState: Flow<LoadState<Siren<Game>?>>
        get() = _loadStateFlow.asStateFlow()

    var playError by mutableStateOf<Throwable?>(null)
        private set

    fun clearError() {
        playError = null
    }

    private val _userInfoFlow: MutableStateFlow<IOState<UserInfo>> =
        MutableStateFlow(idle())

    // Indicates the user's color. Starts at UNKNOWN as no color as been assigned yet.
    var player by mutableStateOf(Player.UNKNOWN)
        private set

    private fun cannotAccessSiren(state: LoadState<Siren<Game>?>): Boolean {
        return state !is Playing &&
                (state !is Waiting || state.hasNothing())
    }

    private fun canAccessSiren(state: LoadState<Siren<Game>?>): Boolean {
        return !cannotAccessSiren(state)
    }

    /**
     * If present, returns the siren present in the [_loadStateFlow].
     * @throws IllegalStateException if no siren is present.
     */
    private fun currentSiren(): Siren<Game> {
        val observedState = _loadStateFlow.value
        if (
            cannotAccessSiren(observedState)
        ) {
            throw IllegalStateException("Trying to get non-existent siren. State = $observedState")
        } else {
            return requireNotNull(observedState.getOrThrow())
        }
    }

    /**
     * Verifies if there is a game in the current state.
     * @return true if there is a game, false if not or if there's no siren.
     */
    fun isGamePresent(): Boolean {
        val observedState = _loadStateFlow.value
        return canAccessSiren(observedState) && currentSiren().properties != null
    }

    /**
     * Returns the current game.
     * @throws IllegalStateException if trying to fetch game that is non-existent.
     */
    fun currentGame(): Game {
        if (!isGamePresent())
            throw IllegalStateException("Trying to get non-existent game. State = ${_loadStateFlow.value}")
        return requireNotNull(currentSiren().properties)
    }

    fun didIWin() =
        if(service is LocalGamesService)
            true
        else
            when (currentGame().state) {
                Game.State.WINNER_B -> player == Player.B
                Game.State.WINNER_W -> player == Player.W
                else -> false
    }

    private fun getToken() = requireNotNull(_userInfoFlow.value.getOrNull()?.token)
    { "User is not authenticated? What the hell?" }

    /**
     * Sets up the view model.
     * @throws IllegalStateException if the view model is already in the loading state.
     */
    fun setup() {
        if (_loadStateFlow.value is Loading)
            throw IllegalStateException("The view model is already in the loading state.")

        _loadStateFlow.value = LoadState.loading()
        _userInfoFlow.value = loading()
        viewModelScope.launch {
            // Get the user information saved in the repository ...
            runCatching {
                userInfoRepo.getUserInfo()
            }.onSuccess { userInfo ->
                requireNotNull(userInfo)
                // ... if successful then save the user information ...
                _userInfoFlow.value = loadSuccess(userInfo)
                // ... and obtain the fetch game.
                fetchGame()
            }.onFailure { error ->
                // ... if fails then save the error.
                _userInfoFlow.value = loadFailure(error)
                _loadStateFlow.value = failure(error)
            }
        }
    }

    /**
     * Retrieves a game.
     */
    private fun fetchGame() {
        when (_loadStateFlow.value) {
            is Loading -> fetchNewGame()
            is Waiting -> fetchUpdatedGame()
            else -> throw IllegalStateException(
                "Unexpected error: Trying to fetch game in illegal state."
            )
        }
    }

    /**
     * Retrieves a new game.
     */
    private fun fetchNewGame() {
        if (siren.properties != null)
            fetchGameAfterWaiting()
        else
            fetchGameWithoutWaiting()
    }

    /**
     * Retrieves a new game after monitor given verifies its existence.
     */
    private fun fetchGameAfterWaiting() {
        var localSiren = siren
        _loadStateFlow.value = waitingForNew()
        val token = getToken()

        polling = viewModelScope.launch {
            while (true) {
                val pollingInterval = localSiren.properties?.askAgainIn
                requireNotNull(pollingInterval) { "Unexpected error: Monitor siren with null askAgainIn." }
                delay(parse(pollingInterval))
                val monitorSelf = service.getLinkRelations()?.let { localSiren.getLink(it.SELF) }
                val result = kotlin.runCatching { service.statusMonitor(token, monitorSelf) }

                if (result.isSuccess) {
                    val monitorSiren = result.getOrNull()
                    requireNotNull(monitorSiren) { "Unexpected error: Successful request with null result." }

                    // If the monitor is no longer waiting, then we can fetch the game.
                    if (monitorSiren.properties?.status == Monitor.Status.OTHER_PLAYER_JOINED) {
                        localSiren = monitorSiren
                        break
                    }
                }
            }
        }

        viewModelScope.launch {
            polling?.join()
            if (polling?.isCancelled == false) {
                val gameSelfLink = service.getLinkRelations()?.let { localSiren.getLink(it.SELF) }
                val gameSelfHref = gameSelfLink?.href
                gameId = gameSelfHref?.substringAfter("api/games/") ?: ""
                val result = kotlin.runCatching { service.fetchGame(token, gameSelfLink) }
                player = Player.B
                _loadStateFlow.value = playing(result)
            }
        }
    }

    /**
     * Give up on polling for monitor, leaving matchmaking.
     */
    fun stopWaitingForPlayer() {
        if (siren.properties == null)
            throw IllegalStateException("Unexpected error: Waiting, but had game already.")

        val token = getToken()
        val monitorCancelAction = service.getActionNames()?.let { siren.getAction(it.CANCEL_START) }
        viewModelScope.launch {
            _loadStateFlow.value = Loading
            polling?.cancel()
            polling?.join()
            kotlin.runCatching { service.deleteMonitor(token, monitorCancelAction) }
            _loadStateFlow.value = gaveUp()
        }
    }

    /**
     * Retrieves a new game, without waiting as there was already someone waiting.
     */
    private fun fetchGameWithoutWaiting() {

        val token = getToken()
        viewModelScope.launch {
            val gameSelfLink = service.getLinkRelations()?.let { siren.getLink(it.SELF) }
            val gameSelfHref = gameSelfLink?.href
            gameId = gameSelfHref?.substringAfter("api/games/") ?: ""
            val result = kotlin.runCatching { service.fetchGame(token, gameSelfLink) }
            _loadStateFlow.value = waiting(result)
            if (service is LocalGamesService) {
                player = Player.B
                delay(100)
                _loadStateFlow.value = playing(result)
            } else {
                player = Player.W
            }
            fetchUpdatedGame()
        }
    }

    /**
     * Retrieves the new state of an already running game.
     */
    private fun fetchUpdatedGame() {

        val token = getToken()
        polling = viewModelScope.launch {
            while (true) {
                delay(2.seconds)
                val gameSelfLink =
                    service.getLinkRelations()?.let { currentSiren().getLink(it.SELF) }
                val result = kotlin.runCatching { service.fetchGame(token, gameSelfLink) }
                val returnedSiren = result.getOrNull()
                if (returnedSiren == null) {
                    _loadStateFlow.value = requireNotNull(
                        result.exceptionOrNull()?.let {
                            failure(it)
                        }
                    ) { "Unexpected error: Failed fetched didn't return error." }
                }
                val returnedGame = requireNotNull(returnedSiren?.properties)
                { "Unexpected error: Success, but not game." }
                if (player.isMyTurnNow(returnedGame.state)) {
                    _loadStateFlow.value = playing(result)
                    break
                } else {
                    _loadStateFlow.value = waiting(result)
                    if (returnedGame.isOver()) break
                }
            }
        }
    }

    /**
     * Plays on the current game.
     * @param row Row where to play.
     * @param column Column where to play.
     */
    fun play(row: Int, column: Int) {
        val token = getToken()
        val gameSiren = currentSiren()
        val playAction = service.getActionNames()?.let { gameSiren.getAction(it.PLAY) }
        viewModelScope.launch {
            _loadStateFlow.value = waiting(Result.success(currentSiren()))
            runCatching {
                currentGame().isPlayValid(row, column, getBoardDim(), player)
                service.play(token, gameId, row, column, playAction)
            }
                .onSuccess {
                    if (service is LocalGamesService) {
                        player = if (player == Player.W) Player.B else Player.W
                    }
                    _loadStateFlow.value = waiting(Result.success(it))
                    fetchGame()
                }
                .onFailure {
                    if (it is GomokuError && it.isPlayError) {
                        playError = it
                        _loadStateFlow.value = playing(Result.success(currentSiren()))
                    } else {
                        _loadStateFlow.value = waiting(Result.failure(it))
                    }
                }
        }
    }

    /**
     * Gives up on the current game.
     */
    fun giveUp() {
        val token = getToken()
        val action = service.getActionNames()
            ?.let { currentSiren().getAction(it.GIVE_UP) }
        viewModelScope.launch {
            _loadStateFlow.value = Loading
            polling?.cancel()
            polling?.join()
            kotlin.runCatching { service.giveUp(token, action) }
            _loadStateFlow.value = gaveUp()
        }
    }

    /**
     * Gets the board dimension.
     */
    fun getBoardDim() = variant.boardDim
}