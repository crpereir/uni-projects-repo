package pt.isel.gomoku.ui.common.topbars

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.width
import androidx.compose.material3.CenterAlignedTopAppBar
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import pt.isel.gomoku.R
import pt.isel.gomoku.ui.common.theme.DARK_BROWN
import pt.isel.gomoku.ui.common.theme.GomokuTheme

/**
 * Composable top bar of game screen.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun GomokuTopBar() {
    CenterAlignedTopAppBar(
        colors = TopAppBarDefaults.centerAlignedTopAppBarColors(
            containerColor = DARK_BROWN,
            titleContentColor = Color.White
        ),
        title = {
            Image(
                painter = painterResource(id = R.drawable.gomoku_board),
                contentDescription = null,
                modifier = Modifier.width(25.dp)
            )
        }
    )
}

@Preview
@Composable
private fun TopBarGomokuPreview() {
    GomokuTheme {
        GomokuTopBar()
    }
}
