package pt.isel.gomoku.presentation.domain.games

import org.junit.Test
import pt.isel.gomoku.domain.games.Intersection

class IntersectionTests {

    @Test
    fun `create intersection with valid arguments succeeds`() {
        // Arrange
        // Act
        // Assert
        Intersection(0, 0)
    }

    @Test(expected = IllegalArgumentException::class)
    fun `create ranking with invalid arguments fails`() {
        // Arrange
        // Act
        // Assert
        Intersection(-1, -1)
    }
}