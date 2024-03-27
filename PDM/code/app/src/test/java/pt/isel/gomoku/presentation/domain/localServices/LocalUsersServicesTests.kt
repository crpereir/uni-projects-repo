package pt.isel.gomoku.presentation.domain.localServices

import kotlinx.coroutines.runBlocking
import org.junit.Test
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.services.local.LocalUsersService
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

class LocalUsersServicesTests {

    /**
     * NOTE: Assumes in these tests that:
     *      hrefTemplate = 'api/users/ranking/page=_'
     *      totalUsers = 30
     *      limit = 10
     */

    private val hrefTemplate = "/api/users/ranking?page="
    private val totalUsers = 30
    private val limit = 10

    @Test
    fun `initial fetch ranking`() {
        runBlocking {
            val ranking = usersService.fetchRanking(null)
            assertEquals(totalUsers, ranking.properties?.totalUsers)
            assertEquals(limit, ranking.properties?.ranking?.size)
            assertTrue(ranking.links.any { l -> l.rel.contains("next") })
            assertTrue(ranking.links.any { l -> l.rel.contains("last") })
        }
    }

    @Test
    fun `second page fetch ranking`() {
        runBlocking {
            val link = Link(listOf("next"), "$hrefTemplate${2}", emptyList())
            val ranking = usersService.fetchRanking(link)
            assertEquals(totalUsers, ranking.properties?.totalUsers)
            assertEquals(limit, ranking.properties?.ranking?.size)
            assertTrue(ranking.links.any { l -> l.rel.contains("first") })
            assertTrue(ranking.links.any { l -> l.rel.contains("last") })
            assertTrue(ranking.links.any { l -> l.rel.contains("previous") })
            assertTrue(ranking.links.any { l -> l.rel.contains("next") })
        }
    }

    @Test
    fun `last page fetch ranking`() {
        runBlocking {
            val link = Link(listOf("last"), "$hrefTemplate${3}", emptyList())
            val ranking = usersService.fetchRanking(link)
            assertEquals(totalUsers, ranking.properties?.totalUsers)
            assertEquals(limit, ranking.properties?.ranking?.size)
            assertTrue(ranking.links.any { l -> l.rel.contains("first") })
            assertTrue(ranking.links.any { l -> l.rel.contains("previous") })
        }
    }

    @Test
    fun `sign up`() {
        runBlocking {
            val result = usersService.signUp("user", "userEmail", "1234")
            assertNull(result.properties)
        }
    }

    @Test
    fun login() {
        runBlocking {
            val result = usersService.login("user", "1234")
            assertNotNull(result.properties)
        }
    }

    @Test
    fun me() {
        runBlocking {
            val result = usersService.me("token")
            assertNotNull(result.properties)
            assertEquals("local user1 ", result.properties?.username)
        }
    }

    @Test
    fun logout() {
        runBlocking {
            usersService.logout("token")
        }
    }

    companion object {
        val usersService = LocalUsersService()
    }
}