package pt.isel.gomoku.ui.game

import android.annotation.SuppressLint
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.Search
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.drawBehind
import androidx.compose.ui.geometry.CornerRadius
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import pt.isel.gomoku.R
import pt.isel.gomoku.domain.games.Game
import pt.isel.gomoku.ui.common.theme.BACKGROUND
import pt.isel.gomoku.ui.common.theme.DARK_BROWN
import pt.isel.gomoku.ui.common.theme.GomokuTheme
import pt.isel.gomoku.ui.common.theme.NOT_WIN_GRADIENT_BRUSH
import pt.isel.gomoku.ui.common.theme.WINNING_GRADIENT_BRUSH
import pt.isel.gomoku.ui.common.theme.homeFamily
import pt.isel.gomoku.ui.common.theme.kumbhSansFamily
import pt.isel.gomoku.ui.common.theme.letter
import pt.isel.gomoku.ui.common.topbars.GomokuTopBar
import pt.isel.gomoku.ui.common.utils.CustomButtonCard
import pt.isel.gomoku.ui.common.utils.CustomGiveUpButton
import pt.isel.gomoku.ui.common.utils.CustomProgressIndicator

/**
 * Tags used to identify the components of the LogInScreen in automated tests.
 */
const val TEST_TAG_LOADING_SCREEN = "TEST_TAG_LOADING_SCREEN"
const val TEST_TAG_WAITING_SCREEN = "TEST_TAG_WAITING_SCREEN"
const val TEST_TAG_CANCEL_WAIT = "TEST_TAG_CANCEL_WAIT"

const val TEST_TAG_BOARD_SCREEN = "TEST_TAG_BOARD_SCREEN"
const val TEST_TAG_GIVE_UP = "TEST_TAG_GIVE_UP"
const val TEST_TAG_WIN_SCREEN = "TEST_TAG_WIN_SCREEN"
const val TEST_TAG_DRAW_SCREEN = "TEST_TAG_DRAW_SCREEN"

const val CELL_SIZE = 20

/**
 * Root composable for the game screen when is loading.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun GameScreenLoading() {
    GomokuTheme {
        Scaffold(
            modifier = Modifier
                .testTag(TEST_TAG_LOADING_SCREEN)
                .fillMaxSize(),
            containerColor = BACKGROUND,
            topBar = { GomokuTopBar() }
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

/**
 * Root composable for the game screen when is waiting for other player to join.
 * @param onStopWaitingRequested the callback to be invoked when the user requests a to stop waiting.
 */
@SuppressLint("UnusedMaterial3ScaffoldPaddingParameter")
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun WaitingForPlayerScreen(
    onStopWaitingRequested: () -> Unit
) {
    GomokuTheme {
        Scaffold(
            topBar = { GomokuTopBar() },
            containerColor = BACKGROUND,
            modifier = Modifier.testTag(TEST_TAG_WAITING_SCREEN)
        ) {
            AlertDialog(
                onDismissRequest = { },
                confirmButton = {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth(0.5f)
                            .fillMaxHeight(0.5f)
                    ) {
                        CustomButtonCard(
                            testTag = TEST_TAG_CANCEL_WAIT,
                            stringResourceId = R.string.cancel,
                            imageFraction = 1f,
                            onClick = onStopWaitingRequested
                        )
                    }
                },
                title = {
                    Text(
                        text = stringResource(R.string.waiting_title),
                        color = Color.White,
                        fontFamily = homeFamily,
                        fontSize = 25.sp
                    )
                },
                text = {
                    Column {
                        Text(
                            text = stringResource(R.string.waiting_for_other_player_to_join),
                            color = Color.White,
                            fontFamily = letter,
                            fontSize = 25.sp
                        )
                        Spacer(modifier = Modifier.height(16.dp))
                        CustomProgressIndicator()
                    }
                },
                icon = {
                    Icon(
                        imageVector = Icons.Outlined.Search,
                        contentDescription = "Search",
                        tint = Color.White
                    )
                },
                containerColor = DARK_BROWN,
                modifier = Modifier.fillMaxHeight(0.65f)
            )
        }
    }
}

/**
 * Root composable for the game screen.
 * @param game the current game.
 * @param boardDim the size of the board.
 * @param myTurn indicates if it's my turn to play.
 * @param didIWin indicates if I won the game.
 * @param onBackRequested the callback to be invoked when the user requests to go back to the
 *  previous screen.
 * @param onPlayRequested the callback to be invoked when the user applies a play passing
 *  the row and column where he played.
 * @param onGiveUpRequested the callback to be invoked when the user give up the game.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun GameScreen(
    game: Game,
    boardDim: Int,
    myTurn: Boolean,
    didIWin: Boolean,
    onBackRequested: () -> Unit,
    onPlayRequested: (Int, Int) -> Unit,
    onGiveUpRequested: () -> Unit
) {
    GomokuTheme {
        Scaffold(
            topBar = { GomokuTopBar() },
            floatingActionButton = { if (myTurn) CustomGiveUpButton(onGiveUpRequested) },
            containerColor = BACKGROUND,
            modifier = Modifier.testTag(TEST_TAG_BOARD_SCREEN)
        ) { innerPadding ->
            LazyRow(
                modifier = Modifier
                    .padding(innerPadding)
                    .fillMaxSize(),
                horizontalArrangement = Arrangement.Center,
                verticalAlignment = Alignment.CenterVertically
            ) {
                item {
                    LazyColumn(
                        modifier = Modifier
                            .fillMaxSize()
                            .padding(innerPadding),
                        verticalArrangement = Arrangement.Center,
                        horizontalAlignment = Alignment.CenterHorizontally,
                    ) {
                        item {
                            if (game.state == Game.State.NEXT_TURN_W || game.state == Game.State.NEXT_TURN_B) {
                                if (myTurn)
                                    Text(
                                        text = stringResource(R.string.your_turn),
                                        fontSize = 18.sp,
                                        fontFamily = homeFamily,
                                        color = DARK_BROWN
                                    )
                                else
                                    Text(
                                        text = stringResource(R.string.waiting_for_other_s_turn),
                                        fontSize = 18.sp,
                                        fontFamily = homeFamily,
                                        color = DARK_BROWN
                                    )
                            }

                            Spacer(modifier = Modifier.height(40.dp))

                            BoardView(game.board, boardDim, myTurn) { row, col ->
                                onPlayRequested(row, col)
                            }
                            Column(
                                verticalArrangement = Arrangement.Center,
                                horizontalAlignment = Alignment.CenterHorizontally,
                                modifier = Modifier.fillMaxSize()
                            ) {
                                when (game.state) {
                                    Game.State.WINNER_B, Game.State.WINNER_W ->
                                        if (didIWin)
                                            WinScreen(
                                                onQuit = {
                                                    onBackRequested()
                                                }
                                            )
                                        else
                                            LoseScreen(
                                                onQuit = {
                                                    onBackRequested()
                                                }
                                            )

                                    Game.State.DRAW ->
                                        DrawScreen(
                                            onQuit = {
                                                onBackRequested()
                                            }
                                        )

                                    else -> {}
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun WinScreen(onQuit: () -> Unit = { }) {
    ResultScreen(
        text = stringResource(R.string.you_won),
        bgColor = WINNING_GRADIENT_BRUSH,
        image = R.drawable.trophy,
        testTag = TEST_TAG_WIN_SCREEN,
        onQuit = onQuit
    )
}

@Composable
fun LoseScreen(onQuit: () -> Unit = { }) {
    ResultScreen(
        text = stringResource(R.string.you_lost),
        bgColor = NOT_WIN_GRADIENT_BRUSH,
        image = R.drawable.broken_trophy,
        testTag = TEST_TAG_WIN_SCREEN,
        onQuit = onQuit
    )
}

@Composable
fun DrawScreen(onQuit: () -> Unit = { }) {
    ResultScreen(
        text = stringResource(R.string.game_ended_in_draw),
        bgColor = NOT_WIN_GRADIENT_BRUSH,
        image = R.drawable.broken_trophy,
        testTag = TEST_TAG_DRAW_SCREEN,
        onQuit = onQuit
    )
}

@Composable
fun ResultScreen(
    text: String,
    bgColor: Brush,
    image: Int,
    testTag: String = "",
    onQuit: () -> Unit
) {
    Column(
        verticalArrangement = Arrangement.spacedBy(
            10.dp,
            alignment = Alignment.CenterVertically
        ),
        horizontalAlignment = Alignment.CenterHorizontally,
        modifier = Modifier
            .drawBehind {
                drawRoundRect(
                    brush = bgColor,
                    cornerRadius = CornerRadius(10.dp.toPx())
                )
            }
            .padding(10.dp)
            .heightIn(max = 180.dp)
            .aspectRatio(3F / 2, true)
            .testTag(testTag)
    ) {
        Image(
            painter = painterResource(id = image),
            contentDescription = null,
            modifier = Modifier
                .height(100.dp)
        )
        Text(
            text = text,
            color = Color.White,
            fontFamily = kumbhSansFamily
        )
        Row(
            horizontalArrangement = Arrangement.spacedBy(
                10.dp,
                alignment = Alignment.CenterHorizontally
            ),
            modifier = Modifier
                .fillMaxSize()
        ) {
            Button(
                onClick = onQuit,
                colors = ButtonDefaults.buttonColors(
                    containerColor = Color.White,
                    contentColor = Color.Black
                )
            ) {
                Text(
                    text = stringResource(R.string.back_to_menu),
                    fontSize = 10.sp,
                    fontFamily = kumbhSansFamily
                )
            }
        }
    }
}

@Preview
@Composable
fun WaitingPreview() {
    WaitingForPlayerScreen {}
}

@Preview
@Composable
fun GameScreenYourTurnPreview() {
    GameScreen(Game.standard, 15, myTurn = true, didIWin = false, {}, { _, _ -> }, { })
}

@Preview
@Composable
fun GameScreenNotYourTurnPreview() {
    GameScreen(Game.standard, 15, myTurn = false, didIWin = false, {}, { _, _ -> }, { })
}


@Preview
@Composable
fun WinScreenPreview() {
    WinScreen()
}

@Preview
@Composable
fun LostScreenPreview() {
    LoseScreen()
}

@Preview
@Composable
fun DrawScreenPreview() {
    DrawScreen()
}
