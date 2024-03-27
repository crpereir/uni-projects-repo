package pt.isel.gomoku.domain.users

/**
 * Represents a user.
 * @property id the user's identifier.
 * @property username the user's username.
 * @property email the user's email.
 */
data class User(
    val id: Int,
    val username: String,
    val email: String
) {

    init {
        require(username.isNotBlank() && email.isNotBlank())
    }
}
