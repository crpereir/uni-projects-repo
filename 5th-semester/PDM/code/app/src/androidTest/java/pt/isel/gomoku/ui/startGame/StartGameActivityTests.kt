package pt.isel.gomoku.ui.startGame

import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.performClick
import androidx.test.core.app.ActivityScenario
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.datetime.Clock
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.domain.services.local.emptySiren
import pt.isel.gomoku.domain.users.User
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.domain.variants.OpeningRules
import pt.isel.gomoku.domain.variants.PlayingRules
import pt.isel.gomoku.domain.variants.Variant
import pt.isel.gomoku.domain.variants.Variants
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_START_GAME_LOGOUT
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_START_GAME_NAVIGATE_BACK
import pt.isel.gomoku.ui.game.TEST_TAG_WAITING_SCREEN
import pt.isel.gomoku.ui.startGame.StartGameActivity
import pt.isel.gomoku.utils.PreserveDefaultDependenciesNoActivity
import pt.isel.gomoku.utils.createPreserveDefaultDependenciesComposeRuleNoActivity
import kotlin.time.Duration.Companion.hours

class StartGameActivityTests {

    private val sirenVariants = emptySiren(
        Variants(
            listOf(
                Variant(1, 15, OpeningRules.NONE, PlayingRules.FREESTYLE),
                Variant(2, 19, OpeningRules.NONE, PlayingRules.FREESTYLE)
            )
        )
    )

    private val testUserInfo = UserInfo("test", "test", Clock.System.now().plus(5.hours))

    @get:Rule
    val testRule = createPreserveDefaultDependenciesComposeRuleNoActivity()

    private val testApplication by lazy {
        (testRule.activityRule as PreserveDefaultDependenciesNoActivity).testApplication
    }

    @Test
    fun `start game activity`() {
        // Arrange
        ActivityScenario.launch(StartGameActivity::class.java).use {
            // Act

            // Assert
            testRule.onNodeWithTag(TEST_TAG_START_LOADED_SCREEN).assertExists()
        }
    }

    @Test
    fun `click on back navigation finishes the activity`() {
        // Arrange
        testApplication.userInfoRepository = mockk {
            coEvery { getUserInfo() } returns testUserInfo
            coEvery { getUserInfo() } returns
                    UserInfo("user1", "token user1", Clock.System.now().plus(5.hours))
        }

        testApplication.usersService = mockk {
            coEvery { getActionNames() } returns null
            coEvery { me("token user1") } returns emptySiren(User(1, "user1", "user1Email"))
        }

        testApplication.gamesService = mockk {
            coEvery { getLinkRelations() } returns null
            coEvery { fetchVariants("token user1", null) } returns sirenVariants
        }

        // Arrange
        ActivityScenario.launch(StartGameActivity::class.java).use { scenario ->
            // Act
            testRule.onNodeWithTag(TEST_TAG_TOP_BAR_START_GAME_NAVIGATE_BACK).performClick()

            // Assert
            scenario.onActivity { activity ->
                testRule.waitUntil(
                    timeoutMillis = 200,
                    condition = { activity.isFinishing }
                )
            }
        }
    }

    @Test
    fun `click on logout finish the activity after logout user`() {
        // Arrange
        testApplication.gamesService = mockk {
            coEvery { getLinkRelations() } returns null
            coEvery { fetchVariants("token user1", null) } returns sirenVariants
        }
        testApplication.usersService = mockk {
            coEvery { getActionNames() } returns null
            coEvery { me("token user1") } returns emptySiren(User(1, "user1", "user1Email"))
            coEvery { logout("token user1") } returns Unit
        }
        testApplication.userInfoRepository = mockk {
            coEvery { getUserInfo() } returns
                    UserInfo("user1", "token user1", Clock.System.now().plus(5.hours))
            coEvery { removeUserInfo() } returns Unit
        }

        ActivityScenario.launch(StartGameActivity::class.java).use { scenario ->
            // Act
            testRule.onNodeWithTag(TEST_TAG_TOP_BAR_START_GAME_LOGOUT).performClick()
            testRule.waitForIdle()

            // Assert
            scenario.onActivity { activity ->
                testRule.waitUntil(
                    timeoutMillis = 1000,
                    condition = { activity.isFinishing }
                )
            }
        }
    }

    @Test
    fun `click on start game navigates to game activity after start the game`() {
        // Arrange
        ActivityScenario.launch(StartGameActivity::class.java).use {
            // Act
            testRule.onNodeWithTag(TEST_TAG_START_GAME_BUTTON).performClick()
            testRule.waitForIdle()

            // Assert
            testRule.onNodeWithTag(TEST_TAG_WAITING_SCREEN)
        }
    }
}
