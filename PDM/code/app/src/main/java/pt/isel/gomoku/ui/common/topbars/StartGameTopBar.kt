package pt.isel.gomoku.ui.common.topbars

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.width
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.CenterAlignedTopAppBar
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import pt.isel.gomoku.R
import pt.isel.gomoku.ui.common.theme.DARK_BROWN
import pt.isel.gomoku.ui.common.theme.GomokuTheme

/**
 * Tags used to identify the components of the Top Bar of Start Game Screen in automated tests.
 */
const val TEST_TAG_TOP_BAR_START_GAME_NAVIGATE_BACK = "TEST_TAG_TOP_BAR_START_GAME_NAVIGATE_BACK"
const val TEST_TAG_TOP_BAR_START_GAME_LOGOUT = "TEST_TAG_TOP_BAR_START_SCREEN_LOGOUT"

/**
 * Composable top bar of start game screen.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun StartGameTopBar(navigation: NavigationHandlers = NavigationHandlers()) {
    CenterAlignedTopAppBar(
        colors = TopAppBarDefaults.centerAlignedTopAppBarColors(
            containerColor = DARK_BROWN,
            titleContentColor = Color.White
        ),
        title = {
            Image(
                painter = painterResource(id = R.drawable.start),
                contentDescription = null,
                modifier = Modifier.width(45.dp)
            )
        },
        navigationIcon = {
            if (navigation.onBackRequested != null) {
                IconButton(
                    onClick = navigation.onBackRequested,
                    modifier = Modifier.testTag(TEST_TAG_TOP_BAR_START_GAME_NAVIGATE_BACK)
                ) {
                    Icon(
                        imageVector = Icons.Default.ArrowBack,
                        contentDescription = stringResource(id = R.string.top_bar_go_back),
                        tint = Color.White
                    )
                }
            }
        },
        actions = {
            if (navigation.onLogOutRequested != null) {
                IconButton(
                    onClick = navigation.onLogOutRequested,
                    modifier = Modifier.testTag(TEST_TAG_TOP_BAR_START_GAME_LOGOUT)
                ) {
                    Image(
                        painter = painterResource(id = R.drawable.logout),
                        contentDescription = null,
                        modifier = Modifier.width(25.dp)
                    )
                }
            }
        }
    )
}

@Preview
@Composable
private fun StartGameTopBarInitialAndLoadingPreview() {
    GomokuTheme {
        StartGameTopBar()
    }
}

@Preview
@Composable
private fun StartGameTopBarLoadedPreview() {
    GomokuTheme {
        StartGameTopBar(
            navigation = NavigationHandlers(
                onBackRequested = { },
                onLogOutRequested = { }
            )
        )
    }
}