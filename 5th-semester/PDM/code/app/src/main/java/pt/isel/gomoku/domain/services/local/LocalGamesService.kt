package pt.isel.gomoku.domain.services.local

import kotlinx.coroutines.delay
import pt.isel.gomoku.domain.games.Board
import pt.isel.gomoku.domain.games.Game
import pt.isel.gomoku.domain.games.Game.Companion.CONSECUTIVE_PIECES_TO_WIN
import pt.isel.gomoku.domain.games.Game.Companion.OFFSET_TO_WIN
import pt.isel.gomoku.domain.games.Game.State
import pt.isel.gomoku.domain.games.Intersection
import pt.isel.gomoku.domain.games.Line
import pt.isel.gomoku.domain.games.Monitor
import pt.isel.gomoku.domain.games.Piece
import pt.isel.gomoku.domain.games.Player
import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.services.GamesService
import pt.isel.gomoku.domain.services.exceptions.GameAlreadyEndedException
import pt.isel.gomoku.domain.services.exceptions.InvalidPositionException
import pt.isel.gomoku.domain.services.exceptions.PositionAlreadyOccupiedException
import pt.isel.gomoku.domain.variants.OpeningRules
import pt.isel.gomoku.domain.variants.PlayingRules
import pt.isel.gomoku.domain.variants.Variant
import pt.isel.gomoku.domain.variants.Variants
import java.util.UUID

/**
 * Local implementation of the [GamesService].
 * Mainly used for testing.
 */
class LocalGamesService(
    private val delayMillis: Long = 0,
) : GamesService {

    private val localBoardDim = 15

    private var id: UUID? = UUID.fromString("73cab612-cecd-45ec-b6aa-25f2e6fefa6a")
    private var storedGame: Game? = Game.standard

    override fun getLinkRelations() = null
    override fun getActionNames() = null

    override suspend fun fetchVariants(token: String, link: Link?): Siren<Variants> {
        delay(delayMillis)

        val variants = Variants(
            variants = listOf(
                Variant(1, 15, OpeningRules.NONE, PlayingRules.FREESTYLE),
                Variant(2, 19, OpeningRules.NONE, PlayingRules.FREESTYLE)
            )
        )

        return siren(
            props = variants,
            actions = genStartGameAction()
        )
    }

    override suspend fun startGame(
        token: String,
        variantId: Int,
        action: Action?
    ): Siren<Monitor?> {
        delay(delayMillis)

        storedGame = Game.standard
        id = UUID.fromString("73cab612-cecd-45ec-b6aa-25f2e6fefa6a")

        return genMonitorSiren(requireNotNull(id))
    }

    override suspend fun statusMonitor(token: String, link: Link?): Siren<Monitor?> {
        delay(delayMillis)

        val id = requireNotNull(id)

        return siren(
            props = Monitor(Monitor.Status.OTHER_PLAYER_JOINED, null),
            links = genGameLink(id)
        )
    }

    override suspend fun deleteMonitor(token: String, action: Action?) {
        delay(delayMillis)
    }

    /**
     *
     */
    override suspend fun fetchGame(token: String, link: Link?): Siren<Game> {
        delay(delayMillis)

        val gameId = id
        if (storedGame == null) storedGame = Game.standard

        return genGameSiren(
            requireNotNull(storedGame),
            requireNotNull(gameId)
        )
    }

    override suspend fun play(
        token: String,
        gameId: String,
        row: Int,
        column: Int,
        action: Action?
    ): Siren<Game> {
        delay(delayMillis)
        val game = requireNotNull(storedGame) { "Unexpected error: Play in null game." }
        if (game.state != State.NEXT_TURN_B && game.state != State.NEXT_TURN_W)
            throw GameAlreadyEndedException
        val player = getCurrentPlayer(game.state)
        val newBoard = updateBoard(game.board, row, column, player)
        val newState = when {
            isWin(newBoard, player) -> getWinner(player)
            isDraw(newBoard) -> State.DRAW
            else -> getNextPlayer(player)
        }
        storedGame = game.copy(
            board = newBoard,
            state = newState
        )
        return genGameSiren(
            requireNotNull(storedGame),
            requireNotNull(id)
        )
    }

    override suspend fun giveUp(token: String, action: Action?) {
        val game = requireNotNull(storedGame) { "Unexpected error: Play in null game." }

        val newState = when (game.state) {
            State.NEXT_TURN_B -> State.WINNER_W
            State.NEXT_TURN_W -> State.WINNER_B
            else -> game.state
        }
        storedGame = game.copy(state = newState)
    }

    /**
     * Update the game board with the new piece.
     * @return the updated board.
     */
    private fun updateBoard(board: Board, row: Int, column: Int, player: Player): Board {
        if (!isValidIntersection(row, column)) throw InvalidPositionException

        val newIntersection = Intersection(row, column)
        if (board.pieces.any { piece -> piece.intersection == newIntersection })
            throw PositionAlreadyOccupiedException
        else {
            val newPiece = Piece(player, newIntersection)
            return board.copy(pieces = board.pieces + newPiece)
        }
    }

    /**
     * Try to instance a intersection.
     * @return the intersection instance or null if is not valid.
     */
    private fun newIntersection(row: Int, column: Int): Intersection? {
        return if (isValidIntersection(row, column))
            Intersection(row, column)
        else
            null
    }

    /**
     * Check if intersection is valid.
     */
    private fun isValidIntersection(row: Int, column: Int): Boolean =
        row in 0 until localBoardDim && column in 0 until localBoardDim

    /**
     * Used to see if currentPlayer won the game after play.
     * Winning positions are also dependent on variation's board size.
     */
    private fun isWin(board: Board, player: Player): Boolean {
        // To check win, it only needs to see pieces of currentPlayer-
        val intersectionsOfCurrentPlayer = board.pieces
            .filter { piece -> piece.player == player }
            .map { piece -> piece.intersection }

        /*
         Winning "in line" means winning via 4 ways:
         - In row ( -- )
         - In column ( | )
         - In backslash ( \ )
         - In slash ( / )
         */
        intersectionsOfCurrentPlayer.forEach { intersection ->
            if (
                checkLine(intersectionsOfCurrentPlayer, intersection, Line.ROW) ||
                checkLine(intersectionsOfCurrentPlayer, intersection, Line.COLUMN) ||
                checkLine(intersectionsOfCurrentPlayer, intersection, Line.BACKSLASH) ||
                checkLine(intersectionsOfCurrentPlayer, intersection, Line.SLASH)
            ) {

                return true
            }
        }
        return false
    }

    /**
     * Depending on line type, checks to see if there is CONSECUTIVE_PIECES_TO_WIN pieces in line.
     */
    private fun checkLine(
        intersectionsOfCurrentPlayer: List<Intersection>,
        firstIntersection: Intersection,
        line: Line
    ): Boolean {
        val intersectionsInLine = intersectionsOfCurrentPlayer.filter { intersection ->
            when (line) {
                Line.ROW -> intersection.row == firstIntersection.row
                Line.COLUMN -> intersection.column == firstIntersection.column
                Line.BACKSLASH -> intersection.backslash == firstIntersection.backslash
                Line.SLASH -> intersection.slash == firstIntersection.slash
            }
        }

        if (intersectionsInLine.size >= CONSECUTIVE_PIECES_TO_WIN) {
            val lastIntersection = getLastIntersection(firstIntersection, line)
            if (lastIntersection == null || !intersectionsInLine.contains(lastIntersection)) {
                return false
            }

            val comparisonList = buildComparisonList(firstIntersection, line)
            if (intersectionsInLine.containsAll(comparisonList)) {
                return true
            }
        }
        return false
    }

    /**
     * Obtains intersection that should be present in order for win state to occur.
     * This depends on the type of line requested and the first intersection in the assumed line of 5.
     * @return The last intersection, or null if it goes past the board.
     */
    private fun getLastIntersection(
        firstIntersection: Intersection,
        line: Line
    ): Intersection? {
        val row = firstIntersection.row
        val column = firstIntersection.column
        return when (line) {
            Line.ROW -> newIntersection(row, column + OFFSET_TO_WIN)
            Line.COLUMN -> newIntersection(row + OFFSET_TO_WIN, column)
            Line.BACKSLASH -> newIntersection(row + OFFSET_TO_WIN, column + OFFSET_TO_WIN)
            Line.SLASH -> newIntersection(row + OFFSET_TO_WIN, column - OFFSET_TO_WIN)
        }
    }

    /**
     * Obtains the list of intersections that results in win state. As this is called after [getLastIntersection],
     * it is assumed that 5 in line is possible, now dependent if the middle intersections are also present.
     */
    private fun buildComparisonList(
        firstIntersection: Intersection,
        line: Line
    ): List<Intersection> {
        val row = firstIntersection.row
        val column = firstIntersection.column
        return when (line) {
            Line.ROW -> List(CONSECUTIVE_PIECES_TO_WIN) { Intersection(row, column + it) }
            Line.COLUMN -> List(CONSECUTIVE_PIECES_TO_WIN) { Intersection(row + it, column) }
            Line.BACKSLASH -> List(CONSECUTIVE_PIECES_TO_WIN) {
                Intersection(
                    row + it,
                    column + it
                )
            }

            Line.SLASH -> List(CONSECUTIVE_PIECES_TO_WIN) { Intersection(row + it, column - it) }
        }
    }

    /**
     * Used to see if game is in draw state.
     * As draw state is determined by the board being completely filled.
     */
    private fun isDraw(board: Board) =
        board.pieces.size == localBoardDim * localBoardDim

    /**
     * Used to link player type, [Player.B] and [Player.W],
     * to game state, [State.NEXT_TURN_B] and [State.NEXT_TURN_W], respectively.
     */
    private fun getCurrentPlayer(state: State): Player {
        return when (state) {
            State.NEXT_TURN_B -> Player.B
            State.NEXT_TURN_W -> Player.W
            else -> throw IllegalStateException("Unexpected error.")
        }
    }

    /**
     * Used to current player, [Player.B] and [Player.W],
     * to game state representing next player, [State.NEXT_TURN_W] and [State.NEXT_TURN_B], respectively.
     */
    private fun getNextPlayer(player: Player) = when (player) {
        Player.B -> State.NEXT_TURN_W
        Player.W -> State.NEXT_TURN_B
        else -> throw IllegalStateException("Unexpected error -> unknown trying to play.")
    }

    /**
     * Used to link player who made winning play, [Player.B] and [Player.W],
     * to game state representing win, [State.WINNER_B] and [State.WINNER_W], respectively.
     */
    private fun getWinner(player: Player): State = when (player) {
        Player.B -> State.WINNER_B
        Player.W -> State.WINNER_W
        else -> throw IllegalStateException("Unexpected error -> unknown trying to play.")
    }
}
