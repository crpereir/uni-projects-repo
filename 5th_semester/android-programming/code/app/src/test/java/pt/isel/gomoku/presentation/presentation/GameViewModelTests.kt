package pt.isel.gomoku.presentation.presentation

import io.mockk.coEvery
import io.mockk.mockk
import junit.framework.TestCase.assertNotNull
import junit.framework.TestCase.assertTrue
import kotlinx.coroutines.cancelAndJoin
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.withTimeout
import kotlinx.datetime.Clock
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.domain.games.Game
import pt.isel.gomoku.domain.games.Game.State.NEXT_TURN_W
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.services.local.LocalGamesService
import pt.isel.gomoku.domain.services.local.genMonitorSiren
import pt.isel.gomoku.domain.services.local.genNoMonitorSiren
import pt.isel.gomoku.domain.states.GameState
import pt.isel.gomoku.domain.states.LoadState
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.domain.users.UserInfoRepository
import pt.isel.gomoku.domain.variants.OpeningRules
import pt.isel.gomoku.domain.variants.PlayingRules
import pt.isel.gomoku.domain.variants.Variant
import pt.isel.gomoku.presentation.utils.MockMainDispatcherRule
import pt.isel.gomoku.presentation.utils.SuspendingGate
import pt.isel.gomoku.ui.game.GameViewModel
import java.util.UUID
import kotlin.test.assertEquals
import kotlin.test.assertNull
import kotlin.time.Duration.Companion.hours

class GameViewModelTests {

    @get:Rule
    val rule = MockMainDispatcherRule(testDispatcher = StandardTestDispatcher())

    private val testUserInfo = UserInfo("test", "test", Clock.System.now().plus(5.hours))
    private val userInfoRepo = mockk<UserInfoRepository> {
        coEvery { getUserInfo() } coAnswers { testUserInfo }
    }

    private val waitSiren = genMonitorSiren(UUID.randomUUID())
    private val noWaitSiren = genNoMonitorSiren(UUID.randomUUID())

    private val standardVariant = Variant(1, 15, OpeningRules.NONE, PlayingRules.FREESTYLE)

    @Test
    fun `initially the user info flow is initial`() = runTest {
        // Arrange
        val sut = GameViewModel(LocalGamesService(), userInfoRepo, noWaitSiren, standardVariant)
        // Act
        val gate = SuspendingGate()
        var collectedState: LoadState<Siren<Game>?>? = null
        val collectJob = launch {
            sut.loadState.collect {
                collectedState = it
                gate.open()
            }
        }

        // Lets wait for the flow to emit the first value
        withTimeout(1000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        assertTrue(
            "Expected Initial bot got $collectedState instead",
            collectedState is LoadState.Initial
        )
    }

    @Test
    fun `with monitor, next 'final' state should be waiting with no game`() = runTest {
        // Arrange
        val sut = GameViewModel(LocalGamesService(), userInfoRepo, waitSiren, standardVariant)
        // Act
        val gate = SuspendingGate()
        var collectedState: LoadState<Siren<Game>?>? = null
        val collectJob = launch {
            sut.loadState.collectLatest {
                if (it is GameState.Waiting && it.hasNothing()) {
                    collectedState = it
                    gate.open()
                }
            }
        }

        sut.setup()

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val waiting = collectedState as? GameState.Waiting
        assertNotNull("Expected waiting but got $collectedState instead", waiting)
        assertNull(waiting?.value?.getOrNull())
        assertNull(waiting?.value?.exceptionOrNull())
    }

    @Test
    fun `with monitor, stop waiting should go to give up`() = runTest {
        // Arrange
        val sut = GameViewModel(LocalGamesService(), userInfoRepo, waitSiren, standardVariant)
        // Act
        val gate = SuspendingGate(initialCount = 2)
        var collectedState: LoadState<Siren<Game>?>? = null
        val collectJob = launch {
            sut.loadState.collectLatest {
                if (it is GameState.Waiting && it.hasNothing()) {
                    sut.stopWaitingForPlayer()
                    gate.open()
                }
                if (it is GameState.GaveUp) {
                    collectedState = it
                    gate.open()
                }
            }
        }

        sut.setup()

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val gaveUp = collectedState as? GameState.GaveUp
        assertNotNull("Expected waiting but got $collectedState instead", gaveUp)
    }

    @Test
    fun `with no monitor, next 'final' state should be waiting with game`() = runTest {
        // Arrange
        val sut = GameViewModel(LocalGamesService(), userInfoRepo, noWaitSiren, standardVariant)
        // Act
        val gate = SuspendingGate()
        var collectedState: LoadState<Siren<Game>?>? = null
        val collectJob = launch {
            sut.loadState.collectLatest {
                if (it is GameState.Waiting && !it.hasNothing()) {
                    collectedState = it
                    gate.open()
                }
            }
        }

        sut.setup()

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val waiting = collectedState as? GameState.Waiting
        assertNotNull("Expected waiting but got $collectedState instead", waiting)
        assertNotNull(waiting?.value?.getOrNull())
        assertNull(waiting?.value?.exceptionOrNull())
    }

    @Test
    fun `with monitor, state should end up with game and able to play`() = runTest {
        // Arrange
        val sut = GameViewModel(LocalGamesService(), userInfoRepo, waitSiren, standardVariant)
        // Act
        val gate = SuspendingGate()
        var collectedState: LoadState<Siren<Game>?>? = null
        val collectJob = launch {
            sut.loadState.collectLatest {
                if (it is GameState.Playing) {
                    collectedState = it
                    gate.open()
                }
            }
        }

        sut.setup()

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val playing = collectedState as? GameState.Playing
        assertNotNull("Expected playing but got $collectedState instead", playing)
        assertNotNull(playing?.value?.getOrNull())
        assertNull(playing?.value?.exceptionOrNull())
    }

    @Test
    fun `without monitor, state should end up with game and able to play`() = runTest {
        // Arrange
        val sut = GameViewModel(LocalGamesService(), userInfoRepo, noWaitSiren, standardVariant)
        // Act
        val gate = SuspendingGate()
        var collectedState: LoadState<Siren<Game>?>? = null
        val collectJob = launch {
            sut.loadState.collectLatest {
                if (it is GameState.Playing) {
                    collectedState = it
                    gate.open()
                }
            }
        }

        sut.setup()

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val playing = collectedState as? GameState.Playing
        assertNotNull("Expected playing but got $collectedState instead", playing)
        assertNotNull(playing?.value?.getOrNull())
        assertNull(playing?.value?.exceptionOrNull())
    }

    @Test
    fun `in a game, should be allowed to play and wait for someone else`() = runTest {
        // Arrange
        val sut = GameViewModel(LocalGamesService(), userInfoRepo, noWaitSiren, standardVariant)
        // Act
        val gate = SuspendingGate(initialCount = 2)
        var collectedState: LoadState<Siren<Game>?>? = null
        val collectJob = launch {
            sut.loadState.collectLatest {
                if (it is GameState.Playing) {
                    if(collectedState == null) {
                        collectedState = it
                        sut.play(2, 2)
                    }
                    else {
                        collectedState = it
                    }
                    gate.open()
                }
            }
        }

        sut.setup()

        // Lets wait for the flow to emit the latest value
        withTimeout(20000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val playing = collectedState as? GameState.Playing
        assertNotNull("Expected waiting but got $collectedState instead", playing)
        val siren = playing?.value?.getOrNull()
        assertNull(playing?.value?.exceptionOrNull())
        val game = siren?.properties
        assertNotNull(game)
        requireNotNull(game)
        assertEquals(1, game.board.pieces.size)
        assertEquals(NEXT_TURN_W, game.state)
    }

    @Test
    fun `in a game, should be able to give up`() = runTest {
        // Arrange
        val sut = GameViewModel(LocalGamesService(), userInfoRepo, noWaitSiren, standardVariant)
        // Act
        val gate = SuspendingGate(initialCount = 2)
        var collectedState: LoadState<Siren<Game>?>? = null
        val collectJob = launch {
            sut.loadState.collectLatest {
                if (it is GameState.Playing) {
                    sut.giveUp()
                    gate.open()
                }
                else if (it is GameState.GaveUp) {
                    collectedState = it
                    gate.open()
                }
            }
        }

        sut.setup()

        // Lets wait for the flow to emit the latest value
        withTimeout(20000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val gaveUp = collectedState as? GameState.GaveUp
        assertNotNull("Expected waiting but got $collectedState instead", gaveUp)
    }
}