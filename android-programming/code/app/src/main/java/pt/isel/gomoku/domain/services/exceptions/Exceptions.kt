package pt.isel.gomoku.domain.services.exceptions

import pt.isel.gomoku.domain.services.GomokuError

/**
 * Represents a game logic error in which the player attempted to play when it was not his turn.
 */
object NotYourTurnException : Throwable(), GomokuError {
    override val title: String = "Not your turn"
    override val message: String = "It is not your turn yet!"

    override val isPlayError: Boolean = true
}

/**
 * Represents a game logic error in which the player attempted to play in a position that was not valid.
 */
object InvalidPositionException : Throwable(), GomokuError {
    override val title: String = "Move invalid"
    override val message: String = "You can't place that piece there!"

    override val isPlayError: Boolean = true
}

/**
 * Represents a game logic error in which the player attempted to play in a position already occupied.
 */
object PositionAlreadyOccupiedException : Throwable(), GomokuError {
    override val title: String = "Position already occupied"
    override val message: String = "There's already a piece in that position!"

    override val isPlayError: Boolean = true
}

/**
 * Represents a game logic error in which the player attempted to play in a game that has already ended.
 */
object GameAlreadyEndedException : Throwable(), GomokuError {
    override val title: String = "Game over"
    override val message: String = "The game has already ended!"

    override val isPlayError: Boolean = true
}

/**
 * Represents an error in the input form in which some fields are not filled in.
 */
object EmptyFieldsException : Throwable(), GomokuError {
    override val title: String = "Some fields not filled in"
    override val message: String = "Please fill in all fields!"

    override val isPlayError: Boolean = false
}

/**
 * Represents an error in the input form where the email is not in a valid format.
 */
object InvalidEmailException : Throwable(), GomokuError {
    override val title: String = "Email is not valid"
    override val message: String = "Please enter an email with a valid format!"

    override val isPlayError: Boolean = false
}

/**
 * Represents an error in the input form where the password is not secure.
 */
object PasswordNotSecureException : Throwable(), GomokuError {
    override val title: String = "Password not secure"
    override val message: String =
        "Password must have at least 6 characters, a lowercase letter, an uppercase letter and a digit."

    override val isPlayError: Boolean = false
}
