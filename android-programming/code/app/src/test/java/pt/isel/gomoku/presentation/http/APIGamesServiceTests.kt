package pt.isel.gomoku.presentation.http

import kotlinx.coroutines.runBlocking
import okhttp3.mockwebserver.MockResponse
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.domain.games.Game
import pt.isel.gomoku.domain.games.Intersection
import pt.isel.gomoku.domain.games.Monitor
import pt.isel.gomoku.domain.games.Piece
import pt.isel.gomoku.domain.games.Player
import pt.isel.gomoku.domain.variants.OpeningRules
import pt.isel.gomoku.domain.variants.PlayingRules
import pt.isel.gomoku.domain.variants.Variants
import pt.isel.gomoku.http.APIException
import pt.isel.gomoku.http.APIGamesService
import pt.isel.gomoku.http.dto.GameDto
import pt.isel.gomoku.http.dto.MonitorDto
import pt.isel.gomoku.http.dto.ProblemDto
import pt.isel.gomoku.http.dto.SirenModelDto
import pt.isel.gomoku.http.dto.VariantDto
import pt.isel.gomoku.http.dto.VariantsDto
import pt.isel.gomoku.http.dto.emptySirenDto
import pt.isel.gomoku.presentation.utils.MockAction
import pt.isel.gomoku.presentation.utils.MockLink
import pt.isel.gomoku.presentation.utils.MockWebServerRule
import java.util.UUID
import kotlin.test.assertEquals
import kotlin.test.assertIs
import kotlin.time.Duration.Companion.minutes
import kotlin.time.Duration.Companion.seconds

class APIGamesServiceTests {

    @get:Rule
    val rule = MockWebServerRule()

    @Test
    fun `fetchVariants returns variants produced by the API`() {
        // Arrange
        val sirenVariantsDto = emptySirenDto(
            VariantsDto(
                listOf(
                    VariantDto(
                        1,
                        15,
                        OpeningRules.NONE.toString(),
                        PlayingRules.FREESTYLE.toString()
                    )
                )
            )
        )

        val expected = sirenVariantsDto.toSiren<Variants>()
        rule.webServer.enqueue(
            MockResponse()
                .setResponseCode(200)
                .addHeader("Content-Type", "application/vnd.siren+json")
                .setBody(rule.gson.toJson(sirenVariantsDto))
        )

        val sut = APIGamesService(
            client = rule.httpClient,
            gson = rule.gson,
            apiBaseUrl = rule.webServer.url("").toString()
        )

        // Act
        val actual = runBlocking { sut.fetchVariants("", MockLink) }

        assertEquals(expected, actual)
    }

    @Test
    fun `start game returns possible monitor produced by the API`() {
        // Arrange
        val sirenMonitorDto: SirenModelDto<MonitorDto?> = emptySirenDto(
            MonitorDto(
                status = Monitor.Status.WAITING_FOR_OTHER_PLAYER.toString(),
                askAgainIn = 5.seconds.toString()
            )
        )

        val expected = sirenMonitorDto.toSiren<Monitor?>()
        rule.webServer.enqueue(
            MockResponse()
                .setResponseCode(200)
                .addHeader("Content-Type", "application/vnd.siren+json")
                .setBody(rule.gson.toJson(sirenMonitorDto))
        )

        val sut = APIGamesService(
            client = rule.httpClient,
            gson = rule.gson,
            apiBaseUrl = rule.webServer.url("").toString()
        )

        // Act
        val actual = runBlocking { sut.startGame("", 1, MockAction) }

        assertEquals(expected, actual)
    }

    @Test
    fun `start game returns possible game produced by the API`() {
        // Arrange
        val sirenMonitorDto: SirenModelDto<MonitorDto?> = emptySirenDto()

        val expected = sirenMonitorDto.toSiren<Monitor?>()
        rule.webServer.enqueue(
            MockResponse()
                .setResponseCode(200)
                .addHeader("Content-Type", "application/vnd.siren+json")
                .setBody(rule.gson.toJson(sirenMonitorDto))
        )

        val sut = APIGamesService(
            client = rule.httpClient,
            gson = rule.gson,
            apiBaseUrl = rule.webServer.url("").toString()
        )

        // Act
        val actual = runBlocking { sut.startGame("", 1, MockAction) }

        assertEquals(expected, actual)
    }

    @Test
    fun `checking monitor returns more waiting needed produced by the API`() {
        // Arrange
        val sirenMonitorDto: SirenModelDto<MonitorDto?> = emptySirenDto(
            MonitorDto(
                status = Monitor.Status.WAITING_FOR_OTHER_PLAYER.toString(),
                askAgainIn = 5.seconds.toString()
            )
        )

        val expected = sirenMonitorDto.toSiren<Monitor?>()
        rule.webServer.enqueue(
            MockResponse()
                .setResponseCode(200)
                .addHeader("Content-Type", "application/vnd.siren+json")
                .setBody(rule.gson.toJson(sirenMonitorDto))
        )

        val sut = APIGamesService(
            client = rule.httpClient,
            gson = rule.gson,
            apiBaseUrl = rule.webServer.url("").toString()
        )

        // Act
        val actual = runBlocking { sut.statusMonitor("", MockLink) }

        assertEquals(expected, actual)
    }

    @Test
    fun `checking monitor returns game found produced by the API`() {
        // Arrange
        val sirenMonitorDto: SirenModelDto<MonitorDto?> = emptySirenDto(
            MonitorDto(
                status = Monitor.Status.OTHER_PLAYER_JOINED.toString(),
                askAgainIn = null
            )
        )

        val expected = sirenMonitorDto.toSiren<Monitor?>()
        rule.webServer.enqueue(
            MockResponse()
                .setResponseCode(200)
                .addHeader("Content-Type", "application/vnd.siren+json")
                .setBody(rule.gson.toJson(sirenMonitorDto))
        )

        val sut = APIGamesService(
            client = rule.httpClient,
            gson = rule.gson,
            apiBaseUrl = rule.webServer.url("").toString()
        )

        // Act
        val actual = runBlocking { sut.statusMonitor("", MockLink) }

        assertEquals(expected, actual)
    }

    @Test
    fun `fetching game returns game state produced by the API`() {
        // Arrange
        val sirenGameDto: SirenModelDto<GameDto?> = emptySirenDto(
            GameDto(
                pieces = listOf(),
                gameState = Game.State.NEXT_TURN_B.toString(),
                playingRoundTime = 5.minutes.toString(),
                playerB = 0,
                playerW = 1,
                variantId = 1
            )
        )

        val expected = sirenGameDto.toSiren<Game>()
        rule.webServer.enqueue(
            MockResponse()
                .setResponseCode(200)
                .addHeader("Content-Type", "application/vnd.siren+json")
                .setBody(rule.gson.toJson(sirenGameDto))
        )

        val sut = APIGamesService(
            client = rule.httpClient,
            gson = rule.gson,
            apiBaseUrl = rule.webServer.url("").toString()
        )

        // Act
        val actual = runBlocking { sut.fetchGame("", MockLink) }

        assertEquals(expected, actual)
    }

    @Test
    fun `playing returns new game state produced by the API`() {
        // Arrange
        val sirenGameDto: SirenModelDto<GameDto?> = emptySirenDto(
            GameDto(
                pieces = listOf(
                    Piece(Player.B, Intersection(1, 1))
                ),
                gameState = Game.State.NEXT_TURN_W.toString(),
                playingRoundTime = 5.minutes.toString(),
                playerB = 0,
                playerW = 1,
                variantId = 1
            )
        )

        val expected = sirenGameDto.toSiren<Game>()
        rule.webServer.enqueue(
            MockResponse()
                .setResponseCode(200)
                .addHeader("Content-Type", "application/vnd.siren+json")
                .setBody(rule.gson.toJson(sirenGameDto))
        )

        val sut = APIGamesService(
            client = rule.httpClient,
            gson = rule.gson,
            apiBaseUrl = rule.webServer.url("").toString()
        )

        // Act
        val actual = runBlocking { sut.play("", UUID.randomUUID().toString(), 1, 1, MockAction) }

        assertEquals(expected, actual)
    }

    @Test
    fun `game not found`() {
        // Arrange
        val problemDto = ProblemDto(
            type = "gameNotFound",
            title = null,
            detail = null,
            instance = null
        )

        rule.webServer.enqueue(
            MockResponse()
                .setResponseCode(404)
                .addHeader("Content-Type", "application/problem+json")
                .setBody(rule.gson.toJson(problemDto))
        )

        val sut = APIGamesService(
            client = rule.httpClient,
            gson = rule.gson,
            apiBaseUrl = rule.webServer.url("").toString()
        )

        // Act
        val actual = runBlocking {
            val result = kotlin.runCatching { sut.fetchGame("", MockLink) }
            return@runBlocking result.exceptionOrNull()
        }

        // Assert
        assertIs<APIException>(actual)
        assertEquals("gameNotFound", actual.type)
    }

    @Test
    fun `the server is down`() {
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

        val sut = APIGamesService(
            client = rule.httpClient,
            gson = rule.gson,
            apiBaseUrl = rule.webServer.url("").toString()
        )

        // Act
        val actual = runBlocking {
            val result = kotlin.runCatching { sut.fetchVariants("", MockLink) }
            return@runBlocking result.exceptionOrNull()
        }

        // Assert
        assertIs<APIException>(actual)
        assertEquals("internalServerError", actual.type)
    }
}