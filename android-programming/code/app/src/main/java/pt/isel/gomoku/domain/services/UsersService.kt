package pt.isel.gomoku.domain.services

import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.users.Ranking
import pt.isel.gomoku.domain.users.Token
import pt.isel.gomoku.domain.users.User

/**
 * Contract of the service that provides operations on users.
 * The classes that implement the contract must have the Hypermedia Siren concept.
 *  @see <a href="https://github.com/kevinswiber/siren">Hypermedia Siren</a>
 */
interface UsersService {

    /**
     * Get the link relations of the users.
     * @return the [UserRels] or null.
     */
    fun getLinkRelations(): UserRels?

    /**
     * Get the action names of the users.
     * @return the [UserActionNames] or null.
     */
    fun getActionNames(): UserActionNames?

    /**
     * Get a ranking.
     * @param link to get the resource or null if the link is not known.
     * @return the siren representation mainly with the ranking.
     * @throws IllegalArgumentException if the link is necessary and not passed.
     * @throws GomokuError [GomokuError].
     */
    suspend fun fetchRanking(link: Link? = null): Siren<Ranking>

    /**
     * Create a user.
     * @param username the intended user's username.
     * @param email the intended user's email.
     * @param password the intended user's password.
     * @param action to create the resource or null if the action is not known.
     * @return the siren representation mainly with the links and actions for subsequent requests.
     * @throws IllegalArgumentException if the action is necessary and not passed.
     * @throws GomokuError [GomokuError].
     */
    suspend fun signUp(
        username: String,
        email: String,
        password: String,
        action: Action? = null
    ): Siren<Any?>

    /**
     * Create a temporary token.
     * @param identity the user's identify (username or email).
     * @param password the user's password.
     * @param action to create the resource or null if the action is not known.
     * @return the siren representation mainly with the token.
     * @throws IllegalArgumentException if the action is necessary and not passed.
     * @throws GomokuError [GomokuError].
     */
    suspend fun login(identity: String, password: String, action: Action? = null): Siren<Token>

    /**
     * Get a user information.
     * @param token the user's token.
     * @param link to get the resource or null if the link is not known.
     * @return the siren representation mainly with the user.
     * @throws IllegalArgumentException if the link is necessary and not passed.
     * @throws GomokuError [GomokuError].
     */
    suspend fun me(token: String, link: Link? = null): Siren<User>

    /**
     * Revokes a temporary token created.
     * @param token the user's token.
     * @param action to revokes the resource or null if the action is not known.
     * @throws IllegalArgumentException if the action is necessary and not passed.
     * @throws GomokuError [GomokuError].
     */
    suspend fun logout(token: String, action: Action? = null)
}