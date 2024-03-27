package pt.isel.gomoku.presentation.presentation

import io.mockk.coEvery
import io.mockk.mockk
import junit.framework.TestCase.assertTrue
import kotlinx.coroutines.cancelAndJoin
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.TestScope
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.withTimeout
import kotlinx.datetime.Clock
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.services.GamesService
import pt.isel.gomoku.domain.services.UsersService
import pt.isel.gomoku.domain.services.local.emptySiren
import pt.isel.gomoku.domain.services.local.genMonitorSiren
import pt.isel.gomoku.domain.services.local.genStartGameAction
import pt.isel.gomoku.domain.services.local.siren
import pt.isel.gomoku.domain.states.IOState
import pt.isel.gomoku.domain.states.Idle
import pt.isel.gomoku.domain.states.LoadState
import pt.isel.gomoku.domain.states.Loaded
import pt.isel.gomoku.domain.states.Loading
import pt.isel.gomoku.domain.states.StartGameState
import pt.isel.gomoku.domain.users.User
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.domain.users.UserInfoRepository
import pt.isel.gomoku.domain.variants.OpeningRules
import pt.isel.gomoku.domain.variants.PlayingRules
import pt.isel.gomoku.domain.variants.Variant
import pt.isel.gomoku.domain.variants.Variants
import pt.isel.gomoku.presentation.utils.MockMainDispatcherRule
import pt.isel.gomoku.presentation.utils.SuspendingGate
import pt.isel.gomoku.ui.startGame.StartGameViewModel
import java.util.UUID
import kotlin.test.assertNotEquals
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.time.Duration.Companion.hours

class StartGameViewModelTests {

    @get:Rule
    val rule = MockMainDispatcherRule(testDispatcher = StandardTestDispatcher())

    private val testUserInfo = UserInfo("user1", "token user1", Clock.System.now().plus(5.hours))

    private val sirenVariants = siren(
        props = Variants(
            listOf(
                Variant(1, 15, OpeningRules.NONE, PlayingRules.FREESTYLE),
                Variant(2, 19, OpeningRules.NONE, PlayingRules.FREESTYLE)
            )
        ),
        actions = genStartGameAction()
    )

    private val sirenStartGame = genMonitorSiren(UUID.randomUUID())

    private val userInfoRepo = mockk<UserInfoRepository> {
        coEvery { getUserInfo() } coAnswers { testUserInfo }
        coEvery { removeUserInfo() } coAnswers { }
    }

    private val usersService = mockk<UsersService> {
        coEvery { getActionNames() } coAnswers { null }
        coEvery { me("token user1") } coAnswers { emptySiren(User(1, "user1", "user1Email")) }
        coEvery { logout("token user1") } coAnswers { }
    }

    private val gamesService = mockk<GamesService> {
        coEvery { getActionNames() } coAnswers { null }
        coEvery { getLinkRelations() } coAnswers { null }
        coEvery { fetchVariants("token user1") } coAnswers { sirenVariants }
        coEvery { startGame("token user1", 1) } coAnswers { sirenStartGame }
    }


    private suspend fun setup(vm: StartGameViewModel, scope: TestScope) {
        val gate1 = SuspendingGate()
        val collectLoadStateJob = scope.launch {
            vm.loadState.collect {
                if (it is LoadState.Loading) {
                    gate1.open()
                }
            }
        }

        val gate2 = SuspendingGate()
        val collectUserInfoJob = scope.launch {
            vm.userInfo.collect {
                if (it is Loading) {
                    gate2.open()
                }
            }
        }
        vm.fetchUserInfoAndVariants()

        // Lets wait for the flow to emit the first value
        withTimeout(1000) {
            gate1.await()
            collectLoadStateJob.cancelAndJoin()
        }

        // Lets wait for the flow to emit the first value
        withTimeout(1000) {
            gate2.await()
            collectUserInfoJob.cancelAndJoin()
        }
    }

    @Test
    fun `initially the load state flow is initial and user info flow is idle and there is no variant chosen`() =
        runTest {
            // Arrange
            val sut = StartGameViewModel(usersService, gamesService, userInfoRepo, null)

            // Act
            val gate1 = SuspendingGate()
            var collectedLoadState: LoadState<Siren<Variants>>? = null
            val collectLoadStateJob = launch {
                sut.loadState.collect {
                    collectedLoadState = it
                    gate1.open()
                }
            }

            val gate2 = SuspendingGate()
            var collectedUserInfo: IOState<UserInfo?>? = null
            val collectUserInfoJob = launch {
                sut.userInfo.collect {
                    collectedUserInfo = it
                    gate2.open()
                }
            }

            // Lets wait for the flow to emit the first value
            withTimeout(1000) {
                gate1.await()
                collectLoadStateJob.cancelAndJoin()
            }

            // Lets wait for the flow to emit the first value
            withTimeout(1000) {
                gate2.await()
                collectUserInfoJob.cancelAndJoin()
            }

            // Assert
            assertTrue(
                "Expected Initial bot got $collectedLoadState instead",
                collectedLoadState is LoadState.Initial
            )
            assertTrue(
                "Expected Idle bot got $collectedUserInfo instead",
                collectedUserInfo is Idle
            )
            assertNull(sut.variant)
        }

    @Test
    fun `fetchUserInfoAndVariants emits to the load state flow and user info flow the loading state`() =
        runTest {
            // Arrange
            val sut = StartGameViewModel(usersService, gamesService, userInfoRepo, null)

            // Act
            val gate1 = SuspendingGate()
            var collectedLoadState: LoadState<Siren<Variants>>? = null
            val collectLoadStateJob = launch {
                sut.loadState.collect {
                    if (it is LoadState.Loading) {
                        collectedLoadState = it
                        gate1.open()
                    }
                }
            }

            val gate2 = SuspendingGate()
            var collectedUserInfo: IOState<UserInfo?>? = null
            val collectUserInfoJob = launch {
                sut.userInfo.collect {
                    if (it is Loading) {
                        collectedUserInfo = it
                        gate2.open()
                    }
                }
            }
            sut.fetchUserInfoAndVariants()

            // Lets wait for the flow to emit the first value
            withTimeout(1000) {
                gate1.await()
                collectLoadStateJob.cancelAndJoin()
            }

            // Lets wait for the flow to emit the first value
            withTimeout(1000) {
                gate2.await()
                collectUserInfoJob.cancelAndJoin()
            }

            // Assert
            assertTrue(
                "Expected Loading bot got $collectedLoadState instead",
                collectedLoadState is LoadState.Loading
            )
            assertTrue(
                "Expected Loading bot got $collectedUserInfo instead",
                collectedUserInfo is Loading
            )
        }

    @Test
    fun `fetchUserInfoAndVariants emits to the load state flow and user info flow the loaded state and and there is a default variant chosen`() =
        runTest {
            // Arrange
            val sut = StartGameViewModel(usersService, gamesService, userInfoRepo, null)

            // Act
            val gate1 = SuspendingGate()
            var collectedLoadState: LoadState<Siren<Variants>>? = null
            val collectLoadStateJob = launch {
                sut.loadState.collectLatest {
                    if (it is LoadState.Loaded) {
                        collectedLoadState = it
                        gate1.open()
                    }
                }
            }

            val gate2 = SuspendingGate()
            var collectedUserInfo: IOState<UserInfo?>? = null
            val collectUserInfoJob = launch {
                sut.userInfo.collectLatest {
                    if (it is Loaded) {
                        collectedUserInfo = it
                        gate2.open()
                    }
                }
            }
            sut.fetchUserInfoAndVariants()

            // Lets wait for the flow to emit the first value
            withTimeout(1000) {
                gate1.await()
                collectLoadStateJob.cancelAndJoin()
            }

            // Lets wait for the flow to emit the first value
            withTimeout(1000) {
                gate2.await()
                collectUserInfoJob.cancelAndJoin()
            }

            // Assert
            assertTrue(
                "Expected Loaded bot got $collectedLoadState instead",
                collectedLoadState is LoadState.Loaded
            )
            assertTrue(
                "Expected Loaded bot got $collectedUserInfo instead",
                collectedUserInfo is Loaded
            )
            assertNotNull(sut.variant)
        }

    @Test
    fun `startGame emits to the load state flow the loading state`() = runTest {
        // Arrange
        val sut = StartGameViewModel(usersService, gamesService, userInfoRepo, null)
        setup(sut, this)

        // Act
        val gate = SuspendingGate()
        var collectedLoadState: LoadState<Siren<Variants>>? = null
        val collectLoadStateJob = launch {
            sut.loadState.collect {
                if (it is LoadState.Loading) {
                    collectedLoadState = it
                    gate.open()
                }
            }
        }
        sut.startGame()

        // Lets wait for the flow to emit the first value
        withTimeout(10000) {
            gate.await()
            collectLoadStateJob.cancelAndJoin()
        }

        // Assert
        assertTrue(
            "Expected Loading bot got $collectedLoadState instead",
            collectedLoadState is LoadState.Loading
        )
    }

    @Test
    fun `startGame emits to the load state flow the ready state`() = runTest {
        // Arrange
        val sut = StartGameViewModel(usersService, gamesService, userInfoRepo, null)
        setup(sut, this)

        // Act
        val gate = SuspendingGate()
        var collectedLoadState: LoadState<Siren<Variants>>? = null
        val collectLoadStateJob = launch {
            sut.loadState.collect {
                if (it is StartGameState.Ready) {
                    collectedLoadState = it
                    gate.open()
                }
            }
        }
        sut.startGame()

        // Lets wait for the flow to emit the first value
        withTimeout(10000) {
            gate.await()
            collectLoadStateJob.cancelAndJoin()
        }

        // Assert
        assertTrue(
            "Expected StartGameState Ready bot got $collectedLoadState instead",
            collectedLoadState is StartGameState.Ready
        )
    }

    @Test
    fun `logout emits to the load state flow the loading state`() = runTest {
        // Arrange
        val sut = StartGameViewModel(usersService, gamesService, userInfoRepo, null)
        setup(sut, this)

        // Act
        val gate = SuspendingGate()
        var collectedLoadState: LoadState<Siren<Variants>>? = null
        val collectLoadStateJob = launch {
            sut.loadState.collect {
                if (it is LoadState.Loading) {
                    collectedLoadState = it
                    gate.open()
                }
            }
        }
        sut.logout()

        // Lets wait for the flow to emit the first value
        withTimeout(1000) {
            gate.await()
            collectLoadStateJob.cancelAndJoin()
        }

        // Assert
        assertTrue(
            "Expected Loading bot got $collectedLoadState instead",
            collectedLoadState is LoadState.Loading
        )
    }

    @Test
    fun `logout emits to the load state flow the loggedOut state`() = runTest {
        // Arrange
        val sut = StartGameViewModel(usersService, gamesService, userInfoRepo, null)
        setup(sut, this)

        // Act
        val gate = SuspendingGate()
        var collectedLoadState: LoadState<Siren<Variants>>? = null
        val collectLoadStateJob = launch {
            sut.loadState.collectLatest {
                if (it is StartGameState.LoggedOut) {
                    collectedLoadState = it
                    gate.open()
                }
            }
        }
        sut.logout()

        // Lets wait for the flow to emit the first value
        withTimeout(10000) {
            gate.await()
            collectLoadStateJob.cancelAndJoin()
        }

        // Assert
        assertTrue(
            "Expected LoggedOut bot got $collectedLoadState instead",
            collectedLoadState is StartGameState.LoggedOut
        )
    }

    @Test
    fun `can change variant after the setup ready`() = runTest {
        // Arrange
        val sut = StartGameViewModel(usersService, gamesService, userInfoRepo, null)
        setup(sut, this)

        val defaultVariant = sut.variant

        // Act
        sut.changeVariant()

        // Assert
        val newVariant = sut.variant
        assertNotEquals(defaultVariant, newVariant)
    }

    @Test
    fun `reset emits to the load start flow to the initial state and user info flow the idle state`() =
        runTest {
            // Arrange
            val sut = StartGameViewModel(usersService, gamesService, userInfoRepo, null)
            setup(sut, this)

            // Act
            val gate1 = SuspendingGate()
            var collectedLoadState: LoadState<Siren<Variants>>? = null
            val collectLoadStateJob = launch {
                sut.loadState.collectLatest {
                    if (it is LoadState.Initial) {
                        collectedLoadState = it
                        gate1.open()
                    }
                }
            }

            val gate2 = SuspendingGate()
            var collectedUserInfo: IOState<UserInfo?>? = null
            val collectUserInfoJob = launch {
                sut.userInfo.collectLatest {
                    if (it is Idle) {
                        collectedUserInfo = it
                        gate2.open()
                    }
                }
            }
            sut.reset()

            // Lets wait for the flow to emit the first value
            withTimeout(1000) {
                gate1.await()
                collectLoadStateJob.cancelAndJoin()
            }

            // Lets wait for the flow to emit the first value
            withTimeout(1000) {
                gate2.await()
                collectUserInfoJob.cancelAndJoin()
            }

            // Assert
            assertTrue(
                "Expected Initial bot got $collectedLoadState instead",
                collectedLoadState is LoadState.Initial
            )
            assertTrue(
                "Expected Idle bot got $collectedUserInfo instead",
                collectedUserInfo is Idle
            )
        }
}