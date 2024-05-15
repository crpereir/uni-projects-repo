package pt.isel.gomoku.ui.ranking

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.wrapContentSize
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import pt.isel.gomoku.domain.users.UserStatistics
import pt.isel.gomoku.ui.common.theme.BROWN
import pt.isel.gomoku.ui.common.theme.letter

/**
 * Tag used to concatenate with a user identifier to be identified in automatic tests.
 */
const val TEST_TAG_RANKING_SELECTED_USER_ = "TEST_TAG_RANKING_SELECTED_USER_"

/**
 * Displays a ranking entry.
 * @param user the [UserStatistics] to be displayed.
 * @param onUserSelected the callback to be invoked when the user requests statistics of that user.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun RankingEntryView(
    user: UserStatistics,
    onUserSelected: (Int?) -> Unit
) {
    Spacer(modifier = Modifier.height(10.dp))
    Card(
        onClick = { onUserSelected(user.userId) },
        shape = RoundedCornerShape(16.dp),
        modifier = Modifier
            .padding(start = 16.dp)
            .padding(end = 16.dp)
            .testTag(TEST_TAG_RANKING_SELECTED_USER_ + user.userId),
        colors = CardDefaults.cardColors(BROWN)
    ) {
        Row(
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.Center,
        ) {
            Text(
                text = "${user.rankingPosition}º",
                style = MaterialTheme.typography.titleLarge,
                modifier = Modifier
                    .padding(vertical = 10.dp)
                    .padding(start = 16.dp)
                    .wrapContentSize(),
                fontFamily = letter,
                fontWeight = FontWeight.Bold
            )
            Text(
                text = user.username,
                style = MaterialTheme.typography.bodyMedium,
                textAlign = TextAlign.Start,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 8.dp)
                    .padding(start = 16.dp),
                fontFamily = letter,
                fontSize = 25.sp
            )
        }
    }
}

@Preview
@Composable
fun RankingEntryViewPreview() {
    RankingEntryView(
        user = UserStatistics(1, "user1", 1, 0, 0, 0, 0),
        onUserSelected = { _ -> }
    )
}