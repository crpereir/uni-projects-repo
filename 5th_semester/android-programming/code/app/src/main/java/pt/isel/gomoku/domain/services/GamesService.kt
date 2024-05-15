package pt.isel.gomoku.domain.services

import pt.isel.gomoku.domain.games.Game
import pt.isel.gomoku.domain.games.Monitor
import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.variants.Variant
import pt.isel.gomoku.domain.variants.Variants

/**
 * Contract of the service that provides operations on games.
 * The classes that implement the contract must have the Hypermedia Siren concept.
 *  @see <a href="https://github.com/kevinswiber/siren">Hypermedia Siren</a>
 */
interface GamesService {

    /**
     * Get the link relations of the games.
     * @return the [GameRels] or null.
     */
    fun getLinkRelations(): GameRels?

    /**
     * Get the action names of the games.
     * @return the [GameActionNames] or null.
     */
    fun getActionNames(): GameActionNames?

    /**
     * Get all variants.
     * @param link to get the resource or null if the link is not known.
     * @return the siren representation with the variants.
     * @throws IllegalArgumentException if the link is necessary and not passed.
     * @throws GomokuError [GomokuError].
     */
    suspend fun fetchVariants(token: String, link: Link? = null): Siren<Variants>

    /**
     * Start a game.
     * @param token the user's token.
     * @param variantId intended [Variant].
     * @param action to create the resource or null if the action is not known.
     * @return the siren representation mainly with the [Monitor] of start game or null if already started.
     * @throws IllegalArgumentException if the action is necessary and not passed.
     * @throws GomokuError [GomokuError].
     */
    suspend fun startGame(token: String, variantId: Int, action: Action? = null): Siren<Monitor?>

    /**
     * Monitor the start of a game.
     * @param token the user's token.
     * @param link to get the resource or null if the link is not known.
     * @return the siren representation mainly with the [Monitor] of start game.
     * @throws IllegalArgumentException if the link is necessary and not passed.
     * @throws GomokuError [GomokuError].
     */
    suspend fun statusMonitor(token: String, link: Link? = null): Siren<Monitor?>

    /**
     * Give up waiting for a game to start.
     * @param token the user's token.
     * @param action to give up or null if the action is not known.
     * @throws IllegalArgumentException if the action is necessary and not passed.
     * @throws GomokuError [GomokuError].
     */
    suspend fun deleteMonitor(token: String, action: Action? = null)

    /**
     * Get a game.
     * @param token the user's token.
     * @param link to get the resource or null if the link is not known.
     * @return the siren representation mainly with the game.
     * @throws IllegalArgumentException if the link is necessary and not passed.
     * @throws GomokuError [GomokuError].
     */
    suspend fun fetchGame(token: String, link: Link? = null): Siren<Game>

    /**
     * Apply a move to a game.
     * @param token the user's token.
     * @param gameId the game's id.
     * @param row the intended row.
     * @param column the intended column.
     * @param action to perform the move or null is not known.
     * @return the siren representation mainly with the updated game.
     * @throws IllegalArgumentException if the action is necessary and not passed.
     * @throws GomokuError [GomokuError].
     */
    suspend fun play(token: String, gameId: String, row: Int, column: Int, action: Action? = null): Siren<Game>

    /**
     * Give up on a game.
     * @param token the user's token.
     * @param action to give up or null if the action is not known.
     * @throws IllegalArgumentException if the action is necessary and not passed.
     * @throws GomokuError [GomokuError].
     */
    suspend fun giveUp(token: String, action: Action? = null)
}
