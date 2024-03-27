package pt.isel.gomoku.presentation.domain.users

import kotlinx.datetime.Clock
import org.junit.Test
import pt.isel.gomoku.domain.users.UserInfo
import kotlin.time.Duration.Companion.hours

class UserInfoTests {

    @Test
    fun `create user info with valid arguments succeeds`() {
        // Arrange
        // Act
        // Assert
        UserInfo("user", "token", Clock.System.now().plus(5.hours))
    }

    @Test(expected = IllegalArgumentException::class)
    fun `create user info with invalid arguments fails`() {
        // Arrange
        // Act
        // Assert
        UserInfo("", "", Clock.System.now().plus(5.hours))
    }
}