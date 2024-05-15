package pt.isel.gomoku.ui.ranking

import androidx.compose.ui.res.stringResource
import androidx.compose.ui.test.assertIsEnabled
import androidx.compose.ui.test.assertIsNotEnabled
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.performClick
import junit.framework.TestCase
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.R
import pt.isel.gomoku.domain.users.UserStatistics
import pt.isel.gomoku.domain.utils.Page
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_RANKING_NAVIGATE_BACK
import pt.isel.gomoku.ui.common.topbars.TEST_TAG_TOP_BAR_RANKING_REFRESH
import pt.isel.gomoku.ui.common.utils.CustomErrorScreenView
import pt.isel.gomoku.ui.common.utils.TEST_TAG_ERROR
import pt.isel.gomoku.ui.common.utils.TEST_TAG_ERROR_ALERT_FIRST_BUTTON
import pt.isel.gomoku.ui.common.utils.TEST_TAG_ERROR_ALERT_SECOND_BUTTON

class RankingScreenTests {

    private val user1 = UserStatistics(1, "user1", 1, 0, 0, 0, 0)
    private val user2 = UserStatistics(2, "user2", 1, 0, 0, 0, 0)

    private val ranking = listOf(user1, user2)

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun `ranking screen _initial state_`() {
        // Arrange

        // Act
        composeTestRule.setContent {
            RankingScreenLoadingView()
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADING_SCREEN).assertExists()

        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADED_SCREEN).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_NAVIGATE_BACK).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_REFRESH).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_FIRST_PAGE_BUTTON).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_LAST_PAGE_BUTTON).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_PREVIOUS_PAGE_BUTTON).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_NEXT_PAGE_BUTTON).assertDoesNotExist()
    }

    @Test
    fun `ranking screen _loading state_`() {
        // Arrange

        // Act
        composeTestRule.setContent {
            RankingScreenLoadingView()
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADING_SCREEN).assertExists()

        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADED_SCREEN).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_NAVIGATE_BACK).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_REFRESH).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_FIRST_PAGE_BUTTON).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_LAST_PAGE_BUTTON).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_PREVIOUS_PAGE_BUTTON).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_NEXT_PAGE_BUTTON).assertDoesNotExist()
    }

    @Test
    fun `ranking screen _loaded success state_ single page`() {
        // Arrange

        // Act
        composeTestRule.setContent {
            RankingScreenLoadedView(
                ranking = ranking,
                userSelected = null,
                page = Page.SINGLE,
                onBackRequested = { },
                onRefreshRequested = { },
                onFirstPageRequested = { },
                onLastPageRequested = { },
                onPreviousPageRequested = { },
                onNextPageRequested = { },
                onUserSelected = { _ -> }
            )
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADING_SCREEN).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADED_SCREEN).assertExists()

        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_NAVIGATE_BACK).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_REFRESH).assertIsEnabled()

        composeTestRule.onNodeWithTag(TEST_TAG_FIRST_PAGE_BUTTON).assertIsNotEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_LAST_PAGE_BUTTON).assertIsNotEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_PREVIOUS_PAGE_BUTTON).assertIsNotEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_NEXT_PAGE_BUTTON).assertIsNotEnabled()
    }

    @Test
    fun `ranking screen _loaded success state_ first page`() {
        // Arrange

        // Act
        composeTestRule.setContent {
            RankingScreenLoadedView(
                ranking = ranking,
                userSelected = null,
                page = Page.FIRST,
                onBackRequested = { },
                onRefreshRequested = { },
                onFirstPageRequested = { },
                onLastPageRequested = { },
                onPreviousPageRequested = { },
                onNextPageRequested = { },
                onUserSelected = { _ -> }
            )
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADING_SCREEN).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADED_SCREEN).assertExists()

        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_NAVIGATE_BACK).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_REFRESH).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_LAST_PAGE_BUTTON).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_NEXT_PAGE_BUTTON).assertIsEnabled()

        composeTestRule.onNodeWithTag(TEST_TAG_FIRST_PAGE_BUTTON).assertIsNotEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_PREVIOUS_PAGE_BUTTON).assertIsNotEnabled()
    }

    @Test
    fun `ranking screen _loaded success state_ last page`() {
        // Arrange

        // Act
        composeTestRule.setContent {
            RankingScreenLoadedView(
                ranking = ranking,
                userSelected = null,
                page = Page.LAST,
                onBackRequested = { },
                onRefreshRequested = { },
                onFirstPageRequested = { },
                onLastPageRequested = { },
                onPreviousPageRequested = { },
                onNextPageRequested = { },
                onUserSelected = { _ -> }
            )
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADING_SCREEN).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADED_SCREEN).assertExists()

        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_NAVIGATE_BACK).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_REFRESH).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_FIRST_PAGE_BUTTON).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_PREVIOUS_PAGE_BUTTON).assertIsEnabled()

        composeTestRule.onNodeWithTag(TEST_TAG_LAST_PAGE_BUTTON).assertIsNotEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_NEXT_PAGE_BUTTON).assertIsNotEnabled()
    }

    @Test
    fun `ranking screen _loaded success state_ middle page`() {
        // Arrange

        // Act
        composeTestRule.setContent {
            RankingScreenLoadedView(
                ranking = ranking,
                userSelected = null,
                page = Page.MIDDLE,
                onBackRequested = { },
                onRefreshRequested = { },
                onFirstPageRequested = { },
                onLastPageRequested = { },
                onPreviousPageRequested = { },
                onNextPageRequested = { },
                onUserSelected = { _ -> }
            )
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADING_SCREEN).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADED_SCREEN).assertExists()

        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_NAVIGATE_BACK).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_REFRESH).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_FIRST_PAGE_BUTTON).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_PREVIOUS_PAGE_BUTTON).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_LAST_PAGE_BUTTON).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_NEXT_PAGE_BUTTON).assertIsEnabled()
    }

    @Test
    fun `ranking screen _loaded success state_ with user details`() {
        // Arrange

        // Act
        composeTestRule.setContent {
            RankingScreenLoadedView(
                ranking = ranking,
                userSelected = user1,
                page = Page.MIDDLE,
                onBackRequested = { },
                onRefreshRequested = { },
                onFirstPageRequested = { },
                onLastPageRequested = { },
                onPreviousPageRequested = { },
                onNextPageRequested = { },
                onUserSelected = { _ -> }
            )
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADING_SCREEN).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADED_SCREEN).assertExists()
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_SCREEN_USER_DETAILS).assertExists()

        composeTestRule.onNodeWithTag(TEST_TAG_DESELECT_USER_BUTTON).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_NAVIGATE_BACK).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_REFRESH).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_FIRST_PAGE_BUTTON).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_PREVIOUS_PAGE_BUTTON).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_LAST_PAGE_BUTTON).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_NEXT_PAGE_BUTTON).assertIsEnabled()
    }

    @Test
    fun `ranking screen _loaded failure state_`() {
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
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADING_SCREEN).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_LOADED_SCREEN).assertDoesNotExist()

        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_NAVIGATE_BACK).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_REFRESH).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_FIRST_PAGE_BUTTON).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_PREVIOUS_PAGE_BUTTON).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_LAST_PAGE_BUTTON).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_NEXT_PAGE_BUTTON).assertDoesNotExist()

        composeTestRule.onNodeWithTag(TEST_TAG_ERROR_ALERT_FIRST_BUTTON).assertIsEnabled()
        composeTestRule.onNodeWithTag(TEST_TAG_ERROR_ALERT_SECOND_BUTTON).assertIsEnabled()
    }

    @Test
    fun `click on back navigation calls callback`() {
        // Arrange
        var backRequested = false
        composeTestRule.setContent {
            RankingScreenLoadedView(
                ranking = ranking,
                userSelected = null,
                page = Page.MIDDLE,
                onBackRequested = { backRequested = true },
                onRefreshRequested = { },
                onFirstPageRequested = { },
                onLastPageRequested = { },
                onPreviousPageRequested = { },
                onNextPageRequested = { },
                onUserSelected = { _ -> }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_NAVIGATE_BACK).performClick()

        // Assert
        TestCase.assertTrue(backRequested)
    }

    @Test
    fun `click on refresh calls callback`() {
        // Arrange
        var refreshRequested = false
        composeTestRule.setContent {
            RankingScreenLoadedView(
                ranking = ranking,
                userSelected = null,
                page = Page.MIDDLE,
                onBackRequested = { },
                onRefreshRequested = { refreshRequested = true },
                onFirstPageRequested = { },
                onLastPageRequested = { },
                onPreviousPageRequested = { },
                onNextPageRequested = { },
                onUserSelected = { _ -> }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_TOP_BAR_RANKING_REFRESH).performClick()

        // Assert
        TestCase.assertTrue(refreshRequested)
    }

    @Test
    fun `click on first page navigation calls callback`() {
        // Arrange
        var firstPageRequested = false
        composeTestRule.setContent {
            RankingScreenLoadedView(
                ranking = ranking,
                userSelected = null,
                page = Page.MIDDLE,
                onBackRequested = { },
                onRefreshRequested = { },
                onFirstPageRequested = { firstPageRequested = true },
                onLastPageRequested = { },
                onPreviousPageRequested = { },
                onNextPageRequested = { },
                onUserSelected = { _ -> }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_FIRST_PAGE_BUTTON).performClick()

        // Assert
        TestCase.assertTrue(firstPageRequested)
    }

    @Test
    fun `click on last page navigation calls callback`() {
        // Arrange
        var lastPageRequested = false
        composeTestRule.setContent {
            RankingScreenLoadedView(
                ranking = ranking,
                userSelected = null,
                page = Page.MIDDLE,
                onBackRequested = { },
                onRefreshRequested = { },
                onFirstPageRequested = { },
                onLastPageRequested = { lastPageRequested = true },
                onPreviousPageRequested = { },
                onNextPageRequested = { },
                onUserSelected = { _ -> }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_LAST_PAGE_BUTTON).performClick()

        // Assert
        TestCase.assertTrue(lastPageRequested)
    }

    @Test
    fun `click on previous page navigation calls callback`() {
        // Arrange
        var previousPageRequested = false
        composeTestRule.setContent {
            RankingScreenLoadedView(
                ranking = ranking,
                userSelected = null,
                page = Page.MIDDLE,
                onBackRequested = { },
                onRefreshRequested = { },
                onFirstPageRequested = { },
                onLastPageRequested = { },
                onPreviousPageRequested = { previousPageRequested = true },
                onNextPageRequested = { },
                onUserSelected = { _ -> }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_PREVIOUS_PAGE_BUTTON).performClick()

        // Assert
        TestCase.assertTrue(previousPageRequested)
    }

    @Test
    fun `click on next page navigation calls callback`() {
        // Arrange
        var nextPageRequested = false
        composeTestRule.setContent {
            RankingScreenLoadedView(
                ranking = ranking,
                userSelected = null,
                page = Page.MIDDLE,
                onBackRequested = { },
                onRefreshRequested = { },
                onFirstPageRequested = { },
                onLastPageRequested = { },
                onPreviousPageRequested = { },
                onNextPageRequested = { nextPageRequested = true },
                onUserSelected = { _ -> }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_NEXT_PAGE_BUTTON).performClick()

        // Assert
        TestCase.assertTrue(nextPageRequested)
    }

    @Test
    fun `click in one user calls callback`() {
        // Arrange
        var userSelectedRequested = false
        var userIdRequested: Int? = null
        composeTestRule.setContent {
            RankingScreenLoadedView(
                ranking = ranking,
                userSelected = null,
                page = Page.MIDDLE,
                onBackRequested = { },
                onRefreshRequested = { },
                onFirstPageRequested = { },
                onLastPageRequested = { },
                onPreviousPageRequested = { },
                onNextPageRequested = { },
                onUserSelected = { userId ->
                    userSelectedRequested = true
                    userIdRequested = userId
                }
            )
        }

        // Act
        composeTestRule.onNodeWithTag(TEST_TAG_RANKING_SELECTED_USER_ + user1.userId).performClick()

        // Assert
        TestCase.assertTrue(userSelectedRequested)
        TestCase.assertEquals(user1.userId, userIdRequested)
    }
}