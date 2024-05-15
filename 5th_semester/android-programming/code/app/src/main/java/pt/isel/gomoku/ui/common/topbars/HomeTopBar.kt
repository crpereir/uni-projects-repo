package pt.isel.gomoku.ui.common.topbars

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.width
import androidx.compose.material3.CenterAlignedTopAppBar
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.IconButton
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import pt.isel.gomoku.R
import pt.isel.gomoku.ui.common.theme.DARK_BROWN
import pt.isel.gomoku.ui.common.theme.GomokuTheme

/**
 * Tags used to identify the components of the Top Bar of Home Screen in automated tests.
 */
const val TEST_TAG_TOP_BAR_HOME_NAVIGATE_TO_INFO = "TEST_TAG_TOP_BAR_HOME_NAVIGATE_TO_INFO"

/**
 * Composable top bar of home screen.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun HomeTopBar(navigation: NavigationHandlers = NavigationHandlers()) {
    CenterAlignedTopAppBar(
        colors = TopAppBarDefaults.centerAlignedTopAppBarColors(
            containerColor = DARK_BROWN,
            titleContentColor = Color.White
        ),
        title = {
            Image(
                painter = painterResource(id = R.drawable.homelogo),
                contentDescription = null,
                modifier = Modifier.width(25.dp)
            )
        },
        actions = {
            if (navigation.onInfoRequested != null) {
                IconButton(
                    onClick = navigation.onInfoRequested,
                    modifier = Modifier.testTag(TEST_TAG_TOP_BAR_HOME_NAVIGATE_TO_INFO)
                ) {
                    Image(
                        painter = painterResource(id = R.drawable.information),
                        contentDescription = null,
                        modifier = Modifier.width(25.dp))
                }
            }
        }
    )
}

@Preview
@Composable
private fun HomeTopBarPreview() {
    GomokuTheme {
        HomeTopBar(navigation = NavigationHandlers(onInfoRequested = { }))
    }
}
