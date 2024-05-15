package pt.isel.gomoku.ui.ranking

import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.performClick
import androidx.test.core.app.ActivityScenario
import io.mockk.coEvery
import io.mockk.mockk
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.domain.services.local.emptySiren
import pt.isel.gomoku.domain.users.Ranking
import pt.isel.gomoku.domain.users.UserStatistics
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_RANKING_NAVIGATE_BACK
import pt.isel.gomoku.ui.ranking.RankingActivity
import pt.isel.gomoku.utils.PreserveDefaultDependenciesNoActivity
import pt.isel.gomoku.utils.createPreserveDefaultDependenciesComposeRuleNoActivity

class RankingActivityTests {

    private val sirenRanking = emptySiren(
        Ranking(
            totalUsers = 1,
            ranking = listOf(
                UserStatistics(1, "user1", 1, 0, 0, 0, 0),
                UserStatistics(2, "user2", 1, 0, 0, 0, 0)
            )
        )
    )

    @get:Rule
    val testRule = createPreserveDefaultDependenciesComposeRuleNoActivity()

    private val testApplication by lazy {
        (testRule.activityRule as PreserveDefaultDependenciesNoActivity).testApplication
    }

    @Test
    fun `ranking activity`() {
        // Arrange
        ActivityScenario.launch(RankingActivity::class.java).use {
            // Act

            // Assert
            testRule.onNodeWithTag(TEST_TAG_RANKING_LOADED_SCREEN).assertExists()
        }
    }

    @Test
    fun `click on back navigation finishes the activity`() {
        // Arrange
        testApplication.usersService = mockk {
            coEvery { fetchRanking(null) } returns sirenRanking
        }

        ActivityScenario.launch(RankingActivity::class.java).use { scenario ->
            // Act
            testRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_NAVIGATE_BACK).performClick()

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
