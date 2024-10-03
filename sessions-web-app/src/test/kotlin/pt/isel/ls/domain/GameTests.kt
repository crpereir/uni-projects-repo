package pt.isel.ls.domain

import org.junit.Test
import kotlin.test.assertFailsWith

class GameTests {
    @Test
    fun `test game with negative id`() {
        val id = -1
        assertFailsWith<IllegalArgumentException> { Game(id, "name", "developer", setOf("genre")) }
    }

    @Test
    fun `test game with empty name`() {
        val name = ""
        assertFailsWith<IllegalArgumentException> { Game(1, name, "developer", setOf("genre")) }
    }

    @Test
    fun `test game with empty developer`() {
        val developer = ""
        assertFailsWith<IllegalArgumentException> { Game(1, "name", developer, setOf("genre")) }
    }

    @Test
    fun `test game with empty genres`() {
        val genres = emptySet<String>()
        assertFailsWith<IllegalArgumentException> { Game(1, "name", "developer", genres) }
    }
}