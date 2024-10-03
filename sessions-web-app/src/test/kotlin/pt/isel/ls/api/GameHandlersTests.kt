package pt.isel.ls.api

import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import org.http4k.core.Method
import org.http4k.core.Request
import pt.isel.ls.api.handlers.GameHandlers
import pt.isel.ls.db.MockDB
import pt.isel.ls.domain.dto.GameDto
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class GameHandlersTests {
    private val db = MockDB()
    private val gameHandlers = GameHandlers(db)
    @Test
    fun `createGameHandler returns BAD_REQUEST when game name is empty`() {
        val request = Request(Method.POST, "/games")
            .header("Authorization", "Bearer player1_token")
            .body(Json.encodeToString(GameCreationRequest("", "developer", setOf("genre"))))

        val response = gameHandlers.createGameHandler(request)
        assertEquals(400, response.status.code)
        val responseBody = Json.decodeFromString<Map<String, String>>(response.bodyString())
        assertEquals("Invalid Request", responseBody["error"])
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `createGameHandler returns BAD_REQUEST when game developer is empty`() {
        val request = Request(Method.POST, "/games")
            .header("Authorization", "Bearer player1_token")
            .body(Json.encodeToString(GameCreationRequest("name", "", setOf("genre"))))

        val response = gameHandlers.createGameHandler(request)
        assertEquals(400, response.status.code)
        val responseBody = Json.decodeFromString<Map<String, String>>(response.bodyString())
        assertEquals("Missing developer", responseBody["error"])
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `createGameHandler returns BAD_REQUEST when game genres is empty`() {
        val request = Request(Method.POST, "/games")
            .header("Authorization", "Bearer player1_token")
            .body(Json.encodeToString(GameCreationRequest("name", "developer", emptySet())))
        val response = gameHandlers.createGameHandler(request)
        assertEquals(400, response.status.code)
        val responseBody = Json.decodeFromString<Map<String, String>>(response.bodyString())
        assertEquals("Missing genres", responseBody["error"])
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `createGameHandler returns BAD_REQUEST when genre is unknown`() {
        val request = Request(Method.POST, "/games")
            .header("Authorization", "Bearer player1_token")
            .body(Json.encodeToString(GameCreationRequest("name", "developer", setOf("Unknown genre"))))
        val response = gameHandlers.createGameHandler(request)
        assertEquals(400, response.status.code)
        val responseBody = Json.decodeFromString<Map<String, String>>(response.bodyString())
        assertEquals("Invalid genres", responseBody["error"])
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `missing bearer token`() {
        val request = Request(Method.POST, "/games")
            .body(Json.encodeToString(GameCreationRequest("name", "developer", setOf("genre"))))
        val response = gameHandlers.createGameHandler(request)
        assertEquals(401, response.status.code)
        val responseBody = Json.decodeFromString<Map<String, String>>(response.bodyString())
        assertEquals("Unauthorized", responseBody["error"])
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `non existent token`() {
        val request = Request(Method.POST, "/games")
            .header("Authorization", "Bearer non-existent token")
            .body(Json.encodeToString(GameCreationRequest("name", "developer", setOf("genre"))))
        val response = gameHandlers.createGameHandler(request)
        assertEquals(401, response.status.code)
        val responseBody = Json.decodeFromString<Map<String, String>>(response.bodyString())
        assertEquals("Unauthorized", responseBody["error"])
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `gameDetailsHandler returns NOT_FOUND when ID does not exist`() {
        val request = Request(Method.GET, "/games/0")
        val response = gameHandlers.gameDetailsHandler(request)
        val responseBody = Json.decodeFromString<Map<String, String>>(response.bodyString())
        assertEquals("application/json", response.header("Content-Type"))
        assertEquals(404, response.status.code)
        assertEquals("Game with provided ID does not exist", responseBody["error"])
    }

    @Test
    fun `fetchGamesHandler returns BAD_REQUEST when limit is negative`() {
        val request = Request(Method.GET, "/games?limit=-1")
        val response = gameHandlers.fetchGamesHandler(request)
        assertEquals(400, response.status.code)
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `fetchGamesHandler returns BAD_REQUEST when skip is negative`() {
        val request = Request(Method.GET, "/games?skip=-1")
        val response = gameHandlers.fetchGamesHandler(request)
        assertEquals(400, response.status.code)
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `fetchGamesHandler returns not empty list when game exists`() {
        val request = Request(Method.GET, "/games/search?name=The Witcher 3")
        val response = gameHandlers.fetchGamesHandler(request)
        assertEquals(200, response.status.code)
        val gameList = Json.decodeFromString<List<GameDto>>(response.bodyString())
        assertTrue(gameList.isNotEmpty())
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `fetchGamesHandler returns empty list when game doesn't exists`() {
        val request = Request(Method.GET, "/games/search?name=thisgamedoesnotexist")
        val response = gameHandlers.fetchGamesHandler(request)
        assertEquals(200, response.status.code)
        val gameList = Json.decodeFromString<List<GameDto>>(response.bodyString())
        assertTrue(gameList.isEmpty())
        assertEquals("application/json", response.header("Content-Type"))
    }
}
