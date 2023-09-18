import pt.isel.canvas.DOWN_CODE
import pt.isel.canvas.LEFT_CODE
import pt.isel.canvas.RIGHT_CODE
import pt.isel.canvas.UP_CODE

/**
 * It represents the 5 possible directions: vertical, horizontal and still.
 * @property lineDif Offset in the lines of this direction.
 * @property colDif Offset in the columns of this direction.
 */
enum class Direction(val lineDif: Int, val colDif: Int) {
    LEFT(0,-1), RIGHT(0,+1),
    UP(-1,0), DOWN(+1,0),
    STILL(0,0)
}


/**
 * Checks if the cell position is within the dimensions of the grid.
 */
fun Cell.inArena(dim: Dimension): Boolean = line in 0 until dim.width && col in 0 until dim.height


/**
 * Goes to the opposite line staying in the same col or opposite col staying in the same line.
 * @receiver The original Cell.
 * @param dim dimensions of the grid.
 * @return New Cell.
 */
fun Cell.toInArena(dim: Dimension): Cell =
    when {
        line == dim.width -> Cell(col, 0)
        line == -1 -> Cell(col, dim.width-1)
        col == dim.height -> Cell(0, line)
        col == -1 -> Cell(dim.height-1, line)
        else -> Cell(line, col)
        }


/**
 * Transforms the code of a key into a direction.
 */
fun Int.toDir(): Direction? = when (this) {
    RIGHT_CODE -> Direction.RIGHT
    LEFT_CODE -> Direction.LEFT
    UP_CODE -> Direction.UP
    DOWN_CODE -> Direction.DOWN
    else -> null
}

/*
fun Ghost.invertDirection(): Direction =
    when( dir ) {
        Direction.UP -> Direction.DOWN
        Direction.DOWN -> Direction.UP
        Direction.RIGHT -> Direction.LEFT
        else -> Direction.RIGHT
    }

*/

/**
 * Gets the result of a cell shifted in one direction.
 * [Cell] + [Direction] -> [Cell]
 */
operator fun Cell.plus(dir: Direction) =
    Cell( col + dir.colDif, line + dir.lineDif)


/**
 * Gets the direction of displacement between two cells.
 * [Cell] - [Cell] -> [Direction]
 */
operator fun Cell.minus(b: Cell): Direction? {
    val lineDif = (line - b.line).coerceIn(-1 .. +1)
    val colDif = (col - b.col).coerceIn(-1 .. +1)
    return Direction.values().firstOrNull { it.lineDif == lineDif && it.colDif == colDif }
}

