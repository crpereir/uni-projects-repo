package pt.isel.gomoku.domain.services

/**
* Contract of home action names to the [HomeService].
*/
interface HomeActionNames {

    /**
     * Action name to signup.
     * Corresponding to [UsersService.signUp]
     */
    val SIGNUP: String

    /**
     * Action name to login.
     * Corresponding to [UsersService.login]
     */
    val LOGIN: String
}

/**
 * Contract of users action names to the [UsersService].
 */
interface UserActionNames {

    /**
     * Action name to signup.
     * Corresponding to [UsersService.signUp]
     */
    val SIGNUP: String

    /**
     * Action name to login.
     * Corresponding to [UsersService.login]
     */
    val LOGIN: String

    /**
     * Action name to logout.
     * Corresponding to [UsersService.logout]
     */
    val LOGOUT: String
}

/**
 * Contract of games action names to the [GamesService].
 */
interface GameActionNames {

    /**
     * Action name to start game.
     * Corresponding to [GamesService.startGame]
     */
    val START: String

    /**
     * Action name to give up waiting.
     * Corresponding to [GamesService.deleteMonitor]
     */
    val CANCEL_START: String

    /**
     * Action name to perform play.
     * Corresponding to [GamesService.play]
     */
    val PLAY: String

    /**
     * Action name to give up on game.
     * Corresponding to [GamesService.play]
     */
    val GIVE_UP: String
}
