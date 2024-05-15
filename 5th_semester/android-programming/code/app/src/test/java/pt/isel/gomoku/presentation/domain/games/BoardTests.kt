package pt.isel.gomoku.presentation.domain.games

import org.junit.Test
import pt.isel.gomoku.domain.games.Board
import pt.isel.gomoku.domain.games.Intersection
import pt.isel.gomoku.domain.games.Piece
import pt.isel.gomoku.domain.games.Player
import kotlin.test.assertEquals

class BoardTests {

    @Test
    fun `get a player on an intersection on board`() {
        // Arrange
        val sut = Board(
            listOf(
                Piece(Player.B, Intersection(0,0)),
                Piece(Player.W, Intersection(1,1))
            )
        )

        // Act
        val actual1 = sut[0, 0]
        val actual2 = sut[1, 1]

        // Assert
        assertEquals(Player.B, actual1)
        assertEquals(Player.W, actual2)
    }

    @Test
    fun `get null if a player is not at an board intersection`() {
        // Arrange
        val sut = Board(
            listOf(
                Piece(Player.B, Intersection(0,0)),
                Piece(Player.W, Intersection(1,1))
            )
        )

        // Act
        val actual1 = sut[3, 3]

        // Assert
        assertEquals(null, actual1)
    }
}