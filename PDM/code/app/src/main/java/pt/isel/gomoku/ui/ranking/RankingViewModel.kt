package pt.isel.gomoku.ui.ranking

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
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.services.UsersService
import pt.isel.gomoku.domain.states.LoadState
import pt.isel.gomoku.domain.states.LoadState.Companion.initial
import pt.isel.gomoku.domain.states.LoadState.Companion.loaded
import pt.isel.gomoku.domain.states.LoadState.Companion.loading
import pt.isel.gomoku.domain.states.LoadState.Loaded
import pt.isel.gomoku.domain.states.LoadState.Loading
import pt.isel.gomoku.domain.users.Ranking
import pt.isel.gomoku.domain.users.UserStatistics
import pt.isel.gomoku.domain.utils.Page
import pt.isel.gomoku.domain.utils.PageNavigation
import pt.isel.gomoku.domain.utils.PageNavigation.FIRST
import pt.isel.gomoku.domain.utils.PageNavigation.LAST
import pt.isel.gomoku.domain.utils.PageNavigation.NEXT
import pt.isel.gomoku.domain.utils.PageNavigation.PREVIOUS

/**
 * The view model for the ranking screen of the Gomoku app.
 * @property usersService The service used to fetch ranking.
 * @property linkRanking the link to obtain the ranking or null if not known.
 */
class RankingViewModel(private val usersService: UsersService, private val linkRanking: Link?) :
    ViewModel() {

    companion object {
        fun factory(service: UsersService, linkRanking: Link?) = viewModelFactory {
            initializer { RankingViewModel(service, linkRanking) }
        }
    }

    private val _loadStateFlow: MutableStateFlow<LoadState<Siren<Ranking>>> =
        MutableStateFlow(initial())

    /**
     * The flow of states the view model traverses.
     */
    val loadState: Flow<LoadState<Siren<Ranking>>>
        get() = _loadStateFlow.asStateFlow()

    /**
     * The mutable state that store the user of the ranking who is temporarily selected.
     * _Null_ means none are selected.
     */
    var userSelected by mutableStateOf<UserStatistics?>(null)
        private set

    /**
     * Gets the updated game ranking. Used either on initial load, refresh or page change.
     * @param pageNavigation the intended [PageNavigation] or null if it is not a page change.
     * @throws IllegalStateException if the view model is already in the loading state.
     */
    fun fetchRanking(pageNavigation: PageNavigation? = null) {
        if (_loadStateFlow.value is Loading)
            throw IllegalStateException("The view model is already in the loading state.")

        val link = pageNavigation?.let { getNavigationLink(it) } ?: linkRanking
        _loadStateFlow.value = loading()
        viewModelScope.launch {
            val result = kotlin.runCatching { usersService.fetchRanking(link) }
            _loadStateFlow.value = loaded(result)
        }
    }

    /**
     * Selecting a user, i.e., changes the userSelected mutable state with the selected user.
     * NOTE: It is also used to deselect a user using null.
     * @param userId the identifier of the user or null if the user is to be deselected.
     */
    fun onUserSelected(userId: Int?) {
        if (userId == null) {
            userSelected = null
        } else {
            if (_loadStateFlow.value is Loaded) {
                userSelected = _loadStateFlow.value.getOrNull()?.properties?.ranking?.find { u ->
                    u.userId == userId
                }
            }
        }
    }

    /**
     * Get the current ranking [Page].
     * @throws IllegalStateException if the view model is not in loaded state.
     */
    fun getPage(): Page {
        val links = _loadStateFlow.value.getOrNull()?.links
            ?: throw IllegalStateException("The view model is not in the loaded state.")

        return when {
            findRel(links, FIRST) && findRel(links, LAST) && findRel(links, NEXT)
                    && findRel(links, PREVIOUS) -> Page.MIDDLE

            findRel(links, NEXT) && findRel(links, LAST) -> Page.FIRST

            findRel(links, PREVIOUS) && findRel(links, FIRST) -> Page.LAST

            else -> Page.SINGLE
        }
    }

    /**
     * Get a [Link] from a link relation of navigation.
     */
    private fun getNavigationLink(pageNav: PageNavigation): Link? =
        _loadStateFlow.value.getOrThrow().getLink(pageNav.toString())

    /**
     * Search for a link relation.
     */
    private fun findRel(links: List<Link>, pageNav: PageNavigation): Boolean =
        links.any { l -> l.rel.any { r -> r == pageNav.toString() } }
}
