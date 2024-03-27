package pt.isel.gomoku.ui.game

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.width
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import pt.isel.gomoku.R
import pt.isel.gomoku.domain.games.Board
import pt.isel.gomoku.domain.games.Player
import pt.isel.gomoku.ui.common.theme.LIGHT_BROWN

/**
 * Tag used to identify the components of the BoardView in automated tests.
 */
const val TEST_TAG_INTERSECTION = "TEST_TAG_INTERSECTION"

/**
 * Displays the game board.
 */
@Composable
fun BoardView(
    board: Board = Board(listOf()),
    boardDim: Int,
    myTurn: Boolean,
    onIntersectionClick: (Int, Int) -> Unit
) {
    repeat(boardDim + 2) { idxRow ->
        Row {
            repeat(boardDim + 2) { idxCol ->
                Column(
                    modifier = Modifier
                        .height(CELL_SIZE.dp)
                        .width(CELL_SIZE.dp)
                        .background(color = LIGHT_BROWN)

                ) {
                    when (decideImage(idxRow, idxCol, boardDim)) {
                        ImageType.TOP_LEFT_CORNER -> BoardCorner(rotation = 0F)
                        ImageType.TOP_RIGHT_CORNER -> BoardCorner(rotation = 90F)
                        ImageType.BOTTOM_RIGHT_CORNER -> BoardCorner(rotation = 180F)
                        ImageType.BOTTOM_LEFT_CORNER -> BoardCorner(rotation = 270F)

                        ImageType.UP_WALL -> BoardWall(rotation = 0F)
                        ImageType.RIGHT_WALL -> BoardWall(rotation = 90F)
                        ImageType.DOWN_WALL -> BoardWall(rotation = 180F)
                        ImageType.LEFT_WALL -> BoardWall(rotation = 270F)

                        ImageType.INTERSECTION -> Intersection(
                            idxRow - 1,
                            idxCol - 1,
                            board[idxRow - 1, idxCol - 1],
                            myTurn
                        ) {
                            onIntersectionClick(idxRow - 1, idxCol - 1)
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun Intersection(idxRow: Int, idxCol: Int, player: Player?, myTurn: Boolean, onClick: () -> Unit) {
    Box {
        val mod = if (myTurn) Modifier.clickable { onClick() } else Modifier
        Image(
            painter = painterResource(R.drawable.intersection),
            contentDescription = null,
            modifier = mod.testTag(createInterceptionTagWithPositionAndPlayer(idxRow, idxCol))
        )
        if (player != null) {
            val imageId = when (player) {
                Player.B -> R.drawable.black_piece
                Player.W -> R.drawable.white_piece
                Player.UNKNOWN -> throw IllegalStateException("There's no way you're not B or W.")
            }
            Image(
                painter = painterResource(imageId),
                contentDescription = null,
                modifier = Modifier.testTag(
                    createInterceptionTagWithPositionAndPlayer(idxRow, idxCol, player)
                )
            )
        }
    }
}

@Composable
fun BoardWall(rotation: Float) {
    Image(
        painter = painterResource(id = R.drawable.wall),
        contentDescription = null,
        modifier = Modifier.graphicsLayer { rotationZ = rotation }
    )
}

@Composable
fun BoardCorner(rotation: Float) {
    Image(
        painter = painterResource(id = R.drawable.corner),
        contentDescription = null,
        modifier = Modifier.graphicsLayer { rotationZ = rotation }
    )
}

enum class ImageType {
    TOP_LEFT_CORNER, TOP_RIGHT_CORNER, BOTTOM_LEFT_CORNER, BOTTOM_RIGHT_CORNER,
    UP_WALL, DOWN_WALL, LEFT_WALL, RIGHT_WALL,
    INTERSECTION
}

private fun decideImage(idxRow: Int, idxCol: Int, boardDim: Int): ImageType {
    return when {
        idxRow == 0 && idxCol == 0 -> ImageType.TOP_LEFT_CORNER
        idxRow == 0 && idxCol == boardDim + 1 -> ImageType.TOP_RIGHT_CORNER
        idxRow == boardDim + 1 && idxCol == 0 -> ImageType.BOTTOM_LEFT_CORNER
        idxRow == boardDim + 1 && idxCol == boardDim + 1 -> ImageType.BOTTOM_RIGHT_CORNER
        idxRow == 0 -> ImageType.UP_WALL
        idxRow == boardDim + 1 -> ImageType.DOWN_WALL
        idxCol == 0 -> ImageType.LEFT_WALL
        idxCol == boardDim + 1 -> ImageType.RIGHT_WALL
        else -> ImageType.INTERSECTION
    }
}

fun createInterceptionTagWithPositionAndPlayer(
    row: Int,
    col: Int,
    player: Player? = null
): String {
    return if (player == null)
        "${TEST_TAG_INTERSECTION}_${row}_$col"
    else
        "${TEST_TAG_INTERSECTION}_${row}_${col}_$player"

}

@Preview(showBackground = true)
@Composable
fun BoardViewPreview() {
    Column(
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally,
        modifier = Modifier.fillMaxSize()
    ) {
        BoardView(boardDim = 15, myTurn = false) { _, _ -> }
    }
}