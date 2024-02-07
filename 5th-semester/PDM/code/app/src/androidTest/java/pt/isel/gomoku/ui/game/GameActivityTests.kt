package pt.isel.gomoku.ui.game

import android.content.Intent
import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.performClick
import androidx.test.core.app.ActivityScenario
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.datetime.Clock
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.domain.services.local.LocalGamesService
import pt.isel.gomoku.domain.services.local.genMonitorSiren
import pt.isel.gomoku.domain.services.local.genNoMonitorSiren
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.domain.variants.OpeningRules
import pt.isel.gomoku.domain.variants.PlayingRules
import pt.isel.gomoku.domain.variants.Variant
import pt.isel.gomoku.utils.PreserveDefaultDependenciesNoActivity
import pt.isel.gomoku.utils.createPreserveDefaultDependenciesComposeRuleNoActivity
import java.util.UUID
import kotlin.time.Duration.Companion.hours

class GameActivityTests {

    @get:Rule
    val testRule = createPreserveDefaultDependenciesComposeRuleNoActivity()

    private val testApplication by lazy {
        (testRule.activityRule as PreserveDefaultDependenciesNoActivity).testApplication
    }

    private val waitSiren = genMonitorSiren(UUID.randomUUID())
    private val noWaitSiren = genNoMonitorSiren(UUID.randomUUID())

    private val standardVariant = Variant(1, 15, OpeningRules.NONE, PlayingRules.FREESTYLE)

    private val testUserInfo = UserInfo("test", "test", Clock.System.now().plus(5.hours))


    @Test
    fun `shows board when game is ready`() {
        // Arrange
        val intent = Intent(testApplication.applicationContext, GameActivity::class.java)
        intent.putExtra(SIREN_EXTRA, SirenExtra(noWaitSiren))
        intent.putExtra(VARIANT_EXTRA, VariantExtra(standardVariant))
        ActivityScenario.launch<GameActivity>(intent).use {
            // Act
            testRule.waitForIdle()
            // Assert
            testRule.onNodeWithTag(TEST_TAG_BOARD_SCREEN).assertExists()
        }
    }

    @Test
    fun `click on give up button in monitor finishes the activity`() {
        // Arrange
        testApplication.userInfoRepository = mockk {
            coEvery { getUserInfo() } returns testUserInfo
        }

        testApplication.gamesService = LocalGamesService(2500)

        val intent = Intent(testApplication.applicationContext, GameActivity::class.java)
        intent.putExtra(SIREN_EXTRA, SirenExtra(waitSiren))
        intent.putExtra(VARIANT_EXTRA, VariantExtra(standardVariant))
        ActivityScenario.launch<GameActivity>(intent).use { scenario ->
            // Act
            testRule.waitForIdle()
            testRule.onNodeWithTag(TEST_TAG_WAITING_SCREEN).assertExists()
            testRule.onNodeWithTag(TEST_TAG_CANCEL_WAIT).assertExists()
            testRule.onNodeWithTag(TEST_TAG_CANCEL_WAIT).performClick()
            testRule.waitForIdle()

            // Assert
            testRule.onNodeWithTag(TEST_TAG_WAITING_SCREEN).assertDoesNotExist()
        }
    }

    @Test
    fun `click on give up fab finishes the activity`() {
        // Arrange
        testApplication.userInfoRepository = mockk {
            coEvery { getUserInfo() } returns testUserInfo
        }

        val intent = Intent(testApplication.applicationContext, GameActivity::class.java)
        intent.putExtra(SIREN_EXTRA, SirenExtra(noWaitSiren))
        intent.putExtra(VARIANT_EXTRA, VariantExtra(standardVariant))
        ActivityScenario.launch<GameActivity>(intent).use { scenario ->
            // Act
            testRule.waitForIdle()
            testRule.onNodeWithTag(TEST_TAG_GIVE_UP).performClick()

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