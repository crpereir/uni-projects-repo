package pt.isel.gomoku.ui.auth

import androidx.compose.ui.test.assertIsEnabled
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.performClick
import junit.framework.TestCase.assertTrue
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.ui.authentication.LogInScreenView
import pt.isel.gomoku.ui.authentication.TEST_TAG_LOGIN_BUTTON
import pt.isel.gomoku.ui.authentication.TEST_TAG_LOGIN_SCREEN
import pt.isel.gomoku.ui.authentication.TEST_TAG_SIGNUP_SCREEN
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_AUTH_NAVIGATE_BACK
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_AUTH_NAVIGATE_SIGNUP

class LogInScreenViewTests {

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun `login screen`() {
        // Arrange

        // Act
        composeTestRule.setContent {
            LogInScreenView(
                onBackRequested = { },
                onSignUpRequested = { },
                onLogInSubmitted = { _, _ -> }
            )
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_LOGIN_SCREEN).assertExists()

        composeTestRule.onNodeWithTag(TEST_TAG_LOGIN_BUTTON).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_AUTH_NAVIGATE_BACK).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_AUTH_NAVIGATE_SIGNUP).assertIsEnabled()

        composeTestRule.onNodeWithTag(TEST_TAG_SIGNUP_SCREEN).assertDoesNotExist()
    }

    @Test
    fun `click on back navigation calls callback`() {
        // Arrange
        var backRequested = false
        composeTestRule.setContent {
            LogInScreenView(
                onBackRequested = { backRequested = true },
                onSignUpRequested = { },
                onLogInSubmitted = { _, _ -> }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_AUTH_NAVIGATE_BACK).performClick()

        // Assert
        assertTrue(backRequested)
    }


    @Test
    fun `click on signup navigation calls callback`() {
        // Arrange
        var signUpRequested = false
        composeTestRule.setContent {
            LogInScreenView(
                onBackRequested = { },
                onSignUpRequested = { signUpRequested = true },
                onLogInSubmitted = { _, _ -> }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_AUTH_NAVIGATE_SIGNUP).performClick()

        // Assert
        assertTrue(signUpRequested)
    }

    @Test
    fun `click on login navigation calls callback`() {
        // Arrange
        var logInSubmitted = false
        composeTestRule.setContent {
            LogInScreenView(
                onBackRequested = { },
                onSignUpRequested = { },
                onLogInSubmitted = { _, _ -> logInSubmitted = true }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_LOGIN_BUTTON).performClick()

        // Assert
        assertTrue(logInSubmitted)
    }
}
