package pt.isel.gomoku.ui.auth

import androidx.compose.ui.test.assertIsEnabled
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.performClick
import junit.framework.TestCase.assertTrue
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.ui.authentication.SignUpScreenView
import pt.isel.gomoku.ui.authentication.TEST_TAG_LOGIN_SCREEN
import pt.isel.gomoku.ui.authentication.TEST_TAG_SIGNUP_BUTTON
import pt.isel.gomoku.ui.authentication.TEST_TAG_SIGNUP_SCREEN
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_AUTH_NAVIGATE_BACK
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_AUTH_NAVIGATE_SIGNUP

class SignUpScreenViewTests {

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun `signup screen`() {
        // Arrange

        // Act
        composeTestRule.setContent {
            SignUpScreenView(
                onBackRequested = { },
                onSignUpSubmitted = { _, _, _ -> }
            )
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_SIGNUP_SCREEN).assertExists()

        composeTestRule.onNodeWithTag(TEST_TAG_SIGNUP_BUTTON).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_AUTH_NAVIGATE_BACK).assertIsEnabled()

        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_AUTH_NAVIGATE_SIGNUP).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_LOGIN_SCREEN).assertDoesNotExist()
    }

    @Test
    fun `click on back navigation calls callback`() {
        // Arrange
        var backRequested = false
        composeTestRule.setContent {
            SignUpScreenView(
                onBackRequested = { backRequested = true },
                onSignUpSubmitted = { _, _, _ -> }
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
        var signUpSubmitted = false
        composeTestRule.setContent {
            SignUpScreenView(
                onBackRequested = { },
                onSignUpSubmitted = { _, _, _ -> signUpSubmitted = true }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_SIGNUP_BUTTON).performClick()

        // Assert
        assertTrue(signUpSubmitted)
    }
}
