package pt.isel.gomoku.domain.users

import pt.isel.gomoku.domain.utils.Page

/**
 * Represents a ranking of [UserStatistics].
 * @property totalUsers total number of ranking users.
 * @property ranking list of [UserStatistics] of a ranking [Page].
 */
data class Ranking(
    val totalUsers: Int,
    val ranking: List<UserStatistics>,
) {

    init {
        require(totalUsers >= 0)
    }
}
