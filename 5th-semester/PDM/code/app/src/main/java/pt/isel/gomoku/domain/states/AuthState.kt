package pt.isel.gomoku.domain.states


/**
 * Represents the state of a screen.
 * @param T the type of the data.
 */
sealed class AuthState<out T>(
    private val error: Throwable? = null
) : IOState<T>() {

    /**
     * Represents the login mode.
     * @property error the error that occurred.
     */
    data class LoginMode(val error: Throwable? = null) : AuthState<Nothing>(error)

    /**
     * Represents the sign up mode.
     * @property error the error that occurred.
     */
    data class SignUpMode(val error: Throwable? = null) : AuthState<Nothing>(error)

    /**
     * Get the last error that occurred.
     */
    fun getLastError(): Throwable? = error
}

/**
 * Get the login mode.
 * @param error the error that occurred.
 */
fun loginMode(error: Throwable? = null) = AuthState.LoginMode(error)

/**
 * Get the sign up mode.
 * @param error the error that occurred.
 */
fun signUpMode(error: Throwable? = null) = AuthState.SignUpMode(error)