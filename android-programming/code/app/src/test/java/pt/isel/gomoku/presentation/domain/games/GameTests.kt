package pt.isel.gomoku.presentation.domain.games

import org.junit.Test
import pt.isel.gomoku.domain.games.Board
import pt.isel.gomoku.domain.games.Game
import pt.isel.gomoku.domain.games.Intersection
import pt.isel.gomoku.domain.games.Piece
import pt.isel.gomoku.domain.games.Player
import pt.isel.gomoku.domain.games.isMyTurnNow
import pt.isel.gomoku.domain.services.exceptions.GameAlreadyEndedException
import pt.isel.gomoku.domain.services.exceptions.InvalidPositionException
import pt.isel.gomoku.domain.services.exceptions.NotYourTurnException
import pt.isel.gomoku.domain.services.exceptions.PositionAlreadyOccupiedException
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class GameTests {

    @Test
    fun `isGameOver returns false if game is not over`() {
        // Arrange
        val game = Game.standard

        // Act
        // Assert
        assertFalse(game.isOver())
    }

    @Test
    fun `isGameOver returns true if game is over`() {
        // Arrange
        val game = Game(
            board = Board(emptyList()),
            state = Game.State.WINNER_W,
            playingRoundTime = "5s"
        )

        // Act
        // Assert
        assertTrue(game.isOver())
    }

    @Test
    fun `isPlayValid returns if play is valid`() {
        // Arrange
        val game = Game.standard

        // Act
        // Assert
        game.isPlayValid(0, 0, 15, Player.B)
    }

    @Test(expected = GameAlreadyEndedException::class)
    fun `isPlayValid throw if game already ended`() {
        // Arrange
        val game = Game(
            board = Board(emptyList()),
            state = Game.State.WINNER_W,
            playingRoundTime = "5s"
        )

        // Act
        game.isPlayValid(0, 0, 15, Player.B)

        // Assert
    }

    @Test(expected = NotYourTurnException::class)
    fun `isPlayValid throw if not your turn`() {
        // Arrange
        val game = Game.standard

        // Act
        game.isPlayValid(0, 0, 15, Player.W)

        // Assert
    }

    @Test(expected = InvalidPositionException::class)
    fun `isPlayValid throw if the play was in an invalid position`() {
        // Arrange
        val game = Game.standard

        // Act
        game.isPlayValid(20, 20, 15, Player.B)

        // Assert
    }

    @Test(expected = PositionAlreadyOccupiedException::class)
    fun `isPlayValid throw if the play was in an position already occupied`() {
        // Arrange
        val game = Game(
            board = Board(listOf(Piece(Player.B, Intersection(0 ,0)))),
            state = Game.State.NEXT_TURN_W,
            playingRoundTime = "5s"
        )

        // Act
        game.isPlayValid(0, 0, 15, Player.W)

        // Assert
    }

    @Test
    fun `isMyTurnNow returns true if it's my turn to play`() {
        // Arrange
        // Act
        // Assert
        assertTrue((Player.B).isMyTurnNow(Game.State.NEXT_TURN_B))
    }

    @Test
    fun `isMyTurnNow returns false if it's not my turn to play`() {
        // Arrange
        // Act
        // Assert
        assertFalse((Player.W).isMyTurnNow(Game.State.NEXT_TURN_B))
    }
}