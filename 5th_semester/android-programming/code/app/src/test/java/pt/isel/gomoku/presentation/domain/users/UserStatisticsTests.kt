package pt.isel.gomoku.presentation.domain.users

import org.junit.Test
import pt.isel.gomoku.domain.users.UserStatistics

class UserStatisticsTests {

    @Test
    fun `create an user statistics with valid arguments succeeds`() {
        // Arrange
        // Act
        // Assert
        UserStatistics(
            userId = 1,
            username = "user1",
            rankingPosition = 1,
            gamesPlayed = 0,
            gamesWon = 0,
            gamesLost = 0,
            gamesTied = 0
        )
    }

    @Test(expected = IllegalArgumentException::class)
    fun `create an user statistics with invalid arguments fails`() {
        // Arrange
        // Act
        // Assert
        UserStatistics(
            userId = -1,
            username = "",
            rankingPosition = -1,
            gamesPlayed = -1,
            gamesWon = -1,
            gamesLost = -1,
            gamesTied = -1
        )
    }
}