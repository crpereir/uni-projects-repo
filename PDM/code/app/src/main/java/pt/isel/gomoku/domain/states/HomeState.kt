package pt.isel.gomoku.domain.states

import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Link

/**
 * Represents the state of home screen.
 */
sealed class HomeState<out T> : LoadState<T>() {

    /**
     * State in which the navigation to ranking is ready.
     */
    data class RankingReady(val link: Link?) : HomeState<Nothing>()

    /**
     * State in which the navigation to play game is ready.
     */
    data class PlayGameReady(
        val linkMe: Link?, val actionLogin: Action?, val actionSignUp: Action?
    ) : HomeState<Nothing>()
}