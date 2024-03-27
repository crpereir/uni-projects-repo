package pt.isel.gomoku.domain.users

import kotlinx.datetime.Instant

/**
 * Represents the user information.
 * @property username the user's username.
 * @property token the user's token.
 */
data class UserInfo(val username: String, val token: String, val tokenExpiration: Instant) {
    init {
        require(username.isNotBlank() && token.isNotBlank())
    }
}