package pt.isel.gomoku.presentation.presentation

import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.cancelAndJoin
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.withTimeout
import kotlinx.datetime.Clock
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.domain.home.Home
import pt.isel.gomoku.domain.services.HomeService
import pt.isel.gomoku.domain.services.local.emptySiren
import pt.isel.gomoku.domain.states.HomeState
import pt.isel.gomoku.domain.states.IOState
import pt.isel.gomoku.domain.states.Idle
import pt.isel.gomoku.domain.states.LoadState
import pt.isel.gomoku.domain.states.Loaded
import pt.isel.gomoku.domain.states.Loading
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.domain.users.UserInfoRepository
import pt.isel.gomoku.presentation.utils.MockMainDispatcherRule
import pt.isel.gomoku.presentation.utils.SuspendingGate
import pt.isel.gomoku.ui.home.HomeViewModel
import pt.isel.gomoku.ui.home.NavigateTo
import kotlin.time.Duration.Companion.hours

class MainScreenViewModelTests {

    @get:Rule
    val rule = MockMainDispatcherRule(testDispatcher = StandardTestDispatcher())

    private val testUserInfo =
        UserInfo("user1", "token user1", Clock.System.now().plus(5.hours))

    private val userInfoRepo = mockk<UserInfoRepository> {
        coEvery { getUserInfo() } coAnswers { testUserInfo }
    }

    private val homeService = mockk<HomeService> {
        coEvery { getLinkRelations() } coAnswers { null }
        coEvery { getActionNames() } coAnswers { null }
        coEvery { getHome() } coAnswers { emptySiren(Home("welcome")) }
    }

    @Test
    fun `initially the user info flow is idle`() = runTest {
        // Arrange
        val sut = HomeViewModel(homeService, userInfoRepo)

        // Act
        val gate = SuspendingGate()
        var collectedState: IOState<UserInfo?>? = null
        val collectJob = launch {
            sut.userInfo.collect {
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
        assertTrue("Expected Idle bot got $collectedState instead", collectedState is Idle)
    }

    @Test
    fun `initially the home state flow is idle`() = runTest {
        // Arrange
        val sut = HomeViewModel(homeService, userInfoRepo)

        // Act
        val gate = SuspendingGate()
        var collectedState: LoadState<Nothing>? = null
        val collectJob = launch {
            sut.homeState.collect {
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
        assertTrue(
            "Expected Idle bot got $collectedState instead",
            collectedState is LoadState.Idle
        )
    }

    @Test
    fun `fetchUserInfo emits to the user info flow the loading state`() = runTest {
        // Arrange
        val sut = HomeViewModel(homeService, userInfoRepo)

        // Act
        val gate = SuspendingGate()
        var lastCollectedState: IOState<UserInfo?>? = null
        val collectJob = launch {
            sut.userInfo.collect {
                if (it is Loading) {
                    lastCollectedState = it
                    gate.open()
                }
            }
        }
        sut.fetchUserInfo()

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
    fun `fetchUserInfo emits to the user info flow the loaded state`() = runTest {
        // Arrange
        val sut = HomeViewModel(homeService, userInfoRepo)

        // Act
        val gate = SuspendingGate()
        var lastCollectedState: IOState<UserInfo?>? = null
        val collectJob = launch {
            sut.userInfo.collectLatest {
                if (it is Loaded) {
                    lastCollectedState = it
                    gate.open()
                }
            }
        }
        sut.fetchUserInfo()

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val loaded = lastCollectedState as? Loaded
        assertNotNull("Expected Loaded but got $lastCollectedState instead", loaded)
        assertEquals(testUserInfo, loaded?.value?.getOrNull())
    }

    @Test
    fun `fetchHome with ranking navigation emits to the home flow the ranking ready state`() =
        runTest {
            // Arrange
            val sut = HomeViewModel(homeService, userInfoRepo)

            // Act
            val gate = SuspendingGate()
            var lastCollectedState: LoadState<Nothing>? = null
            val collectJob = launch {
                sut.homeState.collect {
                    if (it is HomeState.RankingReady) {
                        lastCollectedState = it
                        gate.open()
                    }
                }
            }
            sut.fetchHome(NavigateTo.RANKING)

            // Lets wait for the flow to emit the latest value
            withTimeout(10000) {
                gate.await()
                collectJob.cancelAndJoin()
            }

            // Assert
            val rankingReady = lastCollectedState as? HomeState.RankingReady
            assertNotNull("Expected Loading but got $lastCollectedState instead", rankingReady)
        }

    @Test
    fun `fetchHome with play game navigation emits to the home flow the ranking ready state`() =
        runTest {
            // Arrange
            val sut = HomeViewModel(homeService, userInfoRepo)

            // Act
            val gate = SuspendingGate()
            var lastCollectedState: LoadState<Nothing>? = null
            val collectJob = launch {
                sut.homeState.collect {
                    if (it is HomeState.PlayGameReady) {
                        lastCollectedState = it
                        gate.open()
                    }
                }
            }
            sut.fetchHome(NavigateTo.PlAYGAME)

            // Lets wait for the flow to emit the latest value
            withTimeout(10000) {
                gate.await()
                collectJob.cancelAndJoin()
            }

            // Assert
            val playGameReady = lastCollectedState as? HomeState.PlayGameReady
            assertNotNull("Expected Loading but got $lastCollectedState instead", playGameReady)
        }

    @Test(expected = IllegalStateException::class)
    fun `fetchUserInfo throws if state is not idle`() {
        // Arrange
        val sut = HomeViewModel(homeService, userInfoRepo)
        sut.fetchUserInfo()

        // Act
        sut.fetchUserInfo()
    }

    @Test
    fun `reset emits to the user info flow the idle state`() = runTest {
        // Arrange
        val sut = HomeViewModel(homeService, userInfoRepo)

        // Act
        val gate = SuspendingGate()
        var lastCollectedState: IOState<UserInfo?>? = null
        var resetToIdleCalled = false
        val collectJob = launch {
            sut.userInfo.collectLatest {
                if (it is Loaded) {
                    sut.reset()
                    resetToIdleCalled = true
                }
                if (it is Idle && resetToIdleCalled) {
                    lastCollectedState = it
                    gate.open()
                }
            }
        }
        sut.fetchUserInfo()

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val idle = lastCollectedState as? Idle
        assertNotNull("Expected Idle but got $lastCollectedState instead", idle)
    }

    @Test
    fun `reset emits to the home state flow the idle state`() = runTest {
        // Arrange
        val sut = HomeViewModel(homeService, userInfoRepo)

        // Act
        val gate = SuspendingGate()
        var lastCollectedState: LoadState<Nothing>? = null
        var resetToIdleCalled = false
        val collectJob = launch {
            sut.homeState.collect {
                if (it is LoadState.Idle) {
                    sut.reset()
                    resetToIdleCalled = true
                }
                if (it is LoadState.Idle && resetToIdleCalled) {
                    lastCollectedState = it
                    gate.open()
                }
            }
        }
        sut.fetchHome(NavigateTo.RANKING)

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val idle = lastCollectedState as? LoadState.Idle
        assertNotNull("Expected Idle but got $lastCollectedState instead", idle)
    }
}