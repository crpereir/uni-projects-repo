package pt.isel.gomoku.presentation.presentation

import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.cancelAndJoin
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.TestScope
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.withTimeout
import kotlinx.datetime.Clock
import org.junit.Assert
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.domain.services.UsersService
import pt.isel.gomoku.domain.services.exceptions.EmptyFieldsException
import pt.isel.gomoku.domain.services.exceptions.InvalidEmailException
import pt.isel.gomoku.domain.services.exceptions.PasswordNotSecureException
import pt.isel.gomoku.domain.services.local.emptySiren
import pt.isel.gomoku.domain.states.AuthState
import pt.isel.gomoku.domain.states.IOState
import pt.isel.gomoku.domain.states.Loading
import pt.isel.gomoku.domain.states.Saved
import pt.isel.gomoku.domain.states.getOrNull
import pt.isel.gomoku.domain.users.Token
import pt.isel.gomoku.domain.users.User
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.domain.users.UserInfoRepository
import pt.isel.gomoku.presentation.utils.MockMainDispatcherRule
import pt.isel.gomoku.presentation.utils.SuspendingGate
import pt.isel.gomoku.ui.authentication.AuthViewModel
import java.util.UUID
import kotlin.test.assertIs
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.time.Duration.Companion.hours

class AuthViewModelTests {

    @get:Rule
    val rule = MockMainDispatcherRule(testDispatcher = StandardTestDispatcher())

    private val token = Token(UUID.randomUUID().toString(), Clock.System.now().plus(5.hours))
    private val user = User(1, "user1", "user1Email@isel.pt")

    private val testUserInfo =
        UserInfo("user1", "token user1", Clock.System.now().plus(5.hours))

    private val userInfoRepo = mockk<UserInfoRepository> {
        coEvery { updateUserInfo(testUserInfo) } coAnswers { }
    }

    private val usersService = mockk<UsersService> {
        coEvery { getLinkRelations() } coAnswers { null }
        coEvery { getActionNames() } coAnswers { null }
        coEvery { signUp("user1", "user1@isel.pt", "Random123") } coAnswers { emptySiren() }
        coEvery { login("user1", "Random123") } coAnswers { emptySiren(token) }
        coEvery { me(token.token) } coAnswers { emptySiren(user) }

        coEvery { login("", "") } coAnswers { throw EmptyFieldsException }
        coEvery { signUp("", "", "") } coAnswers { throw EmptyFieldsException }
        coEvery { signUp("user1", "user1", "Random123") } coAnswers { throw InvalidEmailException }
        coEvery {
            signUp(
                "user1",
                "user1@isel.pt",
                "1234"
            )
        } coAnswers { throw PasswordNotSecureException }
    }

    private suspend fun checkCleanError(sut: AuthViewModel, scope: TestScope) {
        // Arrange
        val gate = SuspendingGate()
        var lastCollectedState: IOState<UserInfo?>? = null
        val collectJob = scope.launch {
            sut.ioState.collectLatest {
                if ((it is AuthState.LoginMode && it.error == null || it is AuthState.SignUpMode && it.error == null)) {
                    lastCollectedState = it
                    gate.open()
                }
            }
        }
        sut.cleanError()

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val modeWithNoError = lastCollectedState as? AuthState
        Assert.assertNotNull(
            "Expected SignUpMode but got $lastCollectedState instead",
            modeWithNoError
        )
        assertNull(modeWithNoError?.getLastError())
    }

    @Test
    fun `initially the io state is loginMode and there is no user info`() = runTest {
        // Arrange
        val sut = AuthViewModel(usersService, userInfoRepo, null, null)

        // Act
        val gate = SuspendingGate()
        var collectedState: IOState<UserInfo?>? = null
        val collectJob = launch {
            sut.ioState.collect {
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
        Assert.assertTrue(
            "Expected LoginMode bot got $collectedState instead",
            collectedState is AuthState.LoginMode
        )
        assertNull(collectedState?.getOrNull())
    }

    @Test
    fun `changeMode emits to the io state the signUpMode state`() = runTest {
        // Arrange
        val sut = AuthViewModel(usersService, userInfoRepo, null, null)

        // Act
        val gate = SuspendingGate()
        var collectedState: IOState<UserInfo?>? = null
        val collectJob = launch {
            sut.ioState.collect {
                if (it is AuthState.SignUpMode) {
                    collectedState = it
                    gate.open()
                }
            }
        }
        sut.changeMode()

        // Lets wait for the flow to emit the first value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        Assert.assertTrue(
            "Expected SignUpMode bot got $collectedState instead",
            collectedState is AuthState.SignUpMode
        )
        assertNull(collectedState?.getOrNull())
    }

    @Test
    fun `login emits to the user info flow the loading state`() = runTest {
        // Arrange
        val sut = AuthViewModel(usersService, userInfoRepo, null, null)

        // Act
        val gate = SuspendingGate()
        var collectedState: IOState<UserInfo?>? = null
        val collectJob = launch {
            sut.ioState.collect {
                if (it is Loading) {
                    collectedState = it
                    gate.open()
                }
            }
        }
        sut.login("user1", "1234")

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val loaded = collectedState as? Loading
        Assert.assertNotNull("Expected Loading but got $collectedState instead", loaded)
        assertNull(collectedState?.getOrNull())
    }

    @Test
    fun `signUp emits to the user info flow the loading state`() = runTest {
        // Arrange
        val sut = AuthViewModel(usersService, userInfoRepo, null, null)

        // Act
        val gate = SuspendingGate()
        var collectedState: IOState<UserInfo?>? = null
        val collectJob = launch {
            sut.ioState.collect {
                if (it is Loading) {
                    collectedState = it
                    gate.open()
                }
            }
        }
        sut.signup("user1", "user1Email@isel.pt", "Random123")

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val loading = collectedState as? Loading
        Assert.assertNotNull("Expected Loading but got $collectedState instead", loading)
        assertNull(collectedState?.getOrNull())
    }

    @Test
    fun `login emits to the user info flow the saved state`() = runTest {
        // Arrange
        val sut = AuthViewModel(usersService, userInfoRepo, null, null)

        // Act
        val gate = SuspendingGate()
        var collectedState: IOState<UserInfo?>? = null
        val collectJob = launch {
            sut.ioState.collect {
                if (it is Saved) {
                    collectedState = it
                    gate.open()
                }
            }
        }
        sut.login("user1", "Random123")

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val saved = collectedState as? Saved
        Assert.assertNotNull("Expected Saved but got $collectedState instead", saved)
    }

    @Test
    fun `signup emits to the user info flow the saved state`() = runTest {
        // Arrange
        val sut = AuthViewModel(usersService, userInfoRepo, null, null)

        // Act
        val gate = SuspendingGate()
        var collectedState: IOState<UserInfo?>? = null
        val collectJob = launch {
            sut.ioState.collect {
                if (it is Saved) {
                    collectedState = it
                    gate.open()
                }
            }
        }
        sut.signup("user1", "user1@isel.pt", "Random123")

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val saved = collectedState as? Saved
        Assert.assertNotNull("Expected Saved but got $collectedState instead", saved)
    }

    @Test
    fun `reset emits to the io state flow the loginMode state`() = runTest {
        // Arrange
        val sut = AuthViewModel(usersService, userInfoRepo, null, null)

        // Act
        val gate = SuspendingGate()
        var collectedState: IOState<UserInfo?>? = null
        var resetCalled = false
        val collectJob = launch {
            sut.ioState.collect {
                if (it is AuthState.LoginMode) {
                    sut.signup("user1", "user1@isel.pt", "Random123")
                }
                if (it is Saved) {
                    sut.reset()
                    resetCalled = true
                }
                if (it is AuthState.LoginMode && resetCalled) {
                    collectedState = it
                    gate.open()
                }
            }
        }

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val loginMode = collectedState as? AuthState.LoginMode
        Assert.assertNotNull("Expected Idle but got $collectedState instead", loginMode)
    }

    @Test
    fun `login validate empty fields and cleanError clean the error`() = runTest {
        // Arrange
        val sut = AuthViewModel(usersService, userInfoRepo, null, null)

        val gate = SuspendingGate()
        var lastCollectedState: IOState<UserInfo?>? = null
        val collectJob = launch {
            sut.ioState.collectLatest {
                if (it is AuthState.LoginMode && it.error != null) {
                    lastCollectedState = it
                    gate.open()
                }
            }
        }
        sut.login("", "")

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val loginModeWithError = lastCollectedState as? AuthState.LoginMode
        Assert.assertNotNull(
            "Expected LoginMode but got $lastCollectedState instead",
            loginModeWithError
        )
        assertNotNull(loginModeWithError?.getLastError())
        assertIs<EmptyFieldsException>(loginModeWithError?.getLastError())

        // Clean error
        checkCleanError(sut, this)
    }

    @Test
    fun `signup validate empty fields and cleanError clean the error`() = runTest {
        // Arrange
        val sut = AuthViewModel(usersService, userInfoRepo, null, null)

        val gate = SuspendingGate()
        var lastCollectedState: IOState<UserInfo?>? = null
        val collectJob = launch {
            sut.ioState.collectLatest {
                if (it is AuthState.SignUpMode && it.error != null) {
                    lastCollectedState = it
                    gate.open()
                }
            }
        }
        sut.signup("", "", "")

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val signUpModeWithError = lastCollectedState as? AuthState.SignUpMode
        Assert.assertNotNull(
            "Expected SignUpMode but got $lastCollectedState instead",
            signUpModeWithError
        )
        assertNotNull(signUpModeWithError?.getLastError())
        assertIs<EmptyFieldsException>(signUpModeWithError?.getLastError())

        // Clean error
        checkCleanError(sut, this)
    }

    @Test
    fun `signup validate email format and cleanError clean the error`() = runTest {
        // Arrange
        val sut = AuthViewModel(usersService, userInfoRepo, null, null)

        val gate = SuspendingGate()
        var lastCollectedState: IOState<UserInfo?>? = null
        val collectJob = launch {
            sut.ioState.collectLatest {
                if (it is AuthState.SignUpMode && it.error != null) {
                    lastCollectedState = it
                    gate.open()
                }
            }
        }
        sut.signup("user1", "user1", "Random123")

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val signUpModeWithError = lastCollectedState as? AuthState.SignUpMode
        Assert.assertNotNull(
            "Expected SignUpMode but got $lastCollectedState instead",
            signUpModeWithError
        )
        assertNotNull(signUpModeWithError?.getLastError())
        assertIs<InvalidEmailException>(signUpModeWithError?.getLastError())

        // Clean error
        checkCleanError(sut, this)
    }

    @Test
    fun `signup validate secure password and cleanError clean the error`() = runTest {
        // Arrange
        val sut = AuthViewModel(usersService, userInfoRepo, null, null)

        val gate = SuspendingGate()
        var lastCollectedState: IOState<UserInfo?>? = null
        val collectJob = launch {
            sut.ioState.collectLatest {
                if (it is AuthState.SignUpMode && it.error != null) {
                    lastCollectedState = it
                    gate.open()
                }
            }
        }
        sut.signup("user1", "user1@isel.pt", "1234")

        // Lets wait for the flow to emit the latest value
        withTimeout(10000) {
            gate.await()
            collectJob.cancelAndJoin()
        }

        // Assert
        val signUpModeWithError = lastCollectedState as? AuthState.SignUpMode
        Assert.assertNotNull(
            "Expected SignUpMode but got $lastCollectedState instead",
            signUpModeWithError
        )
        assertNotNull(signUpModeWithError?.getLastError())
        assertIs<PasswordNotSecureException>(signUpModeWithError?.getLastError())

        // Clean error
        checkCleanError(sut, this)
    }
}