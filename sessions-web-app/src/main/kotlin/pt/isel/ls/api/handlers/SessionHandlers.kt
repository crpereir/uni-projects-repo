package pt.isel.ls.api.handlers

import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.int
import kotlinx.serialization.json.jsonObject
import kotlinx.serialization.json.jsonPrimitive
import org.http4k.core.Request
import org.http4k.core.Response
import org.http4k.core.Status
import org.http4k.routing.path
import pt.isel.ls.api.SessionCreationRequest
import pt.isel.ls.api.logInternalError
import pt.isel.ls.db.DB
import pt.isel.ls.db.DBFactory
import pt.isel.ls.domain.Game
import pt.isel.ls.domain.Player
import pt.isel.ls.domain.Session
import pt.isel.ls.domain.dto.GameDto
import pt.isel.ls.domain.dto.PlayerDto
import pt.isel.ls.domain.dto.SessionDto
import pt.isel.ls.server.requestLogger

class SessionHandlers(val db: DBFactory = DB()) {

    fun createSessionHandler(request: Request): Response {
        requestLogger(request)
        return try {
            val session = Json.decodeFromString<SessionCreationRequest>(request.bodyString())
            val gameDetails = db.getGameDetails(session.game)
            val bearer = getBearerToken(request)
                ?: return Response(Status.UNAUTHORIZED)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Unauthorized")))

            if (!db.authenticate(bearer)) {
                return Response(Status.UNAUTHORIZED)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Unauthorized")))
            }

            if (gameDetails == null) {
                return Response(Status.NOT_FOUND)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Invalid game")))
            }

            val game = Game(
                session.game,
                gameDetails.name,
                gameDetails.developer,
                gameDetails.genres
            )
            val players = session.players.mapNotNull {
                val details = db.getPlayerDetails(it)
                Player(it, details.name, details.email)
            }.toList()

            val owner = players.first().id

            if (session.numberOfPlayers <= 0 || players.size > session.numberOfPlayers || session.date.isBlank() || !session.date.matches(
                    Regex("\\d{4}-\\d{2}-\\d{2}")
                ) || players.isEmpty()
            ) {
                Response(Status.BAD_REQUEST).body(
                    Json.encodeToString(mapOf("error" to "Invalid request: \n" + "Either the number of players is invalid, the date is invalid, the game does not exist or the players do not exist. \n"))
                )
            } else {
                val sessionID =
                    db.createSession(session.numberOfPlayers, session.date, session.state, game, players, owner)
                Response(Status.CREATED)
                    .header(
                        "Content-Type", "application/json"
                    )
                    .body(Json.encodeToString(mapOf("id" to sessionID)))
            }
        } catch (e: Exception) {
            logInternalError(e)
            Response(Status.INTERNAL_SERVER_ERROR)
                .header(
                    "Content-Type", "application/json"
                )
                .body(Json.encodeToString(mapOf("error" to "${e.message}")))
        }
    }

    fun updateSessionHandler(request: Request): Response {
        requestLogger(request)
        return try {
            val body = request.bodyString()
            val jsonBody = Json.parseToJsonElement(body)
            val sid = request.path("id")?.toIntOrNull()
            val numberOfPlayers = jsonBody.jsonObject["numberOfPlayers"]?.jsonPrimitive?.int
            val date = jsonBody.jsonObject["date"]?.jsonPrimitive?.content

            val bearer = getBearerToken(request)
                ?: return Response(Status.UNAUTHORIZED)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Unauthorized")))

            if (!db.authenticate(bearer)) {
                return Response(Status.UNAUTHORIZED)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Unauthorized")))
            }

            if (sid == null || numberOfPlayers == null || date == null) {
                Response(Status.BAD_REQUEST)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Invalid request: The session ID, number of players or date is invalid.")))
            } else {
                try {
                    db.updateSession(sid, numberOfPlayers, date)
                    Response(Status.OK)
                        .header("Content-Type", "application/json")
                        .body(Json.encodeToString(mapOf("success:" to "Session updated successfully")))
                } catch (e: Exception) {
                    logInternalError(e)
                    Response(Status.INTERNAL_SERVER_ERROR)
                        .body(Json.encodeToString(mapOf("error" to "${e.message}")))
                }
            }
        } catch (e: Exception) {
            logInternalError(e)
            Response(Status.INTERNAL_SERVER_ERROR)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "${e.message}")))
        }
    }

    fun removePlayerFromSessionHandler(request: Request): Response {
        requestLogger(request)
        return try {
            val sid = request.path("id")?.toIntOrNull()
            val pid = request.path("pid")?.toIntOrNull()

            val bearer = getBearerToken(request)
                ?: return Response(Status.UNAUTHORIZED)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Unauthorized")))

            if (!db.authenticate(bearer)) {
                return Response(Status.UNAUTHORIZED)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Unauthorized")))
            }

            if (sid == null || pid == null) {
                Response(Status.BAD_REQUEST)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Invalid request: The session ID or player ID is invalid.")))
            } else {
                db.removePlayerFromSession(sid, pid)
                Response(Status.OK)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("success:" to "Player removed successfully.")))
            }
        } catch (e: Exception) {
            logInternalError(e)
            Response(Status.INTERNAL_SERVER_ERROR)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "${e.message}")))
        }
    }

    fun deleteSessionHandler(request: Request): Response {
        requestLogger(request)
        val id = request.path("id")?.toIntOrNull()
        val bearer = getBearerToken(request)
            ?: return Response(Status.UNAUTHORIZED)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "Unauthorized")))

        if (!db.authenticate(bearer)) {
            return Response(Status.UNAUTHORIZED)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "Unauthorized")))
        }

        return if (id == null) {
            Response(Status.BAD_REQUEST)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "Invalid request: The session ID is invalid.")))
        } else {
            try {
                db.deleteSession(id)
                Response(Status.OK)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("success:" to "Session deleted successfully")))
            } catch (e: Exception) {
                logInternalError(e)
                Response(Status.INTERNAL_SERVER_ERROR)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "${e.message}")))
            }
        }
    }

    fun addPlayerHandler(request: Request): Response {
        requestLogger(request)
        return try {
            val body = request.bodyString()
            val jsonBody = Json.parseToJsonElement(body)
            val sessionID = jsonBody.jsonObject["sessionID"].toString().toInt()
            val playerID = jsonBody.jsonObject["playerID"].toString().toInt()

            val bearer = getBearerToken(request)
                ?: return Response(Status.UNAUTHORIZED)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Unauthorized")))

            if (!db.authenticate(bearer)) {
                return Response(Status.UNAUTHORIZED)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Unauthorized")))
            }

            val playerDetails = db.getPlayerDetails(playerID)
            val player = Player(
                playerID,
                playerDetails.name,
                playerDetails.email
            )
            db.addPlayer(sessionID, player)
            Response(Status.OK)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("success:" to "Player added successfully")))
        } catch (e: Exception) {
            logInternalError(e)
            Response(Status.INTERNAL_SERVER_ERROR)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "${e.message}")))
        }
    }

    fun sessionDetailsHandler(request: Request): Response {
        requestLogger(request)
        return try {
            val id = request.path("id")?.toIntOrNull()
            if (id == null) {
                Response(Status.BAD_REQUEST)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "The session ID is invalid.")))
            } else {
                val session = db.getDetails(id)
                val sessionGameDto =
                    GameDto(session.game.id, session.game.name, session.game.developer, session.game.genres)
                val sessionPlayersDto = session.players.map { PlayerDto(it.id, it.name, it.email) }

                val details = SessionDto(
                    session.id,
                    session.numberOfPlayers,
                    session.date,
                    session.state,
                    sessionGameDto,
                    sessionPlayersDto,
                    session.ownerID
                )
                Response(Status.OK)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(details))
            }
        } catch (e: Exception) {
            logInternalError(e)
            Response(Status.INTERNAL_SERVER_ERROR)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "${e.message}")))
        }
    }

    fun fetchSessionsHandler(request: Request): Response {
        requestLogger(request)
        val limit = request.query("limit")?.toIntOrNull()
        val skip = request.query("skip")?.toIntOrNull()
        val gid = request.query("gid")?.toIntOrNull()
        val date = request.query("date")
        val pid = request.query("pid")?.toIntOrNull()

        return if (gid == null) {
            Response(Status.BAD_REQUEST)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "Invalid request: The game ID is invalid.")))
        } else if ((limit != null && limit < 0) || (skip != null && skip < 0)) {
            Response(Status.BAD_REQUEST)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "Invalid request: \n" + "The limit or skip is invalid and or negative. \n")))
        } else {
            try {
                val actual_sessions: List<Session> = db.fetchSessions(gid, date, pid)
                val sessions = actual_sessions.map {
                    val game = GameDto(it.game.id, it.game.name, it.game.developer, it.game.genres)
                    val players = it.players.map { PlayerDto(it.id, it.name, it.email) }
                    SessionDto(it.id, it.numberOfPlayers, it.date, it.state, game, players, it.ownerID)
                }
                if (limit != null && skip != null) {
                    val newSessions = sessions.drop(skip).take(limit)
                    Response(Status.OK)
                        .header("Content-Type", "application/json")
                        .body(Json.encodeToString(mapOf("sessions" to newSessions)))
                } else if (limit != null && skip == null) {
                    val newSessions = sessions.take(limit)
                    Response(Status.OK)
                        .header("Content-Type", "application/json")
                        .body(Json.encodeToString(mapOf("sessions" to newSessions)))
                } else if (skip != null) {
                    val newSessions = sessions.drop(skip)
                    Response(Status.OK)
                        .header("Content-Type", "application/json")
                        .body(Json.encodeToString(mapOf("sessions" to newSessions)))
                } else {
                    Response(Status.OK)
                        .header("Content-Type", "application/json")
                        .body(Json.encodeToString(mapOf("sessions" to sessions)))
                }
            } catch (e: Exception) {
                logInternalError(e)
                Response(Status.INTERNAL_SERVER_ERROR)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "${e.message}")))
            }
        }
    }
}
