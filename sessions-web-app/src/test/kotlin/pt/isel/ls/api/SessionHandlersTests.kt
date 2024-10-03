package pt.isel.ls.api

import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.JsonPrimitive
import org.http4k.core.Method
import org.http4k.core.Request
import org.junit.Test
import pt.isel.ls.api.handlers.SessionHandlers
import pt.isel.ls.db.MockDB
import kotlin.test.assertEquals

class SessionHandlersTests {

    private val db = MockDB()
    private val sessionHandlers = SessionHandlers(db)

    @Test
    fun `createSession Handler returns 201 CREATED`() {
        val request: Request = Request(Method.POST, "/sessions")
            .header("Authorization", "Bearer player1_token")
            .body(
                Json.encodeToString(SessionCreationRequest(1, "2021-05-05", "open", 1, listOf(1)))
            )
        val response = sessionHandlers.createSessionHandler(request)
        assertEquals(201, response.status.code)
    }

    @Test
    fun `createSession Handler returns 400 BAD_REQUEST when number of players is invalid`() {
        val request: Request = Request(Method.POST, "/sessions")
            .header("Authorization", "Bearer player1_token")
            .body(Json.encodeToString(SessionCreationRequest(0, "2021-05-05", "open", 1, listOf(1))))
        val response = sessionHandlers.createSessionHandler(request)
        assertEquals(400, response.status.code)
    }

    @Test
    fun `createSession Handler returns 400 BAD_REQUEST when date is invalid`() {
        val request: Request = Request(Method.POST, "/sessions")
            .header("Authorization", "Bearer player1_token")
            .body(Json.encodeToString(SessionCreationRequest(1, "2021-05-05T00:00:00", "open", 1, listOf(1))))
        val response = sessionHandlers.createSessionHandler(request)
        assertEquals(400, response.status.code)
    }

    @Test
    fun `createSession Handler returns NOT_FOUND when game does not exist`() {
        val request: Request = Request(Method.POST, "/sessions")
            .header("Authorization", "Bearer player1_token")
            .body(Json.encodeToString(SessionCreationRequest(1, "2021-05-05", "open", 0, listOf(1))))
        val response = sessionHandlers.createSessionHandler(request)
        assertEquals(404, response.status.code)
    }

    @Test
    fun `createSession Handler returns 400 BAD_REQUEST when players do not exist`() {
        val request: Request = Request(Method.POST, "/sessions")
            .header("Authorization", "Bearer player1_token")
            .body(Json.encodeToString(SessionCreationRequest(1, "2021-05-05", "open", 1, listOf(0))))
        val response = sessionHandlers.createSessionHandler(request)
        assertEquals(500, response.status.code)
    }

    @Test
    fun `addPlayer Handler returns 500 INTERNAL_SERVER_ERROR because player doesn't exist`() {
        val request: Request = Request(Method.PUT, "/sessions")
            .header("Authorization", "Bearer player1_token")
            .body(JsonObject(mapOf("sessionID" to JsonPrimitive(0), "playerID" to JsonPrimitive(122))).toString())
        val response = sessionHandlers.addPlayerHandler(request)
        assertEquals(500, response.status.code)
    }

    @Test
    fun `addPlayer Handler returns 500 INTERNAL_SERVER_ERROR because session doesn't exist`() {
        val request: Request = Request(Method.PUT, "/sessions")
            .header("Authorization", "Bearer player1_token")
            .body(JsonObject(mapOf("sessionID" to JsonPrimitive(300), "playerID" to JsonPrimitive(1))).toString())
        val response = sessionHandlers.addPlayerHandler(request)
        assertEquals(500, response.status.code)
    }

    /*@Test
    fun `fetchSessions Handler returns 200 OK`() {
        val request = Request(Method.GET, "/sessions?gid=1")
        val response = sessionHandlers.fetchSessionsHandler(request)
        assertEquals(200, response.status.code)
    }*/

    @Test
    fun `fetchSessions Handler returns 400 BAD_REQUEST because no game ID was included`() {
        val request = Request(Method.GET, "/sessions")
        val response = sessionHandlers.fetchSessionsHandler(request)
        assertEquals(400, response.status.code)
    }
}
