package pt.isel.gomoku.http.dto

import pt.isel.gomoku.domain.games.Monitor

/**
 * The DTO used to represent the monitor of a game start obtained from the remote service.
 */
data class MonitorDto(
    val status: String,
    val askAgainIn: String?
) {

    /**
     * Convert [MonitorDto] to [Monitor].
     */
    fun toMonitor() = Monitor(
        status = enumValueOf(status),
        askAgainIn = askAgainIn
    )
}
