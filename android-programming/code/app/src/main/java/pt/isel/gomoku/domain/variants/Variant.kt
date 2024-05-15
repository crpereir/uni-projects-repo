package pt.isel.gomoku.domain.variants

/**
 * Represents a game variant.
 * @property variantId variant identifier.
 * @property boardDim size of board.
 * @property openingRules [OpeningRules]
 * @property openingRules [PlayingRules]
 *
 */
data class Variant(
    val variantId: Int,
    val boardDim: Int,
    val openingRules: OpeningRules,
    val playingRules: PlayingRules
) {

    init {
        require(variantId >= 0 && boardDim >= 0)
    }
}
