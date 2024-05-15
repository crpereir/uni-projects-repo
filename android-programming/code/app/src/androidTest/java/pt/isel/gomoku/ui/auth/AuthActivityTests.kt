package pt.isel.gomoku.ui.auth

import androidx.compose.ui.test.assertIsEnabled
import androidx.compose.ui.test.assertTextContains
import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.performClick
import androidx.compose.ui.test.performTextInput
import androidx.lifecycle.Lifecycle
import androidx.test.core.app.ActivityScenario
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.every
import io.mockk.mockk
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.datetime.Clock
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.services.UsersService
import pt.isel.gomoku.domain.states.Saved
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.domain.users.UserInfoRepository
import pt.isel.gomoku.ui.authentication.AuthActivity
import pt.isel.gomoku.ui.authentication.AuthViewModel
import pt.isel.gomoku.ui.authentication.TEST_TAG_AUTH_LOADING_SCREEN
import pt.isel.gomoku.ui.authentication.TEST_TAG_LOGIN_BUTTON
import pt.isel.gomoku.ui.authentication.TEST_TAG_LOGIN_IDENTITY
import pt.isel.gomoku.ui.authentication.TEST_TAG_LOGIN_PASSWORD
import pt.isel.gomoku.ui.authentication.TEST_TAG_LOGIN_SCREEN
import pt.isel.gomoku.ui.authentication.TEST_TAG_SIGNUP_BUTTON
import pt.isel.gomoku.ui.authentication.TEST_TAG_SIGNUP_EMAIL
import pt.isel.gomoku.ui.authentication.TEST_TAG_SIGNUP_IDENTITY
import pt.isel.gomoku.ui.authentication.TEST_TAG_SIGNUP_PASSWORD
import pt.isel.gomoku.ui.authentication.TEST_TAG_SIGNUP_SCREEN
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_AUTH_NAVIGATE_BACK
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_AUTH_NAVIGATE_SIGNUP
import pt.isel.gomoku.ui.home.TEST_TAG_HOME_SCREEN
import pt.isel.gomoku.ui.startGame.TEST_TAG_START_LOADED_SCREEN
import pt.isel.gomoku.ui.startGame.TEST_TAG_START_LOADING_SCREEN
import pt.isel.gomoku.utils.PreserveDefaultDependenciesNoActivity
import pt.isel.gomoku.utils.createPreserveDefaultDependenciesComposeRuleNoActivity
import java.sql.Statement

class AuthActivityTests {

    @get:Rule
    val testRule = createPreserveDefaultDependenciesComposeRuleNoActivity()

    private val testApplication by lazy {
        (testRule.activityRule as PreserveDefaultDependenciesNoActivity).testApplication
    }

    @Test
    fun `auth activity`() {
        // Arrange
        ActivityScenario.launch(AuthActivity::class.java).use {
            // Act

            // Assert
            testRule.onNodeWithTag(TEST_TAG_LOGIN_BUTTON).assertExists()
            testRule.onNodeWithTag(TEST_TAG_TOP_BAR_AUTH_NAVIGATE_BACK).assertIsEnabled()
            testRule.onNodeWithTag(TEST_TAG_TOP_BAR_AUTH_NAVIGATE_SIGNUP).assertIsEnabled()
            testRule.onNodeWithTag(TEST_TAG_SIGNUP_SCREEN).assertDoesNotExist()
        }
    }

    @Test
    fun `click on login button navigates to login activity if the user is not authenticated`() {
        // Arrange
        testApplication.userInfoRepository = mockk {
            coEvery { getUserInfo() } returns null
        }

        ActivityScenario.launch(AuthActivity::class.java).use {
            // Act
            testRule.onNodeWithTag(TEST_TAG_LOGIN_BUTTON).performClick()
            testRule.waitForIdle()

            // Assert
            testRule.onNodeWithTag(TEST_TAG_LOGIN_SCREEN).assertExists()
        }
    }

    @Test
    fun `click on signup button navigates to signup activity if the user is not authenticated`() {
        // Arrange
        testApplication.userInfoRepository = mockk {
            coEvery { getUserInfo() } returns null
        }

        ActivityScenario.launch(AuthActivity::class.java).use {
            // Act
            testRule.onNodeWithTag(TEST_TAG_TOP_BAR_AUTH_NAVIGATE_SIGNUP).performClick()
            testRule.waitForIdle()

            // Assert
            testRule.onNodeWithTag(TEST_TAG_SIGNUP_SCREEN).assertExists()
        }
    }

    @Test
    fun `entering information into input fields`() {

        ActivityScenario.launch(AuthActivity::class.java).use {
            // Act
            testRule.onNodeWithTag(TEST_TAG_LOGIN_IDENTITY).performTextInput("user1")
            testRule.onNodeWithTag(TEST_TAG_LOGIN_PASSWORD).performTextInput("Random123")

            testRule.onNodeWithTag(TEST_TAG_LOGIN_BUTTON).performClick()
            testRule.waitForIdle()

            // Assert
            testRule.onNodeWithTag(TEST_TAG_AUTH_LOADING_SCREEN).assertExists()
        }
    }


    @Test
    fun `entering information into signup fields`() {
        // Arrange
        ActivityScenario.launch(AuthActivity::class.java).use { scenario ->
            // Act
            testRule.onNodeWithTag(TEST_TAG_TOP_BAR_AUTH_NAVIGATE_SIGNUP).performClick()
            testRule.waitForIdle()

            testRule.onNodeWithTag(TEST_TAG_SIGNUP_IDENTITY).performTextInput("user122")
            testRule.onNodeWithTag(TEST_TAG_SIGNUP_EMAIL).performTextInput("user122@isel.pt")
            testRule.onNodeWithTag(TEST_TAG_SIGNUP_PASSWORD).performTextInput("Random123")

            testRule.onNodeWithTag(TEST_TAG_SIGNUP_BUTTON).performClick()
            testRule.waitForIdle()

            // Assert
            testRule.onNodeWithTag(TEST_TAG_AUTH_LOADING_SCREEN).assertExists()
        }
    }

}
