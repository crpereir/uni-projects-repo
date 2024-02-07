package pt.isel.gomoku.presentation.domain.users

import kotlinx.datetime.Clock
import org.junit.Test
import pt.isel.gomoku.domain.users.Token
import kotlin.time.Duration.Companion.hours

class TokenTests {

    @Test
    fun `create token with valid arguments succeeds`() {
        // Arrange
        // Act
        // Assert
        Token("token", Clock.System.now().plus(5.hours))
    }

    @Test(expected = IllegalArgumentException::class)
    fun `create token with invalid arguments fails`() {
        // Arrange
        // Act
        // Assert
        Token("", Clock.System.now().plus(5.hours))
    }
}