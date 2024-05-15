package pt.isel.gomoku.http

import pt.isel.gomoku.domain.services.GomokuError

/**
 * Represents a API error.
 */
class APIException(
    override val title: String,
    override val message: String,
    val type: String
) : Throwable(), GomokuError {

    override val isPlayError: Boolean = type in playErrors

    companion object {
        private const val commonBase =
            "https://github.com/isel-leic-daw/2023-daw-leic51d-07/tree/main/docs/api/problem/"
        private val playErrors = listOf(
            "moveNotValid", "gameAlreadyEnded", "notYourTurn"
        ).map { type -> commonBase + type }
    }
}

/**
 * Represents a failure in communication with the server.
 */
object ConnectionToServerException : Throwable(), GomokuError {
    override val title: String = "Error accessing the server"
    override val message: String = "Try again later, please!"

    override val isPlayError: Boolean = false
}

/**
 * Represents improper access without authentication to a resource that requires authentication.
 */
object NotLoggedInException : Throwable(), GomokuError {
    override val title: String = "Not authorized"
    override val message: String = "Please log in or create an account first!"

    override val isPlayError: Boolean = false
}

/**
 * Represents an unexpected error.
 */
object UnexpectedErrorException : Throwable(), GomokuError {
    override val title: String = "Something happened"
    override val message: String = "Try again later, please!"

    override val isPlayError: Boolean = false
}