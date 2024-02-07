package pt.isel.gomoku.http.dto

import kotlinx.datetime.Instant
import pt.isel.gomoku.domain.users.Token

/**
 * The DTO used to represent token obtained from the remote service.
 */
data class TokenDto(
    val token: String,
    val expiration: String
) {

    /**
     * Convert [TokenDto] to [Token].
     */
    fun toToken() = Token(
        token = token,
        expiration = Instant.parse(expiration)
    )
}