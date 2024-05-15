package pt.isel.gomoku.ui.authentication

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.testTag
import pt.isel.gomoku.ui.common.theme.BACKGROUND
import pt.isel.gomoku.ui.common.theme.GomokuTheme
import pt.isel.gomoku.ui.common.topbars.AuthTopBar
import pt.isel.gomoku.ui.common.utils.CustomProgressIndicator

/**
 * Tag used to identify the components of the AuthScreen in automated tests.
 */
const val TEST_TAG_AUTH_LOADING_SCREEN = "TEST_TAG_AUTH_LOADING_SCREEN"

/**
 * Root composable for the auth screen when is loading.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AuthScreenLoadingView() {
    GomokuTheme {
        Scaffold(
            modifier = Modifier
                .testTag(TEST_TAG_AUTH_LOADING_SCREEN)
                .fillMaxSize(),
            containerColor = BACKGROUND,
            topBar = {
                AuthTopBar()
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