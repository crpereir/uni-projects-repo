package pt.isel.gomoku.ui.home

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import pt.isel.gomoku.R
import pt.isel.gomoku.ui.common.theme.GomokuTheme
import pt.isel.gomoku.ui.common.theme.LIGHT_BROWN
import pt.isel.gomoku.ui.common.theme.homeFamily
import pt.isel.gomoku.ui.common.topbars.HomeTopBar
import pt.isel.gomoku.ui.common.topbars.NavigationHandlers
import pt.isel.gomoku.ui.common.utils.CustomButtonCard

/**
 * Tags used to identify the components of the HomeScreen in automated tests.
 */
const val TEST_TAG_HOME_SCREEN = "TEST_TAG_HOME_SCREEN"
const val TEST_TAG_PLAY_GAME_BUTTON = "TEST_TAG_PLAY_GAME_BUTTON"
const val TEST_TAG_RANKING_BUTTON = "TEST_TAG_RANKING_BUTTON"

/**
 * Root composable for the home screen.
 * @param onInfoRequested the callback to be invoked when the user requests application authors.
 * @param onPlayGameRequested the callback to be invoked when the user requests to play a game.
 * @param onRankingRequested the callback to be invoked when the user requests the users current ranking.
 * @param onPlayGameEnabled indicates if the onPlayGameRequested callback can be called.
 * @param onRankingEnabled indicates if the onRankingRequested callback can be called.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun HomeScreen(
    onInfoRequested: () -> Unit,
    onPlayGameRequested: () -> Unit,
    onRankingRequested: () -> Unit,
    onPlayGameEnabled: Boolean,
    onRankingEnabled: Boolean,
) {
    GomokuTheme {
        Scaffold(
            modifier = Modifier
                .testTag(TEST_TAG_HOME_SCREEN)
                .fillMaxSize(),
            topBar = {
                HomeTopBar(
                    navigation = NavigationHandlers(
                        onInfoRequested = onInfoRequested
                    )
                )
            },
            containerColor = LIGHT_BROWN
        ) { innerPadding ->
            LazyColumn(
                modifier = Modifier
                    .padding(innerPadding)
                    .fillMaxSize(),
                verticalArrangement = Arrangement.Center,
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                item {
                    Text(
                        text = stringResource(id = R.string.app_name),
                        fontSize = 24.sp,
                        fontFamily = homeFamily
                    )
                    Spacer(modifier = Modifier.height(60.dp))

                    Image(
                        painter = painterResource(id = R.drawable.home),
                        contentDescription = null,
                        modifier = Modifier
                            .fillMaxWidth(0.45f)
                    )

                    Spacer(modifier = Modifier.height(60.dp))

                    CustomButtonCard(
                        testTag = TEST_TAG_PLAY_GAME_BUTTON,
                        stringResourceId = R.string.play_game,
                        imageFraction = 0.5f,
                        onClick = onPlayGameRequested,
                        enabled = onPlayGameEnabled
                    )

                    CustomButtonCard(
                        testTag = TEST_TAG_RANKING_BUTTON,
                        stringResourceId = R.string.ranking,
                        imageFraction = 0.5f,
                        onClick = onRankingRequested,
                        enabled = onRankingEnabled
                    )
                }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun HomeScreenPreview() {
    HomeScreen({}, {}, {}, onPlayGameEnabled = true, onRankingEnabled = true)
}
