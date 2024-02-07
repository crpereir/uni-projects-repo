package pt.isel.gomoku.ui.startGame

import androidx.compose.ui.res.stringResource
import androidx.compose.ui.test.assertIsEnabled
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.performClick
import junit.framework.TestCase
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.R
import pt.isel.gomoku.domain.variants.OpeningRules
import pt.isel.gomoku.domain.variants.PlayingRules
import pt.isel.gomoku.domain.variants.Variant
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_START_GAME_LOGOUT
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_START_GAME_NAVIGATE_BACK
import pt.isel.gomoku.ui.common.utils.CustomErrorScreenView
import pt.isel.gomoku.ui.common.utils.TEST_TAG_ERROR
import pt.isel.gomoku.ui.common.utils.TEST_TAG_ERROR_ALERT_FIRST_BUTTON
import pt.isel.gomoku.ui.common.utils.TEST_TAG_ERROR_ALERT_SECOND_BUTTON

class StartScreenTests {

    private val variant = Variant(1, 15, OpeningRules.NONE, PlayingRules.FREESTYLE)

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun `start game screen _initial state_ - _loading state_ - _start game ready state_ - _logout state_`() {
        // Arrange

        // Act
        composeTestRule.setContent {
            StartGameScreenLoadingView()
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_START_LOADING_SCREEN).assertExists()

        composeTestRule.onNodeWithTag(TEST_TAG_START_LOADED_SCREEN).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_START_GAME_NAVIGATE_BACK)
            .assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_START_GAME_LOGOUT).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_START_NEXT_VARIANT_BUTTON).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_START_GAME_BUTTON).assertDoesNotExist()
    }

    @Test
    fun `start game screen _loaded success state_`() {
        // Arrange

        // Act
        composeTestRule.setContent {
            StartGameScreenLoadedView(
                username = "user1",
                variantChosen = variant,
                onBackRequested = { },
                onLogOutRequested = { },
                onNextVariant = { },
                onStartGameRequested = { }
            )
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_START_LOADED_SCREEN).assertExists()

        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_START_GAME_NAVIGATE_BACK).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_START_GAME_LOGOUT).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_START_NEXT_VARIANT_BUTTON).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_START_GAME_BUTTON).assertIsEnabled()

        composeTestRule.onNodeWithTag(TEST_TAG_START_LOADING_SCREEN).assertDoesNotExist()
    }

    @Test
    fun `start game screen _loaded failure state_`() {
        // Arrange

        // Act
        composeTestRule.setContent {
            CustomErrorScreenView(
                title = stringResource(id = R.string.error_api_title),
                message = stringResource(id = R.string.error_could_not_reach_api),
                firstButtonText = R.string.error_back_button_text,
                secondButtonText = R.string.error_retry_button_text,
                onFirstButtonClick = { },
                onSecondButtonClick = { }
            )
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_ERROR).assertExists()

        composeTestRule.onNodeWithTag(TEST_TAG_START_LOADING_SCREEN).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_START_LOADED_SCREEN).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_START_GAME_NAVIGATE_BACK)
            .assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_START_GAME_LOGOUT).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_START_NEXT_VARIANT_BUTTON).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_START_GAME_BUTTON).assertDoesNotExist()

        composeTestRule.onNodeWithTag(TEST_TAG_ERROR_ALERT_FIRST_BUTTON).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_ERROR_ALERT_SECOND_BUTTON).assertIsEnabled()
    }

    @Test
    fun `click on back navigation calls callback`() {
        // Arrange
        var backRequested = false
        composeTestRule.setContent {
            StartGameScreenLoadedView(
                username = "user1",
                variantChosen = variant,
                onBackRequested = { backRequested = true },
                onLogOutRequested = { },
                onNextVariant = { },
                onStartGameRequested = { }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_START_GAME_NAVIGATE_BACK).performClick()

        // Assert
        TestCase.assertTrue(backRequested)
    }

    @Test
    fun `click on logout calls callback`() {
        // Arrange
        var logoutRequested = false
        composeTestRule.setContent {
            StartGameScreenLoadedView(
                username = "user1",
                variantChosen = variant,
                onBackRequested = { },
                onLogOutRequested = { logoutRequested = true },
                onNextVariant = { },
                onStartGameRequested = { }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_START_GAME_LOGOUT).performClick()

        // Assert
        TestCase.assertTrue(logoutRequested)
    }

    @Test
    fun `click on next variant calls callback`() {
        // Arrange
        var nextVariantRequested = false
        composeTestRule.setContent {
            StartGameScreenLoadedView(
                username = "user1",
                variantChosen = variant,
                onBackRequested = { },
                onLogOutRequested = { },
                onNextVariant = { nextVariantRequested = true },
                onStartGameRequested = { }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_START_NEXT_VARIANT_BUTTON).performClick()

        // Assert
        TestCase.assertTrue(nextVariantRequested)
    }

    @Test
    fun `click on start game calls callback`() {
        // Arrange
        var startGameRequested = false
        composeTestRule.setContent {
            StartGameScreenLoadedView(
                username = "user1",
                variantChosen = variant,
                onBackRequested = { },
                onLogOutRequested = { },
                onNextVariant = { },
                onStartGameRequested = { startGameRequested = true }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_START_GAME_BUTTON).performClick()

        // Assert
        TestCase.assertTrue(startGameRequested)
    }
}
