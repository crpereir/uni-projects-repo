package pt.isel.gomoku.http.dto

import pt.isel.gomoku.domain.users.User

/**
 * The DTO used to represent user obtained from the remote service.
 */
class UserDto(
    val userId: Int,
    val username: String,
    val email: String
) {

    /**
     * Convert [UserDto] to [User].
     */
    fun toUser() = User(
        id = userId,
        username = username,
        email = email
    )
}