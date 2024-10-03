package pt.isel.ls.db

import org.junit.Assert.assertEquals
import kotlin.test.Test
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

class GameDBTests {

    private val db = MockDB()

    @Test
    fun `create a game`() {
        val gameID = db.createGame("Cyberpunk 2077", "CD Projekt Red", setOf("RPG"))
        val game = db.games.find { it.id == gameID }
        assertNotNull(game)
        assertEquals("Cyberpunk 2077", game.name)
        assertEquals("CD Projekt Red", game.developer)
    }

    @Test
    fun `get game details`() {
        val game = db.getGameDetails(1)
        if (game != null) {
            assertEquals(1, game.id)
        }
        if (game != null) {
            assertEquals("The Witcher 3", game.name)
        }
        if (game != null) {
            assertEquals("CD Projekt Red", game.developer)
        }
    }

    @Test
    fun `get games by name`() {
        val games = db.getGames("The Witcher 3", setOf(), "")
        assertTrue(games.isNotEmpty())
        assertEquals("The Witcher 3", games[0].name)
    }

    @Test
    fun `get games by genre`() {
        val games = db.getGames("", setOf("RPG"), "")
        assertTrue(games.isNotEmpty())
        assertTrue(games[0].genres.contains("RPG"))
    }

    @Test
    fun `get games by developer`() {
        val games = db.getGames("", setOf(), "CD Projekt Red")
        assertTrue(games.isNotEmpty())
        assertEquals("CD Projekt Red", games[0].developer)
    }
}