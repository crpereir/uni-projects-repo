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
 * Tags used to identify the components of the Top Bar of About Screen in automated tests.
 */
const val TEST_TAG_TOP_BAR_ABOUT_NAVIGATE_BACK = "TEST_TAG_TOP_BAR_ABOUT_NAVIGATE_BACK"

/**
 * Composable top bar of about screen.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AboutTopBar(navigation: NavigationHandlers = NavigationHandlers()) {
    CenterAlignedTopAppBar(
        colors = TopAppBarDefaults.centerAlignedTopAppBarColors(
            containerColor = DARK_BROWN,
            titleContentColor = Color.White
        ),
        title = {
            Image(
                painter = painterResource(id = R.drawable.information),
                contentDescription = null,
                modifier = Modifier.width(25.dp)
            )
        },
        navigationIcon = {
            if (navigation.onBackRequested != null) {
                IconButton(
                    onClick = navigation.onBackRequested,
                    modifier = Modifier.testTag(TEST_TAG_TOP_BAR_ABOUT_NAVIGATE_BACK)
                ) {
                    Icon(
                        imageVector = Icons.Default.ArrowBack,
                        contentDescription = stringResource(id = R.string.top_bar_go_back),
                        tint = Color.White
                    )
                }
            }
        }
    )
}

@Preview
@Composable
private fun AboutTopBarPreview() {
    GomokuTheme {
        AboutTopBar(navigation = NavigationHandlers(onBackRequested = { }))
    }
}
