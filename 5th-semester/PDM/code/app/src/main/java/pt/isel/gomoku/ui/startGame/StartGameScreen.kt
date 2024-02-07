package pt.isel.gomoku.ui.startGame

import android.annotation.SuppressLint
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
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
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import pt.isel.gomoku.R
import pt.isel.gomoku.domain.variants.OpeningRules
import pt.isel.gomoku.domain.variants.PlayingRules
import pt.isel.gomoku.domain.variants.Variant
import pt.isel.gomoku.ui.common.topbars.NavigationHandlers
import pt.isel.gomoku.ui.common.theme.BACKGROUND
import pt.isel.gomoku.ui.common.theme.GomokuTheme
import pt.isel.gomoku.ui.common.theme.letter
import pt.isel.gomoku.ui.common.topbars.StartGameTopBar
import pt.isel.gomoku.ui.common.utils.CustomButtonCard
import pt.isel.gomoku.ui.common.utils.CustomProgressIndicator

/**
 * Tags used to identify the components of the RankingScreen in automated tests.
 */
const val TEST_TAG_START_LOADING_SCREEN = "TEST_TAG_START_LOADING_SCREEN"
const val TEST_TAG_START_LOADED_SCREEN = "TEST_TAG_START_LOADED_SCREEN"
const val TEST_TAG_START_GAME_BUTTON = "TEST_TAG_START_GAME_BUTTON"
const val TEST_TAG_START_NEXT_VARIANT_BUTTON = "TEST_TAG_START_NEXT_VARIANT_BUTTON"

/**
 * Root composable for the start game screen when is loading user info and variants.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun StartGameScreenLoadingView() {
    GomokuTheme {
        Scaffold(
            modifier = Modifier
                .fillMaxSize()
                .testTag(TEST_TAG_START_LOADING_SCREEN),
            topBar = {
                StartGameTopBar(navigation = NavigationHandlers())
            },
            containerColor = BACKGROUND
        ) { innerPadding ->
            Column(
                verticalArrangement = Arrangement.Center,
                horizontalAlignment = Alignment.CenterHorizontally,
                modifier = Modifier
                    .fillMaxSize()
                    .padding(innerPadding),
            ) {
                CustomProgressIndicator()
            }
        }
    }
}

/**
 * Root composable for the start game screen, the one that displays information about user, variants
 *  and allows start a game.
 * @param variantChosen the [Variant] chosen to start a game.
 * @param onBackRequested the callback to be invoked when the user requests to go back to the
 * previous screen.
 * @param onLogOutRequested the callback to be invoked when the user requests to logout.
 * @param onNextVariant the callback to be invoked when the user requests the next variant.
 * @param onStartGameRequested the callback to be invoked when the user requests to stat a game.
 */
@SuppressLint("UnusedMaterial3ScaffoldPaddingParameter")
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun StartGameScreenLoadedView(
    username: String,
    variantChosen: Variant?,
    onBackRequested: () -> Unit,
    onLogOutRequested: () -> Unit,
    onNextVariant: () -> Unit,
    onStartGameRequested: () -> Unit
) {
    GomokuTheme {
        Scaffold(
            modifier = Modifier
                .fillMaxSize()
                .testTag(TEST_TAG_START_LOADED_SCREEN),
            topBar = {
                StartGameTopBar(
                    navigation = NavigationHandlers(
                        onBackRequested = onBackRequested,
                        onLogOutRequested = onLogOutRequested
                    )
                )
            },
            containerColor = BACKGROUND
        ) { innerPadding ->
            Column(
                verticalArrangement = Arrangement.Center,
                horizontalAlignment = Alignment.CenterHorizontally,
                modifier = Modifier
                    .fillMaxSize()
                    .padding(innerPadding),
            ) {
                LoadedStateView(
                    username = username,
                    variantChosen = variantChosen,
                    onVariantChosen = onNextVariant,
                    onStartGameRequested = onStartGameRequested
                )

            }
        }
    }
}

@Composable
private fun LoadedStateView(
    username: String,
    variantChosen: Variant?,
    onVariantChosen: () -> Unit,
    onStartGameRequested: () -> Unit
) {
    LazyColumn(
        verticalArrangement = Arrangement.Top,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        item {
            Text(
                text = "${stringResource(id = R.string.welcome_start_game)} $username",
                style = TextStyle(
                    fontSize = 40.sp,
                    fontWeight = FontWeight.Bold,
                    fontFamily = letter
                ),
                modifier = Modifier.padding(16.dp)
            )

            Spacer(modifier = Modifier.height(40.dp))

            Text(
                text = stringResource(id = R.string.choose_variant),
                style = TextStyle(
                    fontSize = 30.sp,
                    fontFamily = letter
                ),
                modifier = Modifier.padding(16.dp)
            )

            VariantView(
                variant = variantChosen,
                onNextVariant = onVariantChosen
            )

            Spacer(modifier = Modifier.height(40.dp))

            Box(
                modifier = Modifier.fillMaxWidth(),
                contentAlignment = Alignment.Center
            ) {
                Row {
                    CustomButtonCard(
                        testTag = TEST_TAG_START_GAME_BUTTON,
                        stringResourceId = R.string.start_game,
                        imageFraction = 0.30f,
                        onClick = onStartGameRequested
                    )
                }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun StartGameScreenLoadingPreview() {
    StartGameScreenLoadingView()
}

@Preview(showBackground = true)
@Composable
fun StartGameScreenLoadedPreview() {
    StartGameScreenLoadedView(
        username = "user1",
        variantChosen = Variant(1, 15, OpeningRules.NONE, PlayingRules.FREESTYLE),
        onBackRequested = { },
        onLogOutRequested = { },
        onNextVariant = { },
        onStartGameRequested = { }
    )
}
