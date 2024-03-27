package pt.isel.gomoku.domain.services

/**
 * Contract of link relations to the [HomeService].
 */
interface HomeRels {

    /**
     * Link relation to fetch ranking.
     * Corresponding to [UsersService.fetchRanking]
     */
    val RANKING: String

    /**
     * Link relation to fetch "me".
     * Corresponding to [UsersService.me]
     */
    val USER_HOME: String
}

/**
 * Contract of link relations to the [UsersService].
 */
interface UserRels {

    /**
     * Self link relation.
     */
    val SELF: String

    /**
     * Previous link relation.
     */
    val PREVIOUS: String

    /**
     * Next link relation.
     */
    val NEXT: String

    /**
     * First link relation.
     */
    val FIRST: String

    /**
     * Last link relation.
     */
    val LAST: String

    /**
     * Link relation to fetch "me".
     * Corresponding to [UsersService.me]
     */
    val USER_HOME: String

    /**
     * Link relation to fetch ranking.
     * Corresponding to [UsersService.fetchRanking]
     */
    val RANKING: String

    /**
     * Link relation to fetch user statistics.
     */
    val STATISTICS: String
}

/**
 * Contract of link relations to the [GamesService].
 */
interface GameRels {

    /**
     * Self link relation.
     */
    val SELF: String

    /**
     * Link relation to fetch variants.
     * Corresponding to [GamesService.fetchVariants]
     */
    val VARIANTS: String

    /**
     * Link relation to fetch a variant.
     */
    val VARIANT: String

    /**
     * Link relation to fetch the game.
     * Corresponding to [GamesService.fetchGame]
     */
    val GAME: String

    /**
     * Link relation to fetch the monitor.
     * Corresponding to [GamesService.statusMonitor]
     */
    val MONITOR: String
}
