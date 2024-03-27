package pt.isel.gomoku.ui.ranking

import android.annotation.SuppressLint
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.tooling.preview.Preview
import pt.isel.gomoku.domain.users.Ranking
import pt.isel.gomoku.domain.users.UserStatistics
import pt.isel.gomoku.domain.utils.Page
import pt.isel.gomoku.ui.common.topbars.NavigationHandlers
import pt.isel.gomoku.ui.common.theme.BACKGROUND
import pt.isel.gomoku.ui.common.theme.GomokuTheme
import pt.isel.gomoku.ui.common.topbars.RankingTopBar
import pt.isel.gomoku.ui.common.utils.CustomProgressIndicator

/**
 * Tags used to identify the components of the RankingScreen in automated tests.
 */
const val TEST_TAG_RANKING_LOADING_SCREEN = "TEST_TAG_RANKING_LOADING_SCREEN"
const val TEST_TAG_RANKING_LOADED_SCREEN = "TEST_TAG_RANKING_LOADED_SCREEN"
const val TEST_TAG_RANKING_SCREEN_USER_DETAILS = "TEST_TAG_RANKING_SCREEN_USER_DETAILS"
const val TEST_TAG_DESELECT_USER_BUTTON = "TEST_TAG_DESELECT_USER_BUTTON"
const val TEST_TAG_FIRST_PAGE_BUTTON = "TEST_TAG_FIRST_PAGE_BUTTON"
const val TEST_TAG_LAST_PAGE_BUTTON = "TEST_TAG_LAST_PAGE_BUTTON"
const val TEST_TAG_PREVIOUS_PAGE_BUTTON = "TEST_TAG_PREVIOUS_PAGE_BUTTON"
const val TEST_TAG_NEXT_PAGE_BUTTON = "TEST_TAG_NEXT_PAGE_BUTTON"

/**
 * Root composable for the ranking screen when is loading ranking.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun RankingScreenLoadingView() {
    GomokuTheme {
        Scaffold(
            modifier = Modifier
                .testTag(TEST_TAG_RANKING_LOADING_SCREEN)
                .fillMaxSize(),
            containerColor = BACKGROUND,
            topBar = {
                RankingTopBar()
            }
        ) { innerPadding ->
            Column(
                modifier = Modifier
                    .padding(innerPadding)
            ) {
                CustomProgressIndicator()
            }
        }
    }
}

/**
 * Root composable for the ranking screen, the one that displays information about the current users
 *  ranking of app, when is loaded.
 * @param ranking the [Ranking] to be displayed.
 * @param userSelected the [UserStatistics] to be displayed, if a user is selected.
 * @param page the current [Page] in the ranking to be displayed.
 * @param onBackRequested the callback to be invoked when the user requests to go back to the
 * previous screen.
 * @param onRefreshRequested the callback to be invoked when the user requests a ranking refresh.
 * @param onFirstPageRequested the callback to be invoked when the user requests the first page of the ranking.
 * @param onLastPageRequested the callback to be invoked when the user requests the last page of the ranking.
 * @param onPreviousPageRequested the callback to be invoked when the user requests the previous page of the ranking.
 * @param onNextPageRequested the callback to be invoked when the user requests the next page of the ranking.
 * @param onUserSelected the callback to be invoked when the user requests statistics from a ranking user.
 */
@SuppressLint("UnusedMaterial3ScaffoldPaddingParameter")
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun RankingScreenLoadedView(
    ranking: List<UserStatistics>,
    userSelected: UserStatistics?,
    page: Page,
    onBackRequested: () -> Unit,
    onRefreshRequested: () -> Unit,
    onFirstPageRequested: () -> Unit,
    onLastPageRequested: () -> Unit,
    onPreviousPageRequested: () -> Unit,
    onNextPageRequested: () -> Unit,
    onUserSelected: (Int?) -> Unit
) {
    GomokuTheme {
        Scaffold(
            modifier = Modifier
                .testTag(TEST_TAG_RANKING_LOADED_SCREEN)
                .fillMaxSize(),
            containerColor = BACKGROUND,
            topBar = {
                RankingTopBar(
                    navigation = NavigationHandlers(
                        onBackRequested = onBackRequested,
                        onRefreshRequested = onRefreshRequested
                    )
                )
            }
        ) { innerPadding ->
            Column(
                modifier = Modifier
                    .padding(innerPadding)
            ) {
                RankingView(
                    ranking = ranking,
                    userSelected = userSelected,
                    page = page,
                    onFirstPageRequested = onFirstPageRequested,
                    onLastPageRequested = onLastPageRequested,
                    onPreviousPageRequested = onPreviousPageRequested,
                    onNextPageRequested = onNextPageRequested,
                    onUserSelected = { id -> onUserSelected(id) }
                )
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun RankingScreenLoadingViewPreview() {
    RankingScreenLoadingView()
}

@Preview(showBackground = true)
@Composable
fun RankingScreenLoadedSuccessViewPreview() {
    RankingScreenLoadedView(
        ranking = listOf(
            UserStatistics(1, "user1", 1, 0, 0, 0, 0),
            UserStatistics(2, "user2", 1, 0, 0, 0, 0)
        ),
        userSelected = null,
        page = Page.SINGLE,
        onBackRequested = { },
        onRefreshRequested = { },
        onFirstPageRequested = { },
        onLastPageRequested = { },
        onPreviousPageRequested = { },
        onNextPageRequested = { },
        onUserSelected = { }
    )
}

@Preview(showBackground = true)
@Composable
fun RankingScreenLoadedSuccessViewUserSelectedPreview() {
    RankingScreenLoadedView(
        ranking = listOf(
            UserStatistics(1, "user1", 1, 0, 0, 0, 0),
            UserStatistics(2, "user2", 1, 0, 0, 0, 0)
        ),
        userSelected = UserStatistics(1, "user1", 1, 0, 0, 0, 0),
        page = Page.SINGLE,
        onBackRequested = { },
        onRefreshRequested = { },
        onFirstPageRequested = { },
        onLastPageRequested = { },
        onPreviousPageRequested = { },
        onNextPageRequested = { },
        onUserSelected = { }
    )
}
