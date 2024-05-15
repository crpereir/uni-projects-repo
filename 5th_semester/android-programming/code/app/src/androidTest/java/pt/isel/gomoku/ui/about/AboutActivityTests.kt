package pt.isel.gomoku.ui.about

import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.performClick
import androidx.test.core.app.ActivityScenario
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_ABOUT_NAVIGATE_BACK
import pt.isel.gomoku.utils.createPreserveDefaultDependenciesComposeRuleNoActivity

class AboutActivityTests {

    @get:Rule
    val testRule = createPreserveDefaultDependenciesComposeRuleNoActivity()

    @Test
    fun `about activity`() {
        // Arrange
        ActivityScenario.launch(AboutActivity::class.java).use {
            // Act

            // Assert
            testRule.onNodeWithTag(TEST_TAG_ABOUT_SCREEN).assertExists()
            testRule.onNodeWithTag(TEST_TAG_TOP_BAR_ABOUT_NAVIGATE_BACK).assertExists()
            testRule.onNodeWithTag(TEST_TAG_SEND_EMAIL_BUTTON).assertExists()
        }
    }

    @Test
    fun `click on back navigation finishes the activity`() {
        // Arrange
        ActivityScenario.launch(AboutActivity::class.java).use { scenario ->
            // Act
            testRule.onNodeWithTag(TEST_TAG_TOP_BAR_ABOUT_NAVIGATE_BACK).performClick()

            // Assert
            scenario.onActivity { activity ->
                testRule.waitUntil(
                    timeoutMillis = 200,
                    condition = { activity.isFinishing }
                )
            }
        }
    }
}