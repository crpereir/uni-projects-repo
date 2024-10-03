package pt.isel.ls.server
import org.http4k.core.Request
import org.http4k.routing.ResourceLoader
import org.http4k.routing.routes
import org.http4k.routing.singlePageApp
import org.http4k.server.Jetty
import org.http4k.server.asServer
import org.slf4j.LoggerFactory
import pt.isel.ls.api.auth
import pt.isel.ls.api.game
import pt.isel.ls.api.player
import pt.isel.ls.api.session
import pt.isel.ls.db.DB
import pt.isel.ls.services.AuthenticationService

private val logger = LoggerFactory.getLogger("pt.isel.ls.server.sessionsServer")

object Server {
    private val DB = DB()
    val authService = AuthenticationService(DB)
    fun logError(msg: String) {
        logger.error(msg)
    }
}

fun requestLogger(req: Request) {
    logger.info(
        "Received a request from ${req.source} \n" +
            "Method: ${req.method} \n" +
            "Path: ${req.uri} \n" +
            "Content-Type: ${req.header("Content-Type")} \n" +
            "Accept: ${req.header("Accept")} \n" +
            "Body: ${req.body}"
    )
}

val app = routes(
    session,
    game,
    player,
    auth,
    singlePageApp(ResourceLoader.Directory("static-content/frontend/spa")),
)

fun main() {

    val server = app.asServer(Jetty(8080)).start()
    logger.info("Server started on port ${server.port()}")
}
