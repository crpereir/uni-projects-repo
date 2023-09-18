import pt.isel.canvas.*


const val TEXT_WIDTH = (CELL_SIZE * GRID_WIDTH)/3 + 10
const val TEXT_HEIGHT = CELL_SIZE * GRID_HEIGHT + CELL_SIZE - 4
const val FONT_SIZE = 19


/**
 * Draw the entire scene of the game: The pacman, the pellets, the score and the walls.
 */
fun Canvas.drawArena(game: Game) {
    erase()
    drawGrid()
    drawPacman(game.pacman)
    drawPellets(game.pellets)
    drawPowerPellets(game.powerPellets)
    drawGhosts(game.ghost)
    if (game.verifyGameOver() && game.pacman.cell in game.ghost.map { it.cell }) {
        //erase()
        drawEnd(game.ghost.map { it.cell })
        game.ghost.map { it.cell } - game.pacman.cell
        drawText(TEXT_WIDTH, TEXT_HEIGHT, txt = "Game Over", RED, FONT_SIZE)}
    else if (game.verifyGameOver()) {
            drawText(TEXT_WIDTH, TEXT_HEIGHT, txt = "Game Over", RED, FONT_SIZE) }
    else drawGhosts(game.ghost)
    drawScore(game.score)
    drawWalls(game.walls)
}


/**
 * Draw the lines[GRID_WIDTH] and columns[GRID_HEIGHT] to form a grid.
 */
fun Canvas.drawGrid() {
    repeat(GRID_WIDTH) {
        val x = it * CELL_SIZE
        drawLine( x, 0, x, CELL_SIZE * GRID_HEIGHT-CELL_SIZE/(CELL_SIZE/2), BLACK, 1)
    }
    repeat(GRID_HEIGHT) {
        val y = it * CELL_SIZE
        drawLine( 0, y, CELL_SIZE * GRID_WIDTH, y, BLACK, 1)
    }
}


/**
 * Shows pacman in Canvas with 5 different images connected by the directions.
 */
fun Canvas.drawPacman(a: PacMan){
    val x = a.cell.col * CELL_SIZE
    val y = a.cell.line * CELL_SIZE
    val lineSprite = when(a.dir) {
        Direction.LEFT -> 0
        Direction.RIGHT -> 1
        Direction.DOWN -> 2
        Direction.UP -> 3
        Direction.STILL -> 4

    }
    drawImage("pacman.png|${lineSprite*32},0,32,32", x, y, CELL_SIZE, CELL_SIZE)
}


/**
 * Shows ghosts in Canvas with 4 different images connected by the directions and 1 image not.
 */
fun Canvas.drawGhosts(ghost: List<Ghost>) {
    ghost.forEach {
        val x = it.cell.col * CELL_SIZE
        val y = it.cell.line * CELL_SIZE
        if (it.escape)
            drawImage("pacman.png|160,96,32,32", x, y, CELL_SIZE, CELL_SIZE)
        else {
            val lineSprite = when (it.dir) {
                Direction.UP -> 2
                Direction.DOWN -> 3
                Direction.LEFT -> 4
                Direction.RIGHT -> 5
                else -> 3
            }
            drawImage("pacman.png|0,${lineSprite * 32},32,32", x, y, CELL_SIZE, CELL_SIZE)
        }
    }
}

/**
 * Draw the collision between pacman and ghost.
 */
fun Canvas.drawEnd(s: List<Cell>) {
    s.forEach {
        val x = it.col * CELL_SIZE
        val y = it.line * CELL_SIZE
        drawImage("pacman.png|320,192,32,32", x, y, CELL_SIZE, CELL_SIZE)
    }
}

/**
 * Draw pellets.
 */
fun Canvas.drawPellets(p: List<Cell>) {
    p.forEach {
        drawCircle(it.col * CELL_SIZE + CELL_SIZE / 2, it.line * CELL_SIZE + CELL_SIZE / 2, CELL_SIZE / 8, WHITE)
    }
}


/**
 * Draw power pellets.
 */
fun Canvas.drawPowerPellets(p: List<Cell>) {
    p.forEach {
        drawCircle(it.col * CELL_SIZE + CELL_SIZE / 2, it.line * CELL_SIZE + CELL_SIZE / 2, CELL_SIZE / 4, WHITE)
    }
}


/**
 * Draw walls using the function drawSquares.
 */
fun Canvas.drawWalls(s: List<Cell>) {
    s.forEach {
        drawSquares(it)
    }
}


/**
 * Draw squares.
 */
fun Canvas.drawSquares( s: Cell) {
    val x = s.col * CELL_SIZE
    val y = s.line * CELL_SIZE
        drawRect(x, y, CELL_SIZE, CELL_SIZE , BLUE)
}


/**
 * Draw text for the score.
 */
fun Canvas.drawScore(n: Int){
    drawText(GRID_WIDTH/2, TEXT_HEIGHT, txt = "Score: $n", WHITE,FONT_SIZE)
}