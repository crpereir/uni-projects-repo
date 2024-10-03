package pt.isel.ls.api

import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import org.http4k.core.Method
import org.http4k.core.Request
import pt.isel.ls.api.handlers.AuthHandlers
import pt.isel.ls.db.MockDB
import kotlin.test.Test
import kotlin.test.assertEquals

class AuthHandlersTest {

    private val db = MockDB()
    private val authHandlers = AuthHandlers(db)

    @Serializable
    data class LoginResponse(val token: String)

    @Test
    fun `loginPlayerHandler returns BAD_REQUEST when no name is provided`() {
        val request = Request(Method.GET, "/login")
            .body(Json.encodeToString(PlayerLoginRequest("", "password")))
        val response = authHandlers.loginPlayerHandler(request)
        assertEquals(400, response.status.code)
        val responseBody = Json.decodeFromString<Map<String, String>>(response.bodyString())
        assertEquals("Name not provided", responseBody["error"])
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `loginPlayerHandler returns BAD_REQUEST when no password is provided`() {
        val request = Request(Method.GET, "/login")
            .body(Json.encodeToString(PlayerLoginRequest("name", "")))
        val response = authHandlers.loginPlayerHandler(request)
        assertEquals(400, response.status.code)
        val responseBody = Json.decodeFromString<Map<String, String>>(response.bodyString())
        assertEquals("Password not provided", responseBody["error"])
        assertEquals("application/json", response.header("Content-Type"))
    }

    @Test
    fun `loginPlayerHandler returns OK and returns token when login is valid`() {
        val request = Request(Method.GET, "/login")
            .body(Json.encodeToString(PlayerLoginRequest("Carlos", "password")))
        val response = authHandlers.loginPlayerHandler(request)
        val responseParams = Json.decodeFromString<LoginResponse>(response.bodyString())
        assertEquals(200, response.status.code)
        assertEquals("player1_token", responseParams.token)
    }
}
