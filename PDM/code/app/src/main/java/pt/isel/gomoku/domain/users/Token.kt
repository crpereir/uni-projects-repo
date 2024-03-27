package pt.isel.gomoku.domain.users

import kotlinx.datetime.Instant

/**
 * Represents a user token.
 * @property token the user's token.
 * @property expiration the user's token expiration.
 */
data class Token(
    val token: String,
    val expiration: Instant
) {

    init {
        require(token.isNotBlank())
    }
}
