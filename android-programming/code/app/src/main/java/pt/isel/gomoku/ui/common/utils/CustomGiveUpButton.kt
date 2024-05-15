package pt.isel.gomoku.ui.common.utils

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ExitToApp
import androidx.compose.material3.FloatingActionButton
import androidx.compose.material3.Icon
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.res.stringResource
import pt.isel.gomoku.R
import pt.isel.gomoku.ui.game.TEST_TAG_GIVE_UP
import pt.isel.gomoku.ui.common.theme.DARK_BROWN
import pt.isel.gomoku.ui.common.theme.LIGHT_BROWN

@Composable
fun CustomGiveUpButton(onGiveUpRequested: () -> Unit) {
    FloatingActionButton(
        onClick = { onGiveUpRequested() },
        containerColor = DARK_BROWN,
        contentColor = LIGHT_BROWN,
        modifier = Modifier.testTag(TEST_TAG_GIVE_UP)
    ) {
        Icon(Icons.Default.ExitToApp, contentDescription = stringResource(id = R.string.give_up))
    }
}