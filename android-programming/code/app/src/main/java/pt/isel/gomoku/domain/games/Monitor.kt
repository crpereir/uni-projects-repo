package pt.isel.gomoku.domain.games

/**
 * Represents the state monitoring 'object' at the start of a game.
 * @property status the current [Status] of a monitor.
 */
data class Monitor(
    val status: Status,
    val askAgainIn: String?
) {

    /**
     * Represents all possible states of a monitor.
     * [WAITING_FOR_OTHER_PLAYER] - Waiting for another player to join.
     * [OTHER_PLAYER_JOINED] - Another player joined.
     */
    enum class Status {
        WAITING_FOR_OTHER_PLAYER, OTHER_PLAYER_JOINED
    }
}
