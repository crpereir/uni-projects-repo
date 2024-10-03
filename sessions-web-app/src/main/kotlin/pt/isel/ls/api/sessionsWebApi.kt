package pt.isel.ls.api

import kotlinx.serialization.Serializable
import org.http4k.core.Method.DELETE
import org.http4k.core.Method.GET
import org.http4k.core.Method.POST
import org.http4k.core.Method.PUT
import org.http4k.routing.bind
import org.http4k.routing.routes
import pt.isel.ls.api.handlers.AuthHandlers
import pt.isel.ls.api.handlers.GameHandlers
import pt.isel.ls.api.handlers.PlayerHandlers
import pt.isel.ls.api.handlers.SessionHandlers
import pt.isel.ls.server.Server

fun logInternalError(e: Exception) {
    return Server.logError(e.message.toString())
}

@Serializable
data class PlayerCreationRequest(
    val name: String,
    val email: String,
    val password: String
)

@Serializable
data class PlayerLoginRequest(
    val name: String,
    val password: String
)

@Serializable
data class SessionCreationRequest(
    val numberOfPlayers: Int,
    val date: String,
    val state: String = "open",
    val game: Int,
    val players: List<Int>
)

@Serializable
data class GameCreationRequest(
    val name: String,
    val developer: String,
    val genres: Set<String>
)

val sessionHandlers = SessionHandlers()
val gameHandlers = GameHandlers()
val authHandlers = AuthHandlers()
val playerHandlers = PlayerHandlers()

val session = routes(
    "sessions" bind routes(
        "/" bind POST to sessionHandlers::createSessionHandler,
        "/{id}" bind DELETE to sessionHandlers::deleteSessionHandler,
        "/" bind PUT to sessionHandlers::addPlayerHandler,
        "/{id}" bind GET to sessionHandlers::sessionDetailsHandler,
        "/" bind GET to sessionHandlers::fetchSessionsHandler,
        "/{id}/players/{pid}" bind DELETE to sessionHandlers::removePlayerFromSessionHandler,
        "/{id}" bind PUT to sessionHandlers::updateSessionHandler
    )
)

val game = routes(
    "games" bind routes(
        "/" bind POST to gameHandlers::createGameHandler,
        "/" bind GET to gameHandlers::fetchGamesHandler,
        "/{id}" bind GET to gameHandlers::gameDetailsHandler
    )
)

val player = routes(
    "players" bind routes(
        "/search" bind GET to playerHandlers::searchPlayerByNameHandler,
        "/get-id" bind GET to playerHandlers::getIdByToken,
        "/{id}" bind GET to playerHandlers::playerDetailsHandler,
        "/sessions/{id}" bind GET to playerHandlers::getPlayerSessions,
    )
)

val auth = routes(
    "auth" bind routes(
        "/login" bind POST to authHandlers::loginPlayerHandler,
        "/register" bind POST to playerHandlers::createPlayerHandler
    )
)
