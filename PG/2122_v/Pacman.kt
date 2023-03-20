/**
 * Represents the pacman.
 * Cell ([cell]) and the direction ([dir]) to move.
 */
data class PacMan(val cell: Cell, val dir: Direction) // Posição e direção do pac-man


/**
 * Moves the pacman in one direction ([dir]).
 * @receiver The original pacman.
 * @param dir direction of movement.
 * @param wall list of Cell.
 * @param dim dimensions of the grid.
 * @return Pacman after the movement.
 */
fun PacMan.moveToDir(dir: Direction, wall: List<Cell>, dim: Dimension): PacMan {
    val cell = cell + dir //next cell
    return if (cell.inArena(dim) && cell !in wall) {
        PacMan(cell,dir) }
    else if (!cell.inArena(dim)) {
        PacMan(cell.toInArena(dim),dir)
    }
    else {
        copy(dir = Direction.STILL) }
}


/**
 * Moves the pacman in the direction associated with the indicated key ([keyCode]).
 * @receiver The original pacman.
 * @param keyCode Key code of key pressed.
 * @param wall list of Cell.
 * @param dim dimensions of the grid.
 * @return Pacman after the movement.
 */
fun PacMan.moveByKey(keyCode: Int, wall: List<Cell>, dim: Dimension): PacMan {
    val dir:Direction = keyCode.toDir() ?: return this
    return moveToDir(dir,wall,dim)
}
