package pt.isel.gomoku.ui.game

import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.performClick
import junit.framework.TestCase.assertEquals
import junit.framework.TestCase.assertTrue
import org.junit.Rule
import org.junit.Test
import pt.isel.gomoku.domain.games.Board
import pt.isel.gomoku.domain.games.Game
import pt.isel.gomoku.domain.games.Intersection
import pt.isel.gomoku.domain.games.Piece
import pt.isel.gomoku.domain.games.Player

class GameScreenTests {

    @get:Rule
    val composeTestRule = createComposeRule()

    private val LOCAL_BOARD_DIM = 15

    @Test
    fun `initial load with no board - should be waiting`() {

        // Arrange
        composeTestRule.setContent {
            WaitingForPlayerScreen { }
        }

        composeTestRule.onNodeWithTag(TEST_TAG_WAITING_SCREEN).assertExists()
        composeTestRule.onNodeWithTag(TEST_TAG_CANCEL_WAIT).assertExists()
    }

    @Test
    fun `while waiting clicking give up will call callback`() {

        var givenUp = false

        // Arrange
        composeTestRule.setContent {
            WaitingForPlayerScreen { givenUp = true }
        }

        composeTestRule.onNodeWithTag(TEST_TAG_WAITING_SCREEN).assertExists()
        composeTestRule.onNodeWithTag(TEST_TAG_CANCEL_WAIT).assertExists()
        composeTestRule.onNodeWithTag(TEST_TAG_CANCEL_WAIT).performClick()

        assertTrue(givenUp)
    }

    @Test
    fun `initial load with board - there should be no pieces on board`() {

        // Arrange
        composeTestRule.setContent {
            GameScreen(
                Game.standard,
                LOCAL_BOARD_DIM,
                true,
                false,
                {},
                { _, _ -> },
                {}
            )
        }

        composeTestRule.onNodeWithTag(TEST_TAG_BOARD_SCREEN).assertExists()

        repeat(LOCAL_BOARD_DIM) { idxRow ->
            repeat(LOCAL_BOARD_DIM) { idxCol ->

                // For each possible play:
                // Arrange
                val interceptionTag = createInterceptionTagWithPositionAndPlayer(idxRow, idxCol)
                val blackPieceTag =
                    createInterceptionTagWithPositionAndPlayer(idxRow, idxCol, Player.B)
                val whitePieceTag =
                    createInterceptionTagWithPositionAndPlayer(idxRow, idxCol, Player.W)

                // Assert
                composeTestRule.onNodeWithTag(interceptionTag).assertExists()
                composeTestRule.onNodeWithTag(blackPieceTag).assertDoesNotExist()
                composeTestRule.onNodeWithTag(whitePieceTag).assertDoesNotExist()
            }
        }

        // Assert
        composeTestRule.onNodeWithTag(TEST_TAG_GIVE_UP).assertExists()
        composeTestRule.onNodeWithTag(TEST_TAG_WIN_SCREEN).assertDoesNotExist()
        composeTestRule.onNodeWithTag(TEST_TAG_DRAW_SCREEN).assertDoesNotExist()
    }

    @Test
    fun `board with pieces - should see pieces in respective positions`() {

        // Arrange
        composeTestRule.setContent {
            GameScreen(
                Game.standard.copy(
                    board = Board(
                        listOf(
                            Piece(Player.B, Intersection(2, 2)),
                            Piece(Player.W, Intersection(3, 3))
                        )
                    )
                ),
                LOCAL_BOARD_DIM,
                true,
                false,
                {},
                { _, _ -> },
                {}
            )
        }

        composeTestRule.onNodeWithTag(TEST_TAG_BOARD_SCREEN).assertExists()
        val blackPieceTag =
            createInterceptionTagWithPositionAndPlayer(2, 2, Player.B)
        val whitePieceTag =
            createInterceptionTagWithPositionAndPlayer(3, 3, Player.W)

        composeTestRule.onNodeWithTag(blackPieceTag).assertExists()
        composeTestRule.onNodeWithTag(whitePieceTag).assertExists()

    }

    @Test
    fun `in board giving up button should call callback`() {

        var givenUp = false

        // Arrange
        composeTestRule.setContent {
            GameScreen(
                Game.standard,
                LOCAL_BOARD_DIM,
                true,
                false,
                {},
                { _, _ -> },
                {givenUp = true}
            )
        }

        composeTestRule.onNodeWithTag(TEST_TAG_GIVE_UP).assertExists()
        composeTestRule.onNodeWithTag(TEST_TAG_GIVE_UP).performClick()

        assertTrue(givenUp)

    }

    @Test
    fun `in board making a play should call callback`() {

        val rowDesired = 3
        val columnDesired = 3
        var played = false

        val intersection = createInterceptionTagWithPositionAndPlayer(3, 3)

        // Arrange
        composeTestRule.setContent {
            GameScreen(
                Game.standard,
                LOCAL_BOARD_DIM,
                true,
                false,
                {},
                { row, column ->
                    run {
                        played = true
                        assertEquals(rowDesired, row)
                        assertEquals(columnDesired, column)
                    }
                },
                {}
            )
        }

        composeTestRule.onNodeWithTag(intersection).assertExists()
        composeTestRule.onNodeWithTag(intersection).performClick()

        assertTrue(played)
    }
}

