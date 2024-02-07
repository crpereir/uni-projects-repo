package pt.isel.gomoku.ui.home

import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.performClick
import androidx.test.core.app.ActivityScenario
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.datetime.Clock
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.ui.about.TEST_TAG_ABOUT_SCREEN
import pt.isel.gomoku.ui.authentication.TEST_TAG_LOGIN_SCREEN
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_HOME_NAVIGATE_TO_INFO
import pt.isel.gomoku.ui.common.utils.TEST_TAG_ERROR
import pt.isel.gomoku.ui.home.HomeActivity
import pt.isel.gomoku.ui.ranking.TEST_TAG_RANKING_LOADED_SCREEN
import pt.isel.gomoku.ui.startGame.TEST_TAG_START_LOADED_SCREEN
import pt.isel.gomoku.utils.PreserveDefaultDependenciesNoActivity
import pt.isel.gomoku.utils.createPreserveDefaultDependenciesComposeRuleNoActivity
import kotlin.time.Duration.Companion.hours

class HomeActivityTests {

    @get:Rule
    val testRule = createPreserveDefaultDependenciesComposeRuleNoActivity()

    private val testApplication by lazy {
        (testRule.activityRule as PreserveDefaultDependenciesNoActivity).testApplication
    }

    private val testUserInfo = UserInfo("test", "test", Clock.System.now().plus(5.hours))

    @Test
    fun `home activity`() {
        // Arrange
        ActivityScenario.launch(HomeActivity::class.java).use {
            // Act

            // Assert
            testRule.onNodeWithTag(TEST_TAG_HOME_SCREEN).assertExists()
            testRule.onNodeWithTag(TEST_TAG_TOP_BAR_HOME_NAVIGATE_TO_INFO).assertExists()
            testRule.onNodeWithTag(TEST_TAG_PLAY_GAME_BUTTON).assertExists()
            testRule.onNodeWithTag(TEST_TAG_RANKING_BUTTON).assertExists()
        }
    }

    @Test
    fun `click on info navigation navigates to about activity`() {
        // Arrange
        ActivityScenario.launch(HomeActivity::class.java).use {
            // Act
            testRule.onNodeWithTag(TEST_TAG_TOP_BAR_HOME_NAVIGATE_TO_INFO).performClick()
            testRule.waitForIdle()

            // Assert
            testRule.onNodeWithTag(TEST_TAG_ABOUT_SCREEN).assertExists()
        }
    }

    @Test
    fun `click on play game navigation navigates to auth activity if the user is not authenticated`() {
        // Arrange
        testApplication.userInfoRepository = mockk {
            coEvery { getUserInfo() } returns null
        }

        ActivityScenario.launch(HomeActivity::class.java).use {
            // Act
            testRule.onNodeWithTag(TEST_TAG_PLAY_GAME_BUTTON).performClick()
            testRule.waitForIdle()

            // Assert
            testRule.onNodeWithTag(TEST_TAG_LOGIN_SCREEN).assertExists()
        }
    }

    @Test
    fun `click on play game navigation navigates to start game activity if the user is authenticated`() {
        // Arrange
        testApplication.userInfoRepository = mockk {
            coEvery { getUserInfo() } returns testUserInfo
        }

        ActivityScenario.launch(HomeActivity::class.java).use {
            // Act
            testRule.onNodeWithTag(TEST_TAG_PLAY_GAME_BUTTON).performClick()
            testRule.waitForIdle()

            // Assert
            testRule.onNodeWithTag(TEST_TAG_START_LOADED_SCREEN).assertExists()
        }
    }

    @Test
    fun `click on play game navigation navigates to auth activity if the user token has already expired`() {
        // Arrange
        testApplication.userInfoRepository = mockk {
            coEvery { getUserInfo() } returns
                    UserInfo("test", "test", Clock.System.now().minus(5.hours))
        }

        ActivityScenario.launch(HomeActivity::class.java).use {
            // Act
            testRule.onNodeWithTag(TEST_TAG_PLAY_GAME_BUTTON).performClick()
            testRule.waitForIdle()

            // Assert
            testRule.onNodeWithTag(TEST_TAG_LOGIN_SCREEN).assertExists()
        }
    }

    @Test
    fun `an error message is displayed if an error occurs while loading user info`() {
        // Arrange
        testApplication.userInfoRepository = mockk {
            coEvery { getUserInfo() } throws Exception()
        }

        ActivityScenario.launch(HomeActivity::class.java).use {
            // Act
            testRule.onNodeWithTag(TEST_TAG_PLAY_GAME_BUTTON).performClick()
            testRule.waitForIdle()

            // Assert
            testRule.onNodeWithTag(TEST_TAG_ERROR).assertExists()
        }
    }

    @Test
    fun `click on ranking navigation navigates to ranking activity`() {
        // Arrange
        ActivityScenario.launch(HomeActivity::class.java).use {
            // Act
            testRule.onNodeWithTag(TEST_TAG_RANKING_BUTTON).performClick()
            testRule.waitForIdle()

            // Assert
            testRule.onNodeWithTag(TEST_TAG_RANKING_LOADED_SCREEN).assertExists()
        }
    }
}