package pt.isel.ls.api.handlers

import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import org.http4k.core.Request
import org.http4k.core.Response
import org.http4k.core.Status
import pt.isel.ls.api.PlayerLoginRequest
import pt.isel.ls.api.logInternalError
import pt.isel.ls.db.DB
import pt.isel.ls.db.DBFactory
import pt.isel.ls.server.requestLogger

class AuthHandlers(
    val db: DBFactory = DB()
) {
    fun loginPlayerHandler(request: Request): Response {
        requestLogger(request)
        try {
            val loginRequest = Json.decodeFromString<PlayerLoginRequest>(request.bodyString())
            val name = loginRequest.name
            val password = loginRequest.password

            if (name.isBlank()) {
                return Response(Status.BAD_REQUEST)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Name not provided")))
            } else if (password.isBlank()) {
                return Response(Status.BAD_REQUEST)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Password not provided")))
            }

            val token = db.loginPlayer(name, password)

            return Response(Status.OK)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("token" to token)))
        } catch (e: Exception) {
            logInternalError(e)
            return Response(Status.UNAUTHORIZED)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "${e.message}")))
        }
    }
}
