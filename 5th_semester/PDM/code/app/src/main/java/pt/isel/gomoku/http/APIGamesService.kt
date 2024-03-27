package pt.isel.gomoku.http

import com.google.gson.Gson
import kotlinx.coroutines.suspendCancellableCoroutine
import okhttp3.OkHttpClient
import pt.isel.gomoku.domain.games.Game
import pt.isel.gomoku.domain.games.Monitor
import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.services.GameActionNames
import pt.isel.gomoku.domain.services.GameRels
import pt.isel.gomoku.domain.services.GamesService
import pt.isel.gomoku.domain.variants.Variants
import pt.isel.gomoku.http.dto.GameDto
import pt.isel.gomoku.http.dto.MonitorDto
import pt.isel.gomoku.http.dto.VariantsDto

/**
 * Remote implementation of the [GamesService].
 */
class APIGamesService(
    private val client: OkHttpClient,
    private val gson: Gson,
    private val apiBaseUrl: String
) : GamesService {

    override fun getLinkRelations() = APIGameRels
    override fun getActionNames() = APIGameActionNames

    override suspend fun fetchVariants(token: String, link: Link?): Siren<Variants> =
        suspendCancellableCoroutine { continuation ->
            requireNotNull(link) { "Link given must not be null." }
            val call = request(
                client = client,
                token = token,
                uri = apiBaseUrl + link.href
            )

            fetch<Variants, VariantsDto>(gson, call, continuation)
        }

    override suspend fun startGame(
        token: String,
        variantId: Int,
        action: Action?
    ): Siren<Monitor?> =
        suspendCancellableCoroutine { continuation ->
            requireNotNull(action) { "Action given must not be null." }
            val call = request(
                client = client,
                method = Method.POST,
                uri = apiBaseUrl + action.href,
                token = token,
                bodyInfo = mapOf(
                    action.fields[0].name to variantId
                )
            )

            fetch<Monitor?, MonitorDto?>(gson, call, continuation)
        }

    override suspend fun statusMonitor(token: String, link: Link?): Siren<Monitor?> =
        suspendCancellableCoroutine { continuation ->
            requireNotNull(link) { "Link given must not be null." }
            val call = request(
                client = client,
                token = token,
                uri = apiBaseUrl + link.href,
            )

            fetch<Monitor?, MonitorDto?>(gson, call, continuation)
        }

    override suspend fun deleteMonitor(token: String, action: Action?) =
        suspendCancellableCoroutine { continuation ->
            requireNotNull(action) { "Action given must not be null." }
            val call = request(
                client = client,
                token = token,
                uri = apiBaseUrl + action.href,
                method = action.method.toMethod()
            )

            send(gson, call, continuation)
        }

    override suspend fun fetchGame(token: String, link: Link?): Siren<Game> =
        suspendCancellableCoroutine { continuation ->
            requireNotNull(link) { "Link given must not be null." }
            val call = request(
                client = client,
                token = token,
                uri = apiBaseUrl + link.href,
            )

            fetch<Game, GameDto>(gson, call, continuation)
        }

    override suspend fun play(
        token: String,
        gameId: String,
        row: Int,
        column: Int,
        action: Action?
    ): Siren<Game> =
        suspendCancellableCoroutine { continuation ->
            requireNotNull(action) { "Action given must not be null." }
            val uri = create(
                action.href,
                "id" to gameId,
                "row" to row.toString(),
                "column" to column.toString()
            )
            val call = request(
                client = client,
                method = action.method.toMethod(),
                token = token,
                uri = apiBaseUrl + uri,
            )

            fetch<Game, GameDto>(gson, call, continuation)
        }

    override suspend fun giveUp(token: String, action: Action?) =
        suspendCancellableCoroutine { continuation ->
            requireNotNull(action) { "Action given must not be null." }
            val call = request(
                client = client,
                token = token,
                uri = apiBaseUrl + action.href,
                method = action.method.toMethod()
            )

            send(gson, call, continuation)
        }

    companion object {

        private fun create(template: String, vararg varAndValue: Pair<String, String>): String {
            var url = template
            varAndValue.forEach { variable ->
                url = url.replace("{${variable.first}}", variable.second)
            }
            return url
        }

        /**
         * The link relations of the [APIGamesService].
         */
        object APIGameRels : GameRels {
            @JvmInline
            value class LinkRelation(
                val value: String
            )

            private const val DOC_LOCATION =
                "https://github.com/isel-leic-daw/2023-daw-leic51d-07/tree/main/docs/api/rel/"

            override val SELF = APIUsersService.Companion.APIUserRels.LinkRelation("self").value
            override val VARIANTS = LinkRelation(DOC_LOCATION + "variants").value
            override val VARIANT = LinkRelation(DOC_LOCATION + "variant").value
            override val GAME = LinkRelation(DOC_LOCATION + "game").value
            override val MONITOR = LinkRelation(DOC_LOCATION + "monitor").value
        }

        /**
         * The action names of the [APIGamesService].
         */
        object APIGameActionNames : GameActionNames {
            override val START = "start-game"
            override val CANCEL_START = "cancel"
            override val PLAY = "play"
            override val GIVE_UP = "give-up"
        }
    }
}
