package pt.isel.ls.api

import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import org.http4k.core.Method
import org.http4k.core.Request
import pt.isel.ls.api.handlers.PlayerHandlers
import pt.isel.ls.db.MockDB
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class PlayerHandlersTests {
    private val playerHandlers = PlayerHandlers(MockDB())
    @Test
    fun `createPlayerHandler returns BAD_REQUEST when player name is empty`() {
        val request = Request(Method.POST, "/players").body(
            Json.encodeToString(PlayerCreationRequest("", "email", "password"))
        )
        val response = playerHandlers.createPlayerHandler(request)
        assertEquals(400, response.status.code)
        val responseBody = Json.decodeFromString<Map<String, String>>(response.bodyString())
        assertEquals("Invalid Request", responseBody["error"])
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `createPlayerHandler returns BAD_REQUEST when player email is empty`() {
        val request = Request(Method.POST, "/players").body(
            Json.encodeToString(PlayerCreationRequest("name", "", "password"))
        )
        val response = playerHandlers.createPlayerHandler(request)
        assertEquals(400, response.status.code)
        val responseBody = Json.decodeFromString<Map<String, String>>(response.bodyString())
        assertEquals("Invalid Request", responseBody["error"])
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `createPlayerHandler returns BAD_REQUEST when player email is invalid`() {
        val request = Request(Method.POST, "/players").body(
            Json.encodeToString(PlayerCreationRequest("name", "email", "password"))
        )
        val response = playerHandlers.createPlayerHandler(request)
        assertEquals(400, response.status.code)
        val responseBody = Json.decodeFromString<Map<String, String>>(response.bodyString())
        assertEquals("Invalid Request", responseBody["error"])
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `createPlayerHandler returns BAD_REQUEST when no password is provided`() {
        val request = Request(Method.POST, "/players").body(
            Json.encodeToString(PlayerCreationRequest("name", "email", "password"))
        )
        val response = playerHandlers.createPlayerHandler(request)
        assertEquals(400, response.status.code)
        val responseBody = Json.decodeFromString<Map<String, String>>(response.bodyString())
        assertEquals("Invalid Request", responseBody["error"])
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `playerDetailsHandler returns INTERNAL_SERVER_ERROR when ID does not exist`() {
        val request = Request(Method.GET, "/players/0")
        val response = playerHandlers.playerDetailsHandler(request)
        assertEquals(500, response.status.code)
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `getIdByTokenHandler returns BAD_REQUEST when token is not provided`() {
        val request = Request(Method.GET, "/players/get-id")
        val response = playerHandlers.getIdByToken(request)
        val responseBody = Json.decodeFromString<Map<String, String>>(response.bodyString())
        assertEquals("application/json", response.header("Content-Type"))
        assertEquals(400, response.status.code)
        assertEquals("ID not provided", responseBody["error"])
    }

    @Test
    fun `getIdByTokenHandler returns BAD_REQUEST when token does not exist`() {
        val request = Request(Method.GET, "/players/get-id?token=nonexistenttoken")
        val response = playerHandlers.getIdByToken(request)
        val responseBody = Json.decodeFromString<Map<String, String>>(response.bodyString())
        assertEquals("application/json", response.header("Content-Type"))
        assertEquals(400, response.status.code)
        assertEquals("Player not found", responseBody["error"])
    }

    @Test
    fun`getIdByTokenHandler returns OK when request is valid`() {
        val request = Request(Method.GET, "/players/get-id?token=player1_token")
        val response = playerHandlers.getIdByToken(request)
        assertEquals("application/json", response.header("Content-Type"))
        assertEquals(200, response.status.code)
        assertTrue(response.bodyString().contains("id"))
    }
}
