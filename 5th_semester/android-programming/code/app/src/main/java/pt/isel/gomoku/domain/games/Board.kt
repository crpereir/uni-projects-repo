package pt.isel.gomoku.domain.games

/**
 * Represents the board of the [Game].
 * @property pieces list of [Piece]s of the game.
 */
data class Board(val pieces: List<Piece>) {

    /**
     * Get the player who is at an [Intersection].
     * @param row the row of the board.
     * @param column the column of the board.
     * @return the player in that position, if any, or null otherwise.
     */
    operator fun get(row: Int, column: Int): Player? =
        pieces.find { piece -> piece.intersection == Intersection(row, column) }?.player
}
