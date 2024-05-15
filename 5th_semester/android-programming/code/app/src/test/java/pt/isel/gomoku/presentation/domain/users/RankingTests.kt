package pt.isel.gomoku.presentation.domain.users

import org.junit.Test
import pt.isel.gomoku.domain.users.Ranking

class RankingTests {

    @Test
    fun `create ranking with valid arguments succeeds`() {
        // Arrange
        // Act
        // Assert
        Ranking(0, emptyList())
    }

    @Test(expected = IllegalArgumentException::class)
    fun `create ranking with invalid arguments fails`() {
        // Arrange
        // Act
        // Assert
        Ranking(-5, emptyList())
    }
}