package pt.isel.gomoku.domain.services.local

import kotlinx.coroutines.delay
import kotlinx.datetime.Clock
import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.services.UsersService
import pt.isel.gomoku.domain.users.Ranking
import pt.isel.gomoku.domain.users.Token
import pt.isel.gomoku.domain.users.User
import pt.isel.gomoku.domain.users.UserStatistics
import pt.isel.gomoku.http.ConnectionToServerException
import java.util.UUID
import kotlin.math.roundToInt
import kotlin.random.Random
import kotlin.time.Duration.Companion.hours

/**
 * Local implementation of the [UsersService].
 * Mainly used for testing.
 */
class LocalUsersService(
    private val causeProblem: Boolean = false,
    private val delayMillis: Long = 0,
) : UsersService {

    private val hrefTemplate = "/api/users/ranking?page="

    private val numberOfUsers = 30
    private val users = List(numberOfUsers) {
        User(it + 1, "local user${it + 1} ", "user${it + 1}@isel.pt")
    }

    private val limit = 10
    private val lastPage = (numberOfUsers.toDouble() / limit).roundToInt()

    override fun getLinkRelations() = null
    override fun getActionNames() = null

    override suspend fun fetchRanking(link: Link?): Siren<Ranking> {
        delay(delayMillis)

        val page = link?.href?.substringAfter(hrefTemplate)?.toInt() ?: 1
        val skip = page.minus(1) * limit
        val random = Random.nextDouble()

        return if (!causeProblem || random < 0.9) {
            Siren(
                clazz = emptyList(),
                properties = Ranking(
                    totalUsers = numberOfUsers,
                    ranking = users.map { user ->
                        UserStatistics(
                            userId = user.id,
                            username = user.username,
                            rankingPosition = user.id,
                            gamesPlayed = 0,
                            gamesWon = 0,
                            gamesLost = 0,
                            gamesTied = 0
                        )
                    }.drop(skip).take(limit)
                ),
                links = when {
                    page == 1 && numberOfUsers <= limit -> emptyList()
                    page == 1 -> listOf(
                        Link(listOf("next"), "$hrefTemplate${page + 1}", emptyList()),
                        Link(listOf("last"), "$hrefTemplate${lastPage}", emptyList())
                    )

                    page == lastPage -> listOf(
                        Link(listOf("previous"), "$hrefTemplate${page - 1}", emptyList()),
                        Link(listOf("first"), "$hrefTemplate${1}", emptyList())
                    )

                    else -> listOf(
                        Link(listOf("previous"), "$hrefTemplate${page - 1}", emptyList()),
                        Link(listOf("next"), "$hrefTemplate${page + 1}", emptyList()),
                        Link(listOf("first"), "$hrefTemplate${1}", emptyList()),
                        Link(listOf("last"), "$hrefTemplate${lastPage}", emptyList())
                    )
                },
                entities = emptyList(),
                actions = emptyList()
            )
        } else {
            throw ConnectionToServerException
        }
    }

    override suspend fun signUp(
        username: String,
        email: String,
        password: String,
        action: Action?
    ): Siren<Any?> {
        delay(delayMillis)

        val random = Random.nextDouble()

        return if (!causeProblem || random < 0.9) {
            emptySiren()
        } else {
            throw ConnectionToServerException
        }
    }

    override suspend fun login(identity: String, password: String, action: Action?): Siren<Token> {
        delay(delayMillis)

        val random = Random.nextDouble()

        return if (!causeProblem || random < 0.9) {
            emptySiren(Token(UUID.randomUUID().toString(), Clock.System.now().plus(5.hours)))
        } else {
            throw ConnectionToServerException
        }
    }

    override suspend fun me(token: String, link: Link?): Siren<User> {
        delay(delayMillis)

        val random = Random.nextDouble()

        return if (!causeProblem || random < 0.9) {
            emptySiren(users.first())
        } else {
            throw ConnectionToServerException
        }
    }

    override suspend fun logout(token: String, action: Action?) {
        delay(delayMillis)

        val random = Random.nextDouble()

        if (!causeProblem || random < 0.9) {
            return
        } else {
            throw ConnectionToServerException
        }
    }
}
