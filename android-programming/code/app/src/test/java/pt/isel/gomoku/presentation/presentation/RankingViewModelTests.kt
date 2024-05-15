package pt.isel.gomoku.presentation.presentation

import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.cancelAndJoin
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.withTimeout
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.services.UsersService
import pt.isel.gomoku.domain.services.local.emptySiren
import pt.isel.gomoku.domain.states.LoadState
import pt.isel.gomoku.domain.states.LoadState.Initial
import pt.isel.gomoku.domain.states.LoadState.Loaded
import pt.isel.gomoku.domain.states.LoadState.Loading
import pt.isel.gomoku.domain.users.Ranking
import pt.isel.gomoku.domain.users.UserStatistics
import pt.isel.gomoku.domain.utils.Page
import pt.isel.gomoku.presentation.utils.MockMainDispatcherRule
import pt.isel.gomoku.presentation.utils.SuspendingGate
import pt.isel.gomoku.ui.ranking.RankingViewModel

class RankingViewModelTests {

    private val user1 = UserStatistics(1, "user1", 1, 0, 0, 0, 0)
    private val user2 = UserStatistics(2, "user2", 1, 0, 0, 0, 0)

    private val sirenRanking = emptySiren(
        Ranking(
            totalUsers = 1,
            ranking = listOf(user1, user2)
        )
    )

    @get:Rule
    val rule = MockMainDispatcherRule(testDispatcher = StandardTestDispatcher())

    private val usersService = mockk<UsersService> {
        coEvery { fetchRanking(null) } coAnswers { sirenRanking }
    }

    @Test
    fun `initially the load state flow is initial and there is no user selected`() = runTest {
        // Arrange
        val sut = RankingViewModel(usersService, null)

        // Act
        val gate = SuspendingGate()
        var collectedState: LoadState<Siren<Ranking>>? = null
        val collectJob = launch {
            sut.loadState.collect {
                collectedState = it
                gate.open()
            }
        }

        // Lets wait for the flow to emit the first value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        assertTrue("Expected Idle bot got $collectedState instead", collectedState is Initial)
        assertNull(sut.userSelected)
    }

    @Test
    fun `fetchRanking emits to the load state flow the loading state`() = runTest {
        // Arrange
        val sut = RankingViewModel(usersService, null)

        // Act
        val gate = SuspendingGate()
        var lastCollectedState: LoadState<Siren<Ranking>>? = null
        val collectJob = launch {
            sut.loadState.collect {
                if (it is Loading) {
                    lastCollectedState = it
                    gate.open()
                }
            }
        }
        sut.fetchRanking()

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val loading = lastCollectedState as? Loading
        assertNotNull("Expected Loading but got $lastCollectedState instead", loading)
    }

    @Test
    fun `fetchRanking emits to the load state flow the loaded state`() = runTest {
        // Arrange
        val sut = RankingViewModel(usersService, null)

        // Act
        val gate = SuspendingGate()
        var lastCollectedState: LoadState<Siren<Ranking>>? = null
        val collectJob = launch {
            sut.loadState.collectLatest {
                if (it is Loaded) {
                    lastCollectedState = it
                    gate.open()
                }
            }
        }
        sut.fetchRanking()

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val loaded = lastCollectedState as? Loaded
        assertNotNull("Expected Loaded but got $lastCollectedState instead", loaded)
        assertTrue(sut.getPage() == Page.SINGLE)
    }

    @Test
    fun `can select a user after the load state flow is loaded`() = runTest {
        // Arrange
        val sut = RankingViewModel(usersService, null)

        val gate = SuspendingGate()
        val collectJob = launch {
            sut.loadState.collectLatest {
                if (it is Loaded) {
                    gate.open()
                }
            }
        }
        sut.fetchRanking()

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Act
        sut.onUserSelected(user1.userId)

        // Assert
        assertEquals(user1.userId, sut.userSelected?.userId)
    }

    @Test
    fun `can deselect a user after the load state flow is loaded and a user is selected`() =
        runTest {
            // Arrange
            val sut = RankingViewModel(usersService, null)

            val gate = SuspendingGate()
            val collectJob = launch {
                sut.loadState.collectLatest {
                    if (it is Loaded) {
                        gate.open()
                    }
                }
            }
            sut.fetchRanking()

            // Lets wait for the flow to emit the latest value
            withTimeout(10000) {
                gate.await()
                collectJob.cancelAndJoin()
            }
            sut.onUserSelected(user1.userId)

            // Act
            sut.onUserSelected(null)

            // Assert
            assertNull(sut.userSelected?.userId)
        }
}
