package pt.isel.gomoku.ui.home

import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.performClick
import junit.framework.TestCase.assertTrue
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_HOME_NAVIGATE_TO_INFO

class HomeScreenTests {

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun `home screen`() {
        // Arrange

        // Act
        composeTestRule.setContent {
            HomeScreen(
                onInfoRequested = { },
                onPlayGameRequested = { },
                onRankingRequested = { },
                onPlayGameEnabled = true,
                onRankingEnabled = true
            )
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_HOME_SCREEN).assertExists()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_HOME_NAVIGATE_TO_INFO).assertExists()
        composeTestRule.onNodeWithTag(TEST_TAG_PLAY_GAME_BUTTON).assertExists()
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_BUTTON).assertExists()
    }

    @Test
    fun `click on info navigation calls callback`() {
        // Arrange
        var infoRequested = false
        composeTestRule.setContent {
            HomeScreen(
                onInfoRequested = { infoRequested = true },
                onPlayGameRequested = { },
                onRankingRequested = { },
                onPlayGameEnabled = true,
                onRankingEnabled = true
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_HOME_NAVIGATE_TO_INFO).performClick()

        // Assert
        assertTrue(infoRequested)
    }

    @Test
    fun `click on play game navigation calls callback`() {
        // Arrange
        var logInRequested = false
        composeTestRule.setContent {
            HomeScreen(
                onInfoRequested = { },
                onPlayGameRequested = { logInRequested = true },
                onRankingRequested = { },
                onPlayGameEnabled = true,
                onRankingEnabled = true
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_PLAY_GAME_BUTTON).performClick()

        // Assert
        assertTrue(logInRequested)
    }

    @Test
    fun `click on ranking navigation calls callback`() {
        // Arrange
        var rankingRequested = false
        composeTestRule.setContent {
            HomeScreen(
                onInfoRequested = { },
                onPlayGameRequested = { },
                onRankingRequested = { rankingRequested = true },
                onPlayGameEnabled = true,
                onRankingEnabled = true
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_BUTTON).performClick()

        // Assert
        assertTrue(rankingRequested)
    }
}
