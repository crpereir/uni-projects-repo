package pt.isel.ls.domain

import org.junit.Test
import kotlin.test.assertFailsWith

class SessionTests {
    @Test
    fun `test session with negative number of players`() {
        val numberOfPlayers = -1
        assertFailsWith<IllegalArgumentException> { Session(1, numberOfPlayers, "2020-01-01", "state", Game(1, "name", "developer", setOf("genre")), emptyList(), 1) }
    }

    @Test
    fun `test session with invalid date`() {
        val date = "2020-01-01T00:00:00"
        assertFailsWith<IllegalArgumentException> { Session(1, 1, date, "state", Game(1, "name", "developer", setOf("genre")), emptyList(), 1) }
    }

    @Test
    fun `test session with more players than allowed`() {
        val players = listOf(Player(1, "name", "email@email.com"))
        assertFailsWith<IllegalArgumentException> { Session(1, 1, "2020-01-01", "state", Game(1, "name", "developer", setOf("genre")), players + players, 1) }
    }

    @Test fun `test session with repeated player ids`() {
        val players = listOf(Player(1, "name", "email1@email.com"), Player(1, "name", "email1@email.com"))
        assertFailsWith<IllegalArgumentException> { Session(1, 1, "2020-01-01", "state", Game(1, "name", "developer", setOf("genre")), players, 1) }
    }
}