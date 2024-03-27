package pt.isel.gomoku.ui.ranking

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.testTag
import pt.isel.gomoku.domain.users.Ranking
import pt.isel.gomoku.domain.users.UserStatistics
import pt.isel.gomoku.domain.utils.Page
import pt.isel.gomoku.ui.common.theme.BROWN
import pt.isel.gomoku.ui.common.theme.letter

/**
 * Displays the ranking.
 * @param ranking the [Ranking] to be displayed.
 * @param userSelected the [UserStatistics] to be displayed, if a user is selected.
 * @param page the current [Page] in the ranking to be displayed.
 * @param onFirstPageRequested the callback to be invoked when the user requests the first page of the ranking.
 * @param onLastPageRequested the callback to be invoked when the user requests the last page of the ranking.
 * @param onPreviousPageRequested the callback to be invoked when the user requests the previous page of the ranking.
 * @param onNextPageRequested the callback to be invoked when the user requests the next page of the ranking.
 * @param onUserSelected the callback to be invoked when the user requests statistics from a ranking user.
 */
@Composable
fun RankingView(
    ranking: List<UserStatistics>,
    userSelected: UserStatistics?,
    page: Page,
    onFirstPageRequested: () -> Unit,
    onLastPageRequested: () -> Unit,
    onPreviousPageRequested: () -> Unit,
    onNextPageRequested: () -> Unit,
    onUserSelected: (Int?) -> Unit
) {
    LazyColumn {
        this.items(ranking) { user: UserStatistics ->
            RankingEntryView(user) { userId: Int? ->
                onUserSelected(userId)
            }
        }
        item {
            Box(
                modifier = Modifier.fillMaxWidth(),
                contentAlignment = Alignment.Center
            ) {
                Row {
                    Button(
                        modifier = Modifier.testTag(TEST_TAG_FIRST_PAGE_BUTTON),
                        enabled = page.isPossibleGoBack(),
                        onClick = { onFirstPageRequested() },
                        colors = ButtonDefaults.buttonColors(BROWN)
                    ) {
                        Text("<<", fontFamily = letter)
                    }

                    Button(
                        modifier = Modifier.testTag(TEST_TAG_PREVIOUS_PAGE_BUTTON),
                        enabled = page.isPossibleGoBack(),
                        onClick = { onPreviousPageRequested() },
                        colors = ButtonDefaults.buttonColors(BROWN)
                    ) {
                        Text(text = "<", fontFamily = letter)
                    }

                    Button(
                        modifier = Modifier.testTag(TEST_TAG_NEXT_PAGE_BUTTON),
                        enabled = page.isPossibleGoForward(),
                        onClick = { onNextPageRequested() },
                        colors = ButtonDefaults.buttonColors(BROWN)
                    ) {
                        Text(text = ">", fontFamily = letter)
                    }

                    Button(
                        modifier = Modifier.testTag(TEST_TAG_LAST_PAGE_BUTTON),
                        enabled = page.isPossibleGoForward(),
                        onClick = { onLastPageRequested() },
                        colors = ButtonDefaults.buttonColors(BROWN)
                    ) {
                        Text(text = ">>", fontFamily = letter)
                    }
                }
            }

            userSelected?.let {
                UserStatisticsView(
                    user = userSelected,
                    onDeselectUser = { onUserSelected(null) }
                )

            }
        }
    }
}
