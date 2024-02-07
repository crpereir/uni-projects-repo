package pt.isel.gomoku.domain.games

/**
 * Represents the type of player in game.
 * [B] -> Represents player with black pieces.
 * [W] -> Represents player with white pieces.
 * [UNKNOWN] -> Represents player that does not have defined color yet.
 */
enum class Player {
    B, W, UNKNOWN
}
