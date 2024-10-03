package pt.isel.ls.domain

import org.junit.Test
import kotlin.test.assertFailsWith

class PlayerTests {
    @Test
    fun `test player with negative id`() {
        assertFailsWith<IllegalArgumentException> { Player(-1, "name", "email") }
    }

    @Test
    fun `test player with blank name`() {
        assertFailsWith<IllegalArgumentException> { Player(1, "", "email") }
    }

    @Test
    fun `test player with blank email`() {
        assertFailsWith<IllegalArgumentException> { Player(1, "name", "") }
    }

    @Test
    fun `test player with invalid email`() {
        assertFailsWith<IllegalArgumentException> { Player(1, "name", "email") }
    }

    @Test
    fun `test playerPass with blank token`() {
        assertFailsWith<IllegalArgumentException> { PlayerPass("", "password") }
    }
}