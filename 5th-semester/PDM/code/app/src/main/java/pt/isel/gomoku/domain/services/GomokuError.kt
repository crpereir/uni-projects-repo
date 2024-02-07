package pt.isel.gomoku.domain.services

/**
 * Gomoku error contract used to control errors on application screens.
 */
interface GomokuError {

    /**
     * Error title.
     */
    val title: String

    /**
     * Error message.
     */
    val message: String

    /**
     * Identifies if the error corresponds to a game logic error.
     */
    val isPlayError: Boolean
}