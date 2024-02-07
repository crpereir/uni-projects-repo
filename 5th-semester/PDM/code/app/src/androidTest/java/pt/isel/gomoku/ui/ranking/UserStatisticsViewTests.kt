package pt.isel.gomoku.ui.ranking

import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.performClick
import junit.framework.TestCase
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.domain.users.UserStatistics

class UserStatisticsViewTests {

    private val user1 = UserStatistics(1, "user1", 1, 0, 0, 0, 0)

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun `user statistics view`() {
        // Arrange

        // Act
        composeTestRule.setContent {
            UserStatisticsView(
                user = user1,
                onDeselectUser = { }
            )
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_SCREEN_USER_DETAILS).assertExists()
    }

    @Test
    fun `click on close calls callback`() {
        // Arrange
        var closeRequested = false
        composeTestRule.setContent {
            UserStatisticsView(
                user = user1,
                onDeselectUser = { closeRequested = true }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_DESELECT_USER_BUTTON).performClick()

        // Assert
        TestCase.assertTrue(closeRequested)
    }
}