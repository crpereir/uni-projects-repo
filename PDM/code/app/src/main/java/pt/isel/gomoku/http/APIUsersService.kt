package pt.isel.gomoku.http

import com.google.gson.Gson
import kotlinx.coroutines.suspendCancellableCoroutine
import okhttp3.OkHttpClient
import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.services.UserActionNames
import pt.isel.gomoku.domain.services.UserRels
import pt.isel.gomoku.domain.services.UsersService
import pt.isel.gomoku.domain.users.Ranking
import pt.isel.gomoku.domain.users.Token
import pt.isel.gomoku.domain.users.User
import pt.isel.gomoku.http.dto.RankingDto
import pt.isel.gomoku.http.dto.TokenDto
import pt.isel.gomoku.http.dto.UserDto

/**
 * Remote implementation of the [UsersService].
 */
class APIUsersService(
    private val client: OkHttpClient,
    private val gson: Gson,
    private val apiBaseUrl: String
) : UsersService {

    override fun getLinkRelations() = APIUserRels
    override fun getActionNames() = APIUserActionNames

    override suspend fun fetchRanking(link: Link?): Siren<Ranking> =
        suspendCancellableCoroutine { continuation ->
            requireNotNull(link) { "Link given must not be null." }
            val call = request(
                client = client,
                uri = apiBaseUrl + link.href
            )

            fetch<Ranking, RankingDto>(gson, call, continuation)
        }

    override suspend fun signUp(
        username: String,
        email: String,
        password: String,
        action: Action?
    ): Siren<Any?> =
        suspendCancellableCoroutine { continuation ->
            requireNotNull(action) { "Action given must not be null." }
            val call = request(
                client = client,
                uri = apiBaseUrl + action.href,
                method = action.method.toMethod(),
                bodyInfo = hashMapOf(
                    action.fields[0].name to username,
                    action.fields[1].name to email,
                    action.fields[2].name to password
                )
            )

            fetch<Any?, Any?>(gson, call, continuation)
        }

    override suspend fun login(identity: String, password: String, action: Action?): Siren<Token> =
        suspendCancellableCoroutine { continuation ->
            requireNotNull(action) { "Action given must not be null." }
            val call = request(
                client = client,
                uri = apiBaseUrl + action.href,
                method = action.method.toMethod(),
                bodyInfo = hashMapOf(
                    action.fields[0].name to identity,
                    action.fields[1].name to password,
                )
            )

            fetch<Token, TokenDto>(gson, call, continuation)
        }

    override suspend fun logout(token: String, action: Action?) =
        suspendCancellableCoroutine { continuation ->
            requireNotNull(action) { "Action given must not be null." }
            val call = request(
                client = client,
                uri = apiBaseUrl + action.href,
                method = action.method.toMethod(),
                token = token,
            )

            send(gson, call, continuation)
        }

    override suspend fun me(token: String, link: Link?): Siren<User> =
        suspendCancellableCoroutine { continuation ->
            requireNotNull(link) { "Link given must not be null." }
            val call = request(
                client = client,
                uri = apiBaseUrl + link.href,
                token = token,
            )

            fetch<User, UserDto>(gson, call, continuation)
        }

    companion object {

        /**
         * The link relations of the users service.
         */
        object APIUserRels : UserRels {
            @JvmInline
            value class LinkRelation(
                val value: String
            )

            private const val DOC_LOCATION =
                "https://github.com/isel-leic-daw/2023-daw-leic51d-07/tree/main/docs/api/rel/"

            override val SELF = LinkRelation("self").value
            override val PREVIOUS = LinkRelation("previous").value
            override val NEXT = LinkRelation("next").value
            override val FIRST = LinkRelation("first").value
            override val LAST = LinkRelation("last").value
            override val USER_HOME = LinkRelation(DOC_LOCATION + "userHome").value
            override val RANKING = LinkRelation(DOC_LOCATION + "ranking").value
            override val STATISTICS = LinkRelation(DOC_LOCATION + "statistics").value
        }

        /**
         * The action names of the users service.
         */
        object APIUserActionNames : UserActionNames {
            override val SIGNUP = "signup"
            override val LOGIN = "login"
            override val LOGOUT = "logout"
        }
    }
}
