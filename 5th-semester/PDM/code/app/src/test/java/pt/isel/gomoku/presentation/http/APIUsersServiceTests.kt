package pt.isel.gomoku.presentation.http

import kotlinx.coroutines.runBlocking
import okhttp3.mockwebserver.MockResponse
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.domain.users.Ranking
import pt.isel.gomoku.http.APIException
import pt.isel.gomoku.http.APIUsersService
import pt.isel.gomoku.http.NotLoggedInException
import pt.isel.gomoku.http.dto.ProblemDto
import pt.isel.gomoku.http.dto.RankingDto
import pt.isel.gomoku.http.dto.SirenModelDto
import pt.isel.gomoku.http.dto.UserStatisticsDto
import pt.isel.gomoku.presentation.utils.MockAction
import pt.isel.gomoku.presentation.utils.MockLink
import pt.isel.gomoku.presentation.utils.MockWebServerRule
import kotlin.test.assertEquals
import kotlin.test.assertIs

class APIUsersServiceTests {

    @get:Rule
    val rule = MockWebServerRule()

    @Test
    fun `fetchRanking returns ranking produced by the API`() {
        // Arrange
        val sirenRankingDto = SirenModelDto(
            clazz = emptyList(),
            properties = RankingDto(
                totalUsers = 2,
                ranking = listOf(
                    UserStatisticsDto(1, "user1", 1, 0, 0, 0, 0),
                    UserStatisticsDto(2, "user2", 1, 0, 0, 0, 0)
                )
            ),
            links = emptyList(),
            entities = emptyList(),
            actions = emptyList()

        )
        val expected = sirenRankingDto.toSiren<Ranking>()
        rule.webServer.enqueue(
            MockResponse()
                .setResponseCode(200)
                .addHeader("Content-Type", "application/vnd.siren+json")
                .setBody(rule.gson.toJson(sirenRankingDto))
        )

        val sut = APIUsersService(
            client = rule.httpClient,
            gson = rule.gson,
            apiBaseUrl = rule.webServer.url("").toString()
        )

        // Act
        val actual = runBlocking { sut.fetchRanking(MockLink ) }

        // Assert
        assertEquals(expected, actual)
    }

    @Test
    fun `the server is down when fetch ranking`() {
        // Arrange
        val problemDto = ProblemDto(
            type = "internalServerError",
            title = null,
            detail = null,
            instance = null
        )

        rule.webServer.enqueue(
            MockResponse()
                .setResponseCode(500)
                .addHeader("Content-Type", "application/problem+json")
                .setBody(rule.gson.toJson(problemDto))
        )

        val sut = APIUsersService(
            client = rule.httpClient,
            gson = rule.gson,
            apiBaseUrl = rule.webServer.url("").toString()
        )

        // Act
        val actual = runBlocking {
            val result = kotlin.runCatching { sut.fetchRanking(MockLink) }
            return@runBlocking result.exceptionOrNull()
        }

        // Assert
        assertIs<APIException>(actual)
        assertEquals("internalServerError", actual.type)
    }

    @Test
    fun `logout succeeds`() {
        // Arrange
        rule.webServer.enqueue(
            MockResponse()
                .setResponseCode(200)
        )

        val sut = APIUsersService(
            client = rule.httpClient,
            gson = rule.gson,
            apiBaseUrl = rule.webServer.url("").toString()
        )

        // Act
        runBlocking { sut.logout("",MockAction) }
    }

    @Test
    fun `logout fails because user not logged in`() {
        // Arrange
        rule.webServer.enqueue(
            MockResponse()
                .setResponseCode(401)
        )

        val sut = APIUsersService(
            client = rule.httpClient,
            gson = rule.gson,
            apiBaseUrl = rule.webServer.url("").toString()
        )

        // Act
        val actual = runBlocking {
            val result = kotlin.runCatching { sut.logout("", MockAction) }
            return@runBlocking result.exceptionOrNull()
        }

        // Assert
        assertIs<NotLoggedInException>(actual)
    }
}