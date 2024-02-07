package pt.isel.gomoku.ui.home

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.lifecycle.viewmodel.initializer
import androidx.lifecycle.viewmodel.viewModelFactory
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import pt.isel.gomoku.domain.home.Home
import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.services.HomeService
import pt.isel.gomoku.domain.states.HomeState
import pt.isel.gomoku.domain.states.IOState
import pt.isel.gomoku.domain.states.Idle
import pt.isel.gomoku.domain.states.LoadState
import pt.isel.gomoku.domain.states.idle
import pt.isel.gomoku.domain.states.loaded
import pt.isel.gomoku.domain.states.loading
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.domain.users.UserInfoRepository

/**
 * The view model for the application's home screen.
 * @param homeService The service used to fetch home resource.
 * @param userInfoRepository The repository for the user information.
 */
class HomeViewModel(
    private val homeService: HomeService,
    private val userInfoRepository: UserInfoRepository
) : ViewModel() {

    companion object {
        fun factory(homeService: HomeService, userInfoRepository: UserInfoRepository) =
            viewModelFactory {
                initializer { HomeViewModel(homeService, userInfoRepository) }
            }
    }

    private val _userInfoFlow: MutableStateFlow<IOState<UserInfo?>> = MutableStateFlow(idle())

    /**
     * The flow of states the view model traverses.
     */
    val userInfo: Flow<IOState<UserInfo?>>
        get() = _userInfoFlow.asStateFlow()

    private val _homeStateFlow: MutableStateFlow<LoadState<Nothing>> =
        MutableStateFlow(LoadState.idle())

    /**
     * The flow of states the view model traverses.
     */
    val homeState: Flow<LoadState<Nothing>>
        get() = _homeStateFlow.asStateFlow()

    private var links: List<Link>? = null
    private var actions: List<Action>? = null

    /**
     * Fetches the user information.
     * @throws IllegalStateException if the view model is not in the idle state.
     */
    fun fetchUserInfo() {
        if (_userInfoFlow.value !is Idle)
            throw IllegalStateException("The view model is not in the idle state.")

        _userInfoFlow.value = loading()
        viewModelScope.launch {
            val result = runCatching { userInfoRepository.getUserInfo() }
            _userInfoFlow.value = loaded(result)
        }
    }

    /**
     * Fetches the home information.
     */
    fun fetchHome(navigateTo: NavigateTo) {
        if (links == null && actions == null) {
            viewModelScope.launch {
                runCatching { homeService.getHome() }
                    .onSuccess { siren ->
                        processSirenHome(siren)
                        navigate(navigateTo)
                    }
                    .onFailure { error ->
                        _homeStateFlow.value = LoadState.failure(error)
                    }
            }
        } else {
            navigate(navigateTo)
        }
    }

    private fun navigate(navigateTo: NavigateTo) {
        when (navigateTo) {
            NavigateTo.RANKING -> processRankingNavigation()
            NavigateTo.PlAYGAME -> processPlayGameNavigation()
        }
    }

    /**
     * Processes the siren home.
     * @param siren the siren home.
     */
    private fun processSirenHome(siren: Siren<Home>) {
        actions = siren.actions.filter { a: Action ->
            a.name == homeService.getActionNames()?.LOGIN ||
                    a.name == homeService.getActionNames()?.SIGNUP
        }
        links = siren.links.filter { l: Link ->
            l.rel.contains(homeService.getLinkRelations()?.RANKING) ||
                    l.rel.contains(homeService.getLinkRelations()?.USER_HOME)
        }
    }

    /**
     * Processes the ranking navigation.
     */
    private fun processRankingNavigation() {
        val link = getLink(links, homeService.getLinkRelations()?.RANKING)
        _homeStateFlow.value = HomeState.RankingReady(link)
    }

    /**
     * Processes the play game navigation.
     */
    private fun processPlayGameNavigation() {
        val linkMe = getLink(links, homeService.getLinkRelations()?.USER_HOME)
        val actionLogin = getAction(actions, homeService.getActionNames()?.LOGIN)
        val actionSignUp = getAction(actions, homeService.getActionNames()?.SIGNUP)
        _homeStateFlow.value = HomeState.PlayGameReady(linkMe, actionLogin, actionSignUp)
    }

    /**
     * Gets the link with the given relation.
     * @param links the links.
     * @param rel the relation.
     * @return the link with the given relation or null if it does not exist.
     */
    private fun getLink(links: List<Link>?, rel: String?) =
        links?.firstOrNull { l: Link -> l.rel.contains(rel) }

    /**
     * Gets the action with the given name.
     * @param actions the actions.
     * @param name the name.
     * @return the action with the given name or null if it does not exist.
     */
    private fun getAction(actions: List<Action>?, name: String?) =
        actions?.firstOrNull { a: Action -> a.name == name }

    /**
     * Resets the view model to the idle state. From the idle state, the user information
     * can be fetched again.
     */
    fun reset() {
        _userInfoFlow.value = idle()
        _homeStateFlow.value = LoadState.idle()
    }
}

/**
 * Navigation options from the home activity.
 */
enum class NavigateTo { RANKING, PlAYGAME }
