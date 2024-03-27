package pt.isel.gomoku.ui.authentication

import pt.isel.gomoku.domain.services.exceptions.EmptyFieldsException
import pt.isel.gomoku.domain.services.exceptions.InvalidEmailException
import pt.isel.gomoku.domain.services.exceptions.PasswordNotSecureException

/**
 * Check if the input of login form is valid.
 * @param identity user's identify.
 * @param password user's password.
 */
fun checkLoginInput(identity: String, password: String) {
    isEmptyFields(identity, password)
}

/**
 * Check if the input of signup form is valid.
 * @param username user's username.
 * @param email user's email.
 * @param password user's password.
 */
fun checkSignUpInput(username: String, email: String, password: String) {
    isEmptyFields(username, email, password)
    isEmailValid(email)
    isPasswordSecure(password)
}

/**
 * Checks if any of the fields are empty.
 * @param username user's username.
 * @param email user's email.
 * @param password user's password.
 * @throws EmptyFieldsException if any are empty.
 */
private fun isEmptyFields(username: String, email: String, password: String) {
    if (username.isBlank() || email.isBlank() || password.isBlank())
        throw EmptyFieldsException
}

/**
 * Checks if any of the fields are empty.
 * @param identity user's username.
 * @param password user's password.
 * @throws EmptyFieldsException if any are empty.
 */
private fun isEmptyFields(identity: String, password: String) {
    if (identity.isBlank() || password.isBlank())
        throw EmptyFieldsException
}

/**
 * Checks if the email is in a valid format.
 * @param email user's email.
 * @throws InvalidEmailException if it has an invalid format.
 */
private fun isEmailValid(email: String) {
    if (!email.contains("@") || !email.contains("."))
        throw InvalidEmailException
}

/**
 * Checks if the password is secure
 * @param password user's password.
 * @throws PasswordNotSecureException if it is not secure.
 */
private fun isPasswordSecure(password: String) {
    if (
        password.length < 6 ||
        password.none { it.isDigit() } ||
        password.none { it.isLowerCase() } ||
        password.none { it.isUpperCase() }
    )
        throw PasswordNotSecureException
}