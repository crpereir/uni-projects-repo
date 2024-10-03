package pt.isel.ls.api.handlers

import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import org.http4k.core.Request
import org.http4k.core.Response
import org.http4k.core.Status
import org.http4k.routing.path
import pt.isel.ls.api.PlayerCreationRequest
import pt.isel.ls.api.logInternalError
import pt.isel.ls.db.DB
import pt.isel.ls.db.DBFactory
import pt.isel.ls.domain.dto.GameDto
import pt.isel.ls.domain.dto.PlayerDto
import pt.isel.ls.domain.dto.SessionDto
import pt.isel.ls.server.requestLogger

class PlayerHandlers(val db: DBFactory = DB()) {

    fun createPlayerHandler(request: Request): Response {
        requestLogger(request)
        return try {
            val player = Json.decodeFromString<PlayerCreationRequest>(request.bodyString())

            if (player.name.isEmpty() || player.email.isEmpty() || !player.email.contains("@")) {
                Response(Status.BAD_REQUEST)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Invalid Request")))
            } else {
                val playerID = db.createPlayer(player.name, player.email, player.password)
                Response(Status.CREATED)
                    .body(Json.encodeToString(mapOf("token" to playerID)))
                    .header("Content-Type", "application/json")
            }
        } catch (e: Exception) {
            logInternalError(e)
            Response(Status.INTERNAL_SERVER_ERROR)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "${e.message}")))
        }
    }

    fun getPlayerSessions(request: Request): Response {
        requestLogger(request)
        val limit = request.query("limit")?.toIntOrNull() ?: 1000
        val skip = request.query("skip")?.toIntOrNull() ?: 0

        return try {
            val id = request.path("id")?.toIntOrNull()
            if (id == null) {
                Response(Status.BAD_REQUEST)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Invalid Request")))
            } else {
                val sessions = db.getPlayerSessions(id)
                var sessionsDetails = sessions.map {
                    SessionDto(
                        it.id,
                        it.numberOfPlayers,
                        it.date,
                        it.state,
                        GameDto(it.game.id, it.game.name, it.game.developer, it.game.genres),
                        it.players.map { player -> PlayerDto(player.id, player.name, player.email) },
                        it.ownerID
                    )
                }
                sessionsDetails = sessionsDetails.drop(skip).take(limit)
                Response(Status.OK)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(sessionsDetails))
            }
        } catch (e: Exception) {
            logInternalError(e)
            Response(Status.INTERNAL_SERVER_ERROR)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "${e.message}")))
        }
    }

    fun playerDetailsHandler(request: Request): Response {
        requestLogger(request)
        return try {
            val id = request.path("id")?.toIntOrNull()
            if (id == null) {
                Response(Status.BAD_REQUEST)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Invalid Request")))
            } else {
                val player = db.getPlayerDetails(id)
                val playerDetails = PlayerDto(player.id, player.name, player.email)
                Response(Status.OK)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(playerDetails))
            }
        } catch (e: Exception) {
            logInternalError(e)
            println(e.message)
            if (e.message == "Player not found") {
                return Response(Status.NOT_FOUND)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "${e.message}")))
            } else {
                Response(Status.INTERNAL_SERVER_ERROR)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "${e.message}")))
            }
        }
    }

    fun searchPlayerByNameHandler(request: Request): Response {
        requestLogger(request)
        val limit = request.query("limit")?.toIntOrNull() ?: 1000
        val skip = request.query("skip")?.toIntOrNull() ?: 0
        val name = request.query("name")
        return try {
            if (name == null) {
                Response(Status.BAD_REQUEST)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Invalid Request")))
            } else {
                val players = db.searchPlayerByName(name)
                var playersDetails = players.map {
                    PlayerDto(it.id, it.name, it.email)
                }
                playersDetails = playersDetails.drop(skip).take(limit)
                Response(Status.OK)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(playersDetails))
            }
        } catch (e: Exception) {
            logInternalError(e)
            Response(Status.INTERNAL_SERVER_ERROR)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "${e.message}")))
        }
    }

    fun getIdByToken(request: Request): Response {
        requestLogger(request)
        val token = request.query("token")

        try {
            if (token == null) {
                return Response(Status.BAD_REQUEST)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "ID not provided")))
            } else {
                val playerId = db.getIdByToken(token)

                if (playerId.isBlank()) {
                    return Response(Status.BAD_REQUEST)
                        .header("Content-Type", "application/json")
                        .body(Json.encodeToString(mapOf("error" to "Player not found")))
                }

                return Response(Status.OK)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("id" to playerId)))
            }
        } catch (e: Exception) {
            logInternalError(e)
            println(e)
            return Response(Status.INTERNAL_SERVER_ERROR)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "${e.message}")))
        }
    }
}
