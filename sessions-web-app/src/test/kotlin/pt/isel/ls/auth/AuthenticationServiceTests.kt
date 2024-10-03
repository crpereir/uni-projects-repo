package pt.isel.ls.auth

import pt.isel.ls.db.MockDB
import pt.isel.ls.services.AuthenticationService
import kotlin.test.Test
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class AuthenticationServiceTests {
    private val sut = AuthenticationService(MockDB())
    @Test
    fun `test authenticate with non-existent token`() {
        assertFalse(sut.authenticate("non-existent-token"))
    }

    @Test
    fun `test authenticate with existent token`() {
        assertTrue(sut.authenticate("player1_token"))
    }
}
