package pt.isel.gomoku.domain.users

/**
 * Represents a user's statistics.
 * @property userId the user's identifier.
 * @property username the user's username.
 * @property rankingPosition current position in the ranking.
 * @property gamesPlayed number of games played.
 * @property gamesWon number of games won.
 * @property gamesLost number of games lost.
 * @property gamesTied number of games tied.
 */
data class UserStatistics(
    val userId: Int,
    val username: String,
    val rankingPosition: Int,
    val gamesPlayed: Int,
    val gamesWon: Int,
    val gamesLost: Int,
    val gamesTied: Int
) {

    init {
        require(
            userId >= 0 &&
                    username.isNotBlank() &&
                    rankingPosition >= 0 &&
                    gamesPlayed >= 0 &&
                    gamesWon >= 0 &&
                    gamesLost >= 0 &&
                    gamesTied >= 0
        )
    }
}
