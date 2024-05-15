package pt.isel.gomoku.http.dto

import pt.isel.gomoku.domain.games.Board
import pt.isel.gomoku.domain.games.Game
import pt.isel.gomoku.domain.games.Piece

/**
 * The DTO used to represent game obtained from the remote service.
 */
data class GameDto(
    val gameState: String,
    val playerB: Int,
    val playerW: Int,
    val playingRoundTime: String,
    val pieces: List<Piece>,
    val variantId: Int
) {

    /**
     * Convert [GameDto] to [Game].
     */
    fun toGame(): Game = Game(
        board = Board(pieces),
        state = enumValueOf(gameState),
        playingRoundTime = playingRoundTime
    )
}
