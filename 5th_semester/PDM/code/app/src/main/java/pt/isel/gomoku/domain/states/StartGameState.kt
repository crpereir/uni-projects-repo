package pt.isel.gomoku.domain.states

/**
 * Sum type that represents the state of a load operation plus states specific to the
 * [pt.isel.gomoku.ui.startGame.StartGameActivity].
 */
sealed class StartGameState<out T> : LoadState<T>() {
    /**
     * State in which the start of the game is ready.
     */
    object Ready : StartGameState<Nothing>()

    /**
     * State in which the user logout.
     */
    object LoggedOut : StartGameState<Nothing>()
}

/**
 * Returns a new [StartGameState] in the ready state.
 */
fun ready(): StartGameState.Ready = StartGameState.Ready

/**
 * Returns a new [StartGameState] in the logout state.
 */
fun loggedOut(): StartGameState.LoggedOut = StartGameState.LoggedOut
