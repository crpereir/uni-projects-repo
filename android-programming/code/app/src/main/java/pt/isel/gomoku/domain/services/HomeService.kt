package pt.isel.gomoku.domain.services

import pt.isel.gomoku.domain.home.Home
import pt.isel.gomoku.domain.infra.Siren

/**
 * Contract of the service that provides operations on home.
 * The classes that implement the contract must have the Hypermedia Siren concept.
 *  @see <a href="https://github.com/kevinswiber/siren">Hypermedia Siren</a>
 */
interface HomeService {

    /**
     * Gets the link relations of the home.
     * @return the [HomeRels] or null.
     */
    fun getLinkRelations(): HomeRels?

    /**
     * Gets the action names of the home.
     * @return the [HomeActionNames] or null.
     */
    fun getActionNames(): HomeActionNames?

    /**
     * Gets the home.
     * @return the siren representation mainly with the navigation links and actions.
     * @throws GomokuError [GomokuError].
     */
    suspend fun getHome(): Siren<Home>
}

