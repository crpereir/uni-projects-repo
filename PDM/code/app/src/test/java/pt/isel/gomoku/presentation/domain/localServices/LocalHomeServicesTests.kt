package pt.isel.gomoku.presentation.domain.localServices

import kotlinx.coroutines.runBlocking
import org.junit.Test
import pt.isel.gomoku.domain.services.local.LocalHomeService
import kotlin.test.assertEquals
import kotlin.test.assertNotNull

class LocalHomeServicesTests {

    @Test
    fun `fetch home`() {
        val homeService = LocalHomeService()
        runBlocking {
            val result = homeService.getHome()
            assertNotNull(result.properties)
            assertEquals("welcome", result.properties?.welcome)

        }
    }
}