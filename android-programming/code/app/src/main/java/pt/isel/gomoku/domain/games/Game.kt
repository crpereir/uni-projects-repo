package pt.isel.gomoku.domain.games

import pt.isel.gomoku.domain.games.Game.State
import pt.isel.gomoku.domain.games.Game.State.DRAW
import pt.isel.gomoku.domain.games.Game.State.NEXT_TURN_B
import pt.isel.gomoku.domain.games.Game.State.NEXT_TURN_W
import pt.isel.gomoku.domain.games.Game.State.WINNER_B
import pt.isel.gomoku.domain.games.Game.State.WINNER_W
import pt.isel.gomoku.domain.services.exceptions.GameAlreadyEndedException
import pt.isel.gomoku.domain.services.exceptions.InvalidPositionException
import pt.isel.gomoku.domain.services.exceptions.NotYourTurnException
import pt.isel.gomoku.domain.services.exceptions.PositionAlreadyOccupiedException
import kotlin.time.Duration.Companion.minutes

/**
 * Represents the game.
 * @property board the current [Board] of the game.
 * @property state the current [State] of the game.
 * @property playingRoundTime the time to apply a round.
 */
data class Game(
    val board: Board,
    val state: State,
    val playingRoundTime: String,
) {

    /**
     * Check if play is valid.
     * @throws GameAlreadyEndedException if game is already ended.
     * @throws NotYourTurnException if it is not your turn to play.
     * @throws InvalidPositionException if position is invalid.
     * @throws PositionAlreadyOccupiedException if position is already occupied.
     *
     */
    fun isPlayValid(row: Int, column: Int, boardDim: Int, player: Player) {
        if (state != NEXT_TURN_B && state != NEXT_TURN_W) throw GameAlreadyEndedException
        if (!isMyTurnToPlay(player)) throw NotYourTurnException
        if (!isValidIntersection(row, column, boardDim)) throw InvalidPositionException
        val newIntersection = Intersection(row, column)
        if (board.pieces.any { piece -> piece.intersection == newIntersection })
            throw PositionAlreadyOccupiedException
    }

    /**
     * Check if game is over.
     */
    fun isOver(): Boolean =
        state == WINNER_B || state == WINNER_W || state == DRAW

    /**
     * Check if is my turn to play.
     */
    private fun isMyTurnToPlay(player: Player): Boolean =
        when (state) {
            NEXT_TURN_B -> player == Player.B
            NEXT_TURN_W -> player == Player.W
            else -> throw IllegalArgumentException("Invalid state.")
        }

    /**
     * Check if intersection is valid.
     */
    private fun isValidIntersection(row: Int, column: Int, boardDim: Int): Boolean =
        row in 0 until boardDim && column in 0 until boardDim

    /**
     * Represents all possible states in a game.
     * [NEXT_TURN_W] - It is the white player's turn to play.
     * [NEXT_TURN_B] - It is the black player's turn to play.
     * [WINNER_W] - The game is over and the white player wins.
     * [WINNER_B] - The game is over and the black player wins.
     * [DRAW] - The game ends in a draw.
     */
    enum class State {
        NEXT_TURN_W, NEXT_TURN_B, WINNER_W, WINNER_B, DRAW;
    }

    companion object {
        val standard = Game(
            board = Board(listOf()),
            state = NEXT_TURN_B,
            playingRoundTime = 5.minutes.toString()
        )

        const val CONSECUTIVE_PIECES_TO_WIN = 5
        const val OFFSET_TO_WIN = CONSECUTIVE_PIECES_TO_WIN - 1
    }
}

fun Player.isMyTurnNow(state: State) =
    when (this) {
        Player.B -> state == NEXT_TURN_B
        Player.W -> state == NEXT_TURN_W
        Player.UNKNOWN -> false
    }
