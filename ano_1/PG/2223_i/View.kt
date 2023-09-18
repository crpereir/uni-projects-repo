import pt.isel.canvas.*



const val TEXT_HEIGHT = CELL_HEIGHT * GRID_HEIGHT
const val FONT_SIZE = 32


/**
 * Draw the lines [GRID_WIDTH] and columns [GRID_HEIGHT] to form a grid
 */
fun Canvas.drawGrid() {
    repeat(GRID_WIDTH + 1) {
        val x = it * CELL_WIDTH
        drawLine( x, 0, x, CELL_HEIGHT* GRID_HEIGHT, WHITE, 1)
    }
    repeat(GRID_HEIGHT + 1) {
        val y = it * CELL_HEIGHT
        drawLine( 0, y, CELL_WIDTH * GRID_WIDTH, y, WHITE, 1)
    }
}


/**
 * Draw the entire scene of the game
 * @param game
 */
fun Canvas.drawGame(game: Game){
    erase()
    drawGrid()
    drawTargets(game.targets)
    drawWalls(game.walls)
    drawBoxes(game.boxes,game.targets)
    drawMan(game.man)
    drawRectangle()
    drawMoves(game.level, game.moves)
    if (game.endGame()) drawGameOver()
}


/**
 * Shows man with 5 different images connected by the directions
 * */
fun Canvas.drawMan(m: Man) {
    val x = m.pos.col * CELL_WIDTH
    val y = m.pos.line * CELL_HEIGHT
    val lineSprite = when (m.dir) {
        Direction.LEFT -> 3
        Direction.RIGHT -> 1
        Direction.DOWN -> 2
        else -> 0
    }
    if (!(m.push)) {
        drawImage("soko.png|0,${lineSprite * CELL_HEIGHT + 1},$CELL_WIDTH,$CELL_HEIGHT", x, y, CELL_WIDTH, CELL_HEIGHT)
    } else (m.push)
}


fun Canvas.drawWall(square: Position) {
    val x = square.col * CELL_WIDTH
    val y = square.line * CELL_HEIGHT
    drawImage("soko.png|45,218,35,52", x, y, CELL_WIDTH, CELL_HEIGHT)
}


fun Canvas.drawWalls(square: List<Position>) {
    square.forEach { drawWall(it) }
}


fun Canvas.drawTargets(square: List<Position>) {
    square.forEach { drawBalls(it) }
}


fun Canvas.drawBalls(ball: Position) {
    val x = ball.col * CELL_WIDTH
    val y = ball.line * CELL_HEIGHT
    drawImage("soko.png|0,218,35,52", x, y, CELL_WIDTH, CELL_HEIGHT)
}


fun Canvas.drawBox(boxes: Position, state:Boolean = false ) {
    val x = boxes.col * CELL_WIDTH
    val y = boxes.line * CELL_HEIGHT
    if (state) drawImage("soko.png|84,218,35,52", x, y, CELL_WIDTH, CELL_HEIGHT)
    else { drawImage("soko.png|124,218,35,52", x, y, CELL_WIDTH, CELL_HEIGHT) }
}


fun Canvas.drawBoxes(square: List<Position>,targets:List<Position>) {
    square.forEach { if(targets.contains(it)) drawBox(it,false) else drawBox(it,true) }
}


fun Canvas.drawRectangle() = drawRect(CELL_WIDTH - GRID_WIDTH * 3, CELL_HEIGHT + 600, CELL_WIDTH * GRID_WIDTH * 3, CELL_HEIGHT - 1, CYAN)


fun Canvas.drawMoves(level: Int, moves: Int) {
    drawText(GRID_WIDTH, TEXT_HEIGHT - 10, txt = "Level: ${level+1}", BLACK, FONT_SIZE)
    drawText(GRID_WIDTH * 28, TEXT_HEIGHT - 10, txt = "Moves: $moves", BLACK, FONT_SIZE)
}


fun Canvas.drawGameOver(){
    drawText(GRID_WIDTH * 13, TEXT_HEIGHT - 10, txt = "Game Over", RED, FONT_SIZE)
}