import androidx.compose.ui.test.assertIsDisplayed
import androidx.test.ext.junit.runners.AndroidJUnit4
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.onNodeWithText
import androidx.compose.ui.test.performClick
import androidx.compose.ui.test.performTextInput
import com.example.crowdtally.CONFIGURING_TAG
import com.example.crowdtally.COUNTING_TAG
import com.example.crowdtally.ConfiguringView
import com.example.crowdtally.CountingView


@RunWith(AndroidJUnit4::class)
class CountingViewTest {

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun counting_view_correctly_displays_count_and_limit() {
        val count = 5
        val limit = 10

        composeTestRule.setContent {
            CountingView(
                count = count,
                limit = limit,
                onIncrement = {},
                onDecrement = {},
                onStartConfiguring = {}
            )
        }
        composeTestRule.onNodeWithText("Counter: $count").assertIsDisplayed()
        composeTestRule.onNodeWithText("Limit: $limit").assertIsDisplayed()
    }

    @Test
    fun counting_view_increments_count_when_increment_button_is_clicked() {
        var count = 0
        val limit = 10

        composeTestRule.setContent {
            CountingView(
                count = count,
                limit = limit,
                onIncrement = {},
                onDecrement = {},
                onStartConfiguring = {}
            )
        }
        composeTestRule.onNodeWithTag(testTag = COUNTING_TAG).assertExists()
        composeTestRule.onNodeWithText("+").performClick()
        composeTestRule.onNodeWithText("Counter: ${count++}").assertExists()
    }

    @Test
    fun counting_view_decrements_count_when_decrement_button_is_clicked() {
        var count = 10
        val limit = 10

        composeTestRule.setContent {
            CountingView(
                count = count,
                limit = limit,
                onIncrement = {},
                onDecrement = {},
                onStartConfiguring = {}
            )
        }
        composeTestRule.onNodeWithTag(testTag = COUNTING_TAG).assertExists()
        composeTestRule.onNodeWithText("-").performClick()
        composeTestRule.onNodeWithText("Counter: ${count--}").assertExists()
    }

    @Test
    fun counting_view_does_not_increment_count_when_increment_button_is_clicked_and_count_is_already_at_limit() {
        var count = 10
        val limit = 10

        composeTestRule.setContent {
            CountingView(
                count = count,
                limit = limit,
                onIncrement = { count++ },
                onDecrement = {},
                onStartConfiguring = {}
            )
        }
        composeTestRule.onNodeWithTag(testTag = COUNTING_TAG).assertExists()
        composeTestRule.onNodeWithText("+").performClick()
        composeTestRule.onNodeWithText("Counter: $count").assertExists()
    }

    @Test
    fun counting_view_does_not_decrement_count_when_decrement_button_is_clicked_and_count_is_already_at_zero(){
        var count = 0
        val limit = 10

        composeTestRule.setContent {
            CountingView(
                count = count,
                limit = limit,
                onIncrement = {},
                onDecrement = { count-- },
                onStartConfiguring = {}
            )
        }
        composeTestRule.onNodeWithTag(testTag = COUNTING_TAG).assertExists()
        composeTestRule.onNodeWithText("-").performClick()
        composeTestRule.onNodeWithText("Counter: $count").assertExists()
    }

    @Test
    fun configuration_view_changes_limit_when_confirm_button_is_clicked() {
        var newLimit = "5"

        composeTestRule.setContent {
            ConfiguringView(
                newLimit = newLimit,
                onNewLimitChanged = { newLimit = it },
                onConfirm = {},
                onCancel = {}
            )
        }

        composeTestRule.onNodeWithTag(testTag = CONFIGURING_TAG).assertExists()
        composeTestRule.onNodeWithText("New Limit").performTextInput(newLimit)
        composeTestRule.onNodeWithText("Confirm").performClick()
    }
}