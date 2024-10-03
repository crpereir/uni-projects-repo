package pt.isel.ls.api.handlers

import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import org.http4k.core.Request
import org.http4k.core.Response
import org.http4k.core.Status
import pt.isel.ls.api.GameCreationRequest
import pt.isel.ls.api.logInternalError
import pt.isel.ls.db.DB
import pt.isel.ls.db.DBFactory
import pt.isel.ls.domain.dto.GameDto
import pt.isel.ls.server.Server
import pt.isel.ls.server.requestLogger
import java.io.File

@Serializable
private data class Genres(val genres: List<String>)

class GameHandlers(val db: DBFactory = DB()) {
    fun createGameHandler(request: Request): Response {
        requestLogger(request)
        try {
            val game = Json.decodeFromString<GameCreationRequest>(request.bodyString())

            val genresPath = System.getenv("ASSETS_PATH") ?: "./static-content"
            val genresJSON = File("$genresPath/genres.json").readText()
            val permittedGenres = Json.decodeFromString<Genres>(genresJSON)

            val bearer = getBearerToken(request)
                ?: return Response(Status.UNAUTHORIZED)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "Unauthorized")))

            return getRequestResponse(game, bearer, permittedGenres)
        } catch (e: IllegalArgumentException) {
            logInternalError(e)
            return Response(Status.BAD_REQUEST)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "${e.message}")))
        } catch (e: Exception) {
            logInternalError(e)
            return Response(Status.INTERNAL_SERVER_ERROR)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "${e.message}")))
        }
    }

    private fun getRequestResponse(game: GameCreationRequest, bearer: String, permittedGenres: Genres): Response {
        if (!Server.authService.authenticate(bearer)) {
            return Response(Status.UNAUTHORIZED)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "Unauthorized")))
        } else if (game.name.isEmpty()) {
            return Response(Status.BAD_REQUEST)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "Invalid Request")))
        } else if (game.developer.isEmpty()) {
            return Response(Status.BAD_REQUEST)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "Missing developer")))
        } else if (game.genres.isEmpty()) {
            return Response(Status.BAD_REQUEST)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "Missing genres")))
        } else if (!genresArePermitted(game.genres, permittedGenres.genres)) {
            return Response(Status.BAD_REQUEST)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "Invalid genres")))
        } else {
            val gameID = db.createGame(game.name, game.developer, game.genres)
            return Response(Status.CREATED)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("gameID" to gameID)))
        }
    }

    private fun genresArePermitted(genres: Set<String>, permittedGenres: List<String>) =
        genres.all { permittedGenres.contains(it) }

    fun gameDetailsHandler(request: Request): Response {
        requestLogger(request)
        try {
            val id = request.uri.path.split("/")[2].toIntOrNull()
            if (id == null) {
                return Response(Status.BAD_REQUEST)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "The game ID is invalid")))
            } else {
                val gameObject = db.getGameDetails(id)
                    ?: return Response(Status.NOT_FOUND)
                        .header("Content-Type", "application/json")
                        .body(Json.encodeToString(mapOf("error" to "Game with provided ID does not exist")))

                val gameDetails = GameDto(gameObject.id, gameObject.name, gameObject.developer, gameObject.genres)
                return Response(Status.OK)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(gameDetails))
            }
        } catch (e: Exception) {
            logInternalError(e)
            return Response(Status.INTERNAL_SERVER_ERROR)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to "${e.message}")))
        }
    }

    fun fetchGamesHandler(request: Request): Response {
        requestLogger(request)
        try {
            val name = request.query("name") ?: ""
            val genres = request.query("genres")?.split(",")?.toSet() ?: emptySet()
            val developer = request.query("developer") ?: ""
            val limit = request.query("limit")?.toIntOrNull() ?: 5
            val skip = request.query("skip")?.toIntOrNull() ?: 0

            if (limit < 0 || skip < 0) {
                return Response(Status.BAD_REQUEST)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(mapOf("error" to "At least one filter must be provided")))
            } else {
                val games = db.getGames(name, genres, developer)
                val gameDtos = games.map { GameDto(it.id, it.name, it.developer, it.genres) }

                val filteredGames = gameDtos.drop(skip).take(limit)

                return Response(Status.OK)
                    .header("Content-Type", "application/json")
                    .body(Json.encodeToString(filteredGames))
            }
        } catch (e: Exception) {
            logInternalError(e)
            return Response(Status.INTERNAL_SERVER_ERROR)
                .header("Content-Type", "application/json")
                .body(Json.encodeToString(mapOf("error" to e.message)))
        }
    }
}
