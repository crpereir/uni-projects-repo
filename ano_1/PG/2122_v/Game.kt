
/**
 * Game information. The [dim], the [pacman], the [pellets], the [score] and the [walls].
 */
data class Game(
    val dim: Dimension, val pacman: PacMan,
    val pellets: List<Cell>,val powerPellets: List<Cell>, val score: Int,
    val walls: List<Cell>,
    val ghost: List<Ghost>,
    val counter: Int = 0
)


/**
 * Total dimensions of the grid.
 * @property width Number of lines (0 until width)
 * @property height Number of columns (0 until height)
 */
data class Dimension(val width: Int, val height: Int)


/**
 * Create the initial game.
 */
fun createGame(): Game {
    val m = loadMap(maze)
    val pacManPos = m.cells.first{ it.type == CellType.PACMAN_START}.cell
    val ghostPos = m.cells.first{ it.type == CellType.GHOST_START}.cell
    val ghost = Ghost(ghostPos, Direction.UP,false,0)
    return Game(
        dim = Dimension(m.width,m.height),
        pacman = PacMan(pacManPos, Direction.STILL),
        pellets = pellets(m),
        powerPellets = powerPellets(m),
        score = 0,
        walls = walls(m),
        ghost = listOf(ghost)
    )
}


/**
 * Moves the pacman.
 * @receiver The current game.
 * @param keyCode Key code of key pressed.
 * @return Game actualized with the dim, the pacman, the pellets, the score and the walls.
 */
fun Game.movePacMan(keyCode: Int): Game {
    if (verifyGameOver()) return this
    val m = loadMap(maze)
    val pacman = pacman.moveByKey(keyCode, walls, dim)
    if (pacman == this.pacman) return this
    if (pacman.cell == this.pacman.cell) return copy(pacman = pacman)
    val newPellets = if (pacman.cell in pellets) pellets - pacman.cell else pellets
    val newPowerPellets = if (ifRun(pacman)) {
        powerPellets - pacman.cell
    } else powerPellets
    val ghosts = ghost.map { it.ghostMoveToDir(moveGhost(it.cell,this,it,m),walls,dim,this,pacman) }
    val newScore =
        if (pacman.cell in pellets) score + 10
            else if (pacman.cell in powerPellets)  score + 50
                else if (score <= 0) 0
        else score - 1
    return Game(dim, pacman, newPellets, newPowerPellets, newScore, walls, ghosts)
}


fun Game.ifRun (pacman: PacMan) : Boolean =
     pacman.cell in powerPellets


fun moveGhost(cell: Cell, game: Game, ghost: Ghost, m: Maze): Direction {
    return if (m.cells.first{ it.type == CellType.FRUIT_START}.cell==ghost.cell) Direction.DOWN
    else {
        when (ghost.dir) {
            Direction.LEFT -> listOf(Direction.LEFT, Direction.DOWN, Direction.UP)
            Direction.RIGHT -> listOf(Direction.RIGHT, Direction.DOWN, Direction.UP)
            Direction.DOWN -> listOf(Direction.LEFT, Direction.RIGHT, Direction.DOWN)
            else -> listOf(Direction.LEFT, Direction.RIGHT, Direction.UP)
        }.filter {  //o filter so filtra o que é falso
            cell + it !in game.walls  //cell+dir = next cell
        }.random()
    }
}

fun Game.escapeMode(pacman: PacMan): Int =
    if (pacman.cell in powerPellets)  30 else 0


fun Game.createGhost(): Game {
    val m = loadMap(maze)
    val ghostPos = m.cells.first{ it.type == CellType.GHOST_START}.cell
    val c = Ghost(ghostPos, Direction.UP, ifRun(pacman),0)
    return copy(ghost = ghost.map { c } + ghost)}

//o fantasma está a voltar ao sítio do INÍCIO a cada 20 segundos
// ghost = listOf(Ghost(ghostPos, Direction.UP,false,0))

/**
 * Checks if it doesn't exist pellets
 */
fun Game.verifyGameOver(): Boolean {
    return pellets.isEmpty() && powerPellets.isEmpty()
}

/*
fun Game.collisions(ghost: List<Ghost>) : Pair <Boolean, Int>{
    return if (ghost.any {(pacman.cell == it.cell) || (pacman.cell == it.cell + it.invertDirection() && pacman.dir == it.invertDirection())}){
        Pair(true, 200)
    } else
        Pair(false,0)

}

fun Game.eatGhosts(): List<Ghost>{
    return if (collisions(ghost).first && counter in 1..120){
        ghost.filter {(pacman.cell != it.cell) && (pacman.cell != it.cell + it.invertDirection() || pacman.dir != it.invertDirection()) }
    }else ghost
}

fun Game.newGamemode(): Int {
    return if(powerPellets.any { it.col == pacman.cell.col  && it.line == pacman.cell.line } && counter in 1..MAX_COUNTER) {
        counter + 30
    }else if(powerPellets.any { it.col == pacman.cell.col  && it.line == pacman.cell.line} ){
        30
    }
    else counter - 1
}
*/

/**
 * Pellets in the right positions from the maze map
 */
fun pellets(m: Maze): List<Cell> {
    val pellets = m.cells.filter { it.type == CellType.PELLET }.map { it.cell }
    return pellets.map { Cell(it.col, it.line) }
}


/**
 * Power pellets in the right positions from the maze map
 */
fun powerPellets(m: Maze): List<Cell> {
    val pellets = m.cells.filter { it.type == CellType.POWER_PELLET }.map { it.cell }
    return pellets.map { Cell(it.col, it.line) }
}


/**
 * Walls in the right positions from the maze map
 */
fun walls(m: Maze): List<Cell> {
    val walls = m.cells.filter { it.type==CellType.WALL }.map { it.cell }
    return walls.map{ Cell(it.col, it.line) }
}