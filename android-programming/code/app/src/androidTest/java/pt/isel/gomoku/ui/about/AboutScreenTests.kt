package pt.isel.gomoku.ui.about

import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.performClick
import junit.framework.TestCase.assertTrue
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.domain.about.Author
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_ABOUT_NAVIGATE_BACK

class AboutScreenTests {

    @get:Rule
    val composeTestRule = createComposeRule()

    private val authors = listOf(
        Author("João Bonacho", "49437", "a49437@alunos.isel.pt"),
        Author("Carolina Pereira", "49470", "a49470@alunos.isel.pt"),
        Author("André Gonçalves", "49464", "a49464@alunos.isel.pt")
    )

    @Test
    fun `about screen`() {
        // Arrange

        // Act
        composeTestRule.setContent {
            AboutScreen(
                authors = authors,
                onBackRequested = { },
                onSendEmailRequested = { },
            )
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_ABOUT_SCREEN).assertExists()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_ABOUT_NAVIGATE_BACK).assertExists()
        composeTestRule.onNodeWithTag(TEST_TAG_SEND_EMAIL_BUTTON).assertExists()
    }

    @Test
    fun `click on back navigation calls callback`() {
        // Arrange
        var backRequested = false
        composeTestRule.setContent {
            AboutScreen(
                authors = authors,
                onBackRequested = { backRequested = true },
                onSendEmailRequested = { },
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_ABOUT_NAVIGATE_BACK).performClick()

        // Assert
        assertTrue(backRequested)
    }

    @Test
    fun `click on send email calls callback`() {
        // Arrange
        var sendEmailRequested = false
        composeTestRule.setContent {
            AboutScreen(
                authors = authors,
                onBackRequested = { },
                onSendEmailRequested = { sendEmailRequested = true },
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_SEND_EMAIL_BUTTON).performClick()

        // Assert
        assertTrue(sendEmailRequested)
    }
}
