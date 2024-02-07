package pt.isel.gomoku.http

import com.google.gson.Gson
import kotlinx.coroutines.suspendCancellableCoroutine
import okhttp3.OkHttpClient
import pt.isel.gomoku.domain.home.Home
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.services.HomeActionNames
import pt.isel.gomoku.domain.services.HomeRels
import pt.isel.gomoku.domain.services.HomeService

class APIHomeService(
    private val client: OkHttpClient,
    private val gson: Gson,
    private val apiBaseUrl: String
) : HomeService {

    override fun getLinkRelations() = APIHomeRels

    override fun getActionNames() = APIHomeActionNames

    override suspend fun getHome(): Siren<Home> =
        suspendCancellableCoroutine { continuation ->
            val call = request(
                client = client,
                uri = "$apiBaseUrl/api/"
            )

            fetch<Home, Home>(gson, call, continuation)
        }

    /**
     * The link relations of the [APIHomeRels].
     */
    object APIHomeRels : HomeRels {
        @JvmInline
        value class LinkRelation(
            val value: String
        )

        private const val DOC_LOCATION =
            "https://github.com/isel-leic-daw/2023-daw-leic51d-07/tree/main/docs/api/rel/"

        override val RANKING = LinkRelation(DOC_LOCATION + "ranking").value
        override val USER_HOME = LinkRelation(DOC_LOCATION + "userHome").value
    }

    /**
     * The action names of the [APIHomeService].
     */
    object APIHomeActionNames : HomeActionNames {
        override val LOGIN = "login"
        override val SIGNUP = "signup"
    }
}
