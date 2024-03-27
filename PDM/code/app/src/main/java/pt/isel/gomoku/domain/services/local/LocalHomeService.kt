package pt.isel.gomoku.domain.services.local

import pt.isel.gomoku.domain.home.Home
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.services.HomeActionNames
import pt.isel.gomoku.domain.services.HomeRels
import pt.isel.gomoku.domain.services.HomeService

/**
 * Local implementation of the [HomeService].
 * Mainly used for testing.
 */
class LocalHomeService : HomeService {
    override fun getLinkRelations(): HomeRels? = null

    override fun getActionNames(): HomeActionNames? = null

    override suspend fun getHome(): Siren<Home> =
        emptySiren(Home(welcome = "welcome"))
}