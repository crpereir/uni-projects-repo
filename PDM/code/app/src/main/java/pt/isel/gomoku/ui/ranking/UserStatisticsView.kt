package pt.isel.gomoku.ui.ranking

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.sp
import pt.isel.gomoku.R
import pt.isel.gomoku.domain.users.UserStatistics
import pt.isel.gomoku.ui.common.theme.DARK_BROWN
import pt.isel.gomoku.ui.common.theme.letter

/**
 * Displays user statistics.
 * @param user the [UserStatistics] to be displayed.
 * @param onDeselectUser the callback to be invoked when the user requests to close statistics.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun UserStatisticsView(
    user: UserStatistics,
    onDeselectUser: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDeselectUser,
        title = {
            Row {
                Text(
                    text = stringResource(id = R.string.user_details),
                    fontFamily = letter,
                    fontSize = 30.sp,
                    color = Color.White
                )

                Image(
                    painter = painterResource(id = R.drawable.star),
                    contentDescription = null,
                    modifier = Modifier.fillMaxWidth(0.8f)
                )
            }
        },
        text = {
            Column {
                Text(
                    text = "${stringResource(R.string.usernameStatistics)} ${user.username}",
                    color = Color.White,
                    fontSize = 25.sp,
                    fontFamily = letter
                )
                Text(
                    text = "${stringResource(R.string.gamesPlayed)} ${user.gamesPlayed}",
                    color = Color.White,
                    fontSize = 25.sp,
                    fontFamily = letter
                )
                Text(
                    text = "${stringResource(R.string.gamesWon)} ${user.gamesWon}",
                    color = Color.White,
                    fontSize = 25.sp,
                    fontFamily = letter
                )
                Text(
                    text = "${stringResource(R.string.gamesLost)} ${user.gamesLost}",
                    color = Color.White,
                    fontSize = 25.sp,
                    fontFamily = letter
                )
                Text(
                    text = "${stringResource(R.string.gamesTied)} ${user.gamesTied}",
                    color = Color.White,
                    fontSize = 25.sp,
                    fontFamily = letter
                )
            }
        },
        confirmButton = {
            Card(
                onClick = onDeselectUser,
                colors = CardDefaults.cardColors(Color.Transparent),
                modifier = Modifier.testTag(TEST_TAG_DESELECT_USER_BUTTON)
            ) {
                Box {
                    Image(
                        painter = painterResource(id = R.drawable.button),
                        contentDescription = null,
                        modifier = Modifier.fillMaxWidth(0.30f)
                    )
                    Text(
                        text = stringResource(id = R.string.close),
                        fontFamily = letter,
                        fontSize = 20.sp,
                        color = Color.Black,
                        modifier = Modifier.align(Alignment.TopCenter)
                    )
                }
            }
        },
        containerColor = DARK_BROWN,
        modifier = Modifier
            .background(Color.Transparent)
            .testTag(TEST_TAG_RANKING_SCREEN_USER_DETAILS)
    )
}

@Preview
@Composable
fun UserStatisticsViewPreview() {
    UserStatisticsView(
        user = UserStatistics(1, "user1", 1, 0, 0, 0, 0),
        onDeselectUser = { }
    )
}