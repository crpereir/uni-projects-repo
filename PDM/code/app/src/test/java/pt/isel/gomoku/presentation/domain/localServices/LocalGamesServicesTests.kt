package pt.isel.gomoku.presentation.domain.localServices

import kotlinx.coroutines.runBlocking
import org.junit.Test
import pt.isel.gomoku.domain.games.Game
import pt.isel.gomoku.domain.games.Intersection
import pt.isel.gomoku.domain.games.Monitor
import pt.isel.gomoku.domain.games.Piece
import pt.isel.gomoku.domain.games.Player
import pt.isel.gomoku.domain.services.local.LocalGamesService
import java.util.UUID
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class LocalGamesServicesTests {

    private val totalVariants = 2

    @Test
    fun `variant fetching`() {
        val gamesService = LocalGamesService()
        runBlocking {
            val variants = gamesService.fetchVariants("")
            assertEquals(totalVariants, variants.properties?.variants?.size)
            variants.properties?.variants?.any { variant -> variant.boardDim == 15 }
                ?.let { assertTrue(it) }
            variants.properties?.variants?.any { variant -> variant.boardDim == 19 }
                ?.let { assertTrue(it) }
        }
    }

    @Test
    fun `start game`() {
        val gamesService = LocalGamesService()
        runBlocking {
            val monitor = gamesService.startGame("", 1)
            assertEquals(Monitor.Status.WAITING_FOR_OTHER_PLAYER, monitor.properties?.status)
        }
    }

    @Test
    fun `check monitor`() {
        val gamesService = LocalGamesService()
        runBlocking {
            val monitor = gamesService.statusMonitor("")
            assertEquals(Monitor.Status.OTHER_PLAYER_JOINED, monitor.properties?.status)
        }
    }

    @Test
    fun `check game state`() {
        val gamesService = LocalGamesService()
        runBlocking {
            gamesService.startGame("", 1)
            val game = gamesService.fetchGame("")
            assertEquals(Game.State.NEXT_TURN_B, game.properties?.state)
            assertEquals(listOf(), game.properties?.board?.pieces)
        }
    }

    @Test
    fun `make a move`() {
        val gamesService = LocalGamesService()
        runBlocking {
            gamesService.startGame("", 1)
            val game = gamesService.play("", UUID.randomUUID().toString(), 2, 2)
            assertEquals(Game.State.NEXT_TURN_W, game.properties?.state)
            assertEquals(
                Piece(Player.B, Intersection(2, 2)),
                game.properties?.board?.pieces?.get(0)
            )
        }
    }

    @Test
    fun `give up`() {
        val gamesService = LocalGamesService()
        runBlocking {
            gamesService.startGame("", 1)
            gamesService.giveUp("")
            val game = gamesService.fetchGame("")
            assertEquals(Game.State.WINNER_W, game.properties?.state)
        }
    }
}