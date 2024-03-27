package pt.isel.gomoku.http.dto

import pt.isel.gomoku.domain.users.Ranking
import pt.isel.gomoku.domain.users.UserStatistics

/**
 * The DTO used to represent a ranking obtained from the remote service.
 */
data class RankingDto(
    val totalUsers: Int,
    val ranking: List<UserStatisticsDto>,
) {

    /**
     * Convert [RankingDto] to [Ranking].
     */
    fun toRanking() = Ranking(
        totalUsers = totalUsers,
        ranking = ranking.map { uDto: UserStatisticsDto ->
            UserStatistics(
                userId = uDto.userId,
                username = uDto.username,
                rankingPosition = uDto.rankingPosition,
                gamesPlayed = uDto.gamesPlayed,
                gamesWon = uDto.gamesWon,
                gamesLost = uDto.gamesLost,
                gamesTied = uDto.gamesTied,
            )
        }
    )
}

/**
 * The DTO used to represent a user statistics obtained from the remote service.
 */
data class UserStatisticsDto(
    val userId: Int,
    val username: String,
    val rankingPosition: Int,
    val gamesPlayed: Int,
    val gamesWon: Int,
    val gamesLost: Int,
    val gamesTied: Int
)
