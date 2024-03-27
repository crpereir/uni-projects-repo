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
 * Tags used to identify the components of the Top Bar of Auth Screen in automated tests.
 */
const val TEST_TAG_TOP_BAR_AUTH_NAVIGATE_BACK = "TEST_TAG_TOP_BAR_AUTH_NAVIGATE_BACK"
const val TEST_TAG_TOP_BAR_AUTH_NAVIGATE_SIGNUP = "TEST_TAG_TOP_BAR_AUTH_NAVIGATE_SIGNUP"

/**
 * Composable top bar of auth screen.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AuthTopBar(navigation: NavigationHandlers = NavigationHandlers()) {
    CenterAlignedTopAppBar(
        colors = TopAppBarDefaults.centerAlignedTopAppBarColors(
            containerColor = DARK_BROWN,
            titleContentColor = Color.White
        ),
        title = {
            Image(
                painter = painterResource(id = R.drawable.credentials),
                contentDescription = null,
                modifier = Modifier.width(25.dp)
            )
        },
        navigationIcon = {
            if (navigation.onBackRequested != null) {
                IconButton(
                    onClick = navigation.onBackRequested,
                    modifier = Modifier.testTag(TEST_TAG_TOP_BAR_AUTH_NAVIGATE_BACK)
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
            if (navigation.onSignUpRequested != null) {
                IconButton(
                    onClick = navigation.onSignUpRequested,
                    modifier = Modifier.testTag(TEST_TAG_TOP_BAR_AUTH_NAVIGATE_SIGNUP)
                ) {
                    Image(
                        painter = painterResource(id = R.drawable.add_user),
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
private fun TopBarLoginPreview() {
    GomokuTheme {
        AuthTopBar(navigation = NavigationHandlers(onBackRequested = { }, onSignUpRequested = { }))
    }
}

@Preview
@Composable
private fun TopBarSignUpPreview() {
    GomokuTheme {
        AuthTopBar(navigation = NavigationHandlers(onBackRequested = { }))
    }
}

@Preview
@Composable
private fun TopBarLoadingPreview() {
    GomokuTheme {
        AuthTopBar()
    }
}
