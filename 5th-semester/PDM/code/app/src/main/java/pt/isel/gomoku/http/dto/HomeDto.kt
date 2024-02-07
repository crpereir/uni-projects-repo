package pt.isel.gomoku.http.dto

import pt.isel.gomoku.domain.home.Home

/**
 * The DTO used to represent home obtained from the remote service.
 */
data class HomeDto(
    val welcome: String
) {

    /**
     * Convert [HomeDto] to [Home].
     */
    fun toHome(): Home =
        Home(welcome)
}
