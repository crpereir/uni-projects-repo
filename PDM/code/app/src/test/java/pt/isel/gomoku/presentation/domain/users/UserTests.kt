package pt.isel.gomoku.presentation.domain.users

import org.junit.Test
import pt.isel.gomoku.domain.users.User

class UserTests {

    @Test
    fun `create user with valid arguments succeeds`() {
        // Arrange
        // Act
        // Assert
        User(1, "user", "userEmail")
    }

    @Test(expected = IllegalArgumentException::class)
    fun `create user with invalid arguments fails`() {
        // Arrange
        // Act
        // Assert
        User(1, "", "")
    }
}