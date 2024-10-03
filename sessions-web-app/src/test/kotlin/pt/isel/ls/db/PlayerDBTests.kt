package pt.isel.ls.db

import org.junit.Assert.*
import kotlin.test.Test

class PlayerDBTests {

    private val db = MockDB()

    @Test
    fun `create a player`() {
        val token = db.createPlayer("John", "john@example.com", "password")
        assertNotNull(token)
        val player = db.players.find { it.name == "John" }
        assertNotNull(player)
        assertEquals("John", player?.name)
        assertEquals("john@example.com", player?.email)
    }

    @Test
    fun `get player details`() {
        val player = db.getPlayerDetails(1)
        assertEquals(1, player.id)
        assertEquals("Carlos", player.name)
        assertEquals("carlos@example.com", player.email)
    }

    @Test
    fun `get player sessions`() {
        val playerSessions = db.getPlayerSessions(1)
        assertTrue(playerSessions.isNotEmpty())
        assertEquals(1, playerSessions[0].ownerID)
    }

    @Test
    fun `login player`() {
        val token = db.loginPlayer("Carlos", "password")
        assertEquals("player1_token", token)
    }

    @Test
    fun `search player by name`() {
        val players = db.searchPlayerByName("testsearch")
        assertTrue(players.isNotEmpty())
        assertEquals("testsearch", players[0].name)
    }

    @Test
    fun `authenticate player`() {
        val isAuthenticated = db.authenticate("player1_token")
        assertTrue(isAuthenticated)
    }
}