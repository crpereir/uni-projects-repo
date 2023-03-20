/**
 * Represents the ghost.
 * Cell ([cell]), the direction ([dir]) to move, the escape mode([escape]) and the number of steps([steps]).
 */
data class Ghost (val cell: Cell,
                  val dir: Direction,
                  val escape: Boolean,
                  val steps: Int)

/**
 * Moves the ghost in one direction ([dir]).
 * @receiver The original ghost.
 * @param dir direction of movement.
 * @param wall list of Cell.
 * @param dim dimensions of the grid.
 * @param game game information.
 * @param pacMan the original pacman.
 * @return Pacman after the movement.
 */
fun Ghost.ghostMoveToDir(dir: Direction, wall: List<Cell>, dim: Dimension, game: Game, pacMan: PacMan): Ghost {
    val cell = cell + dir
    return if (cell.inArena(dim) && cell !in wall) {
        Ghost(cell,dir,game.ifRun(pacMan), game.escapeMode(pacMan)) }
    else if (!cell.inArena(dim)) {
        Ghost(cell.toInArena(dim),dir,game.ifRun(pacMan), game.escapeMode(pacMan))
    }
    else {
        copy(dir = dir) }
}
