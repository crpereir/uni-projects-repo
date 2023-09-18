import pt.isel.canvas.*

data class Game(val dim: Dimension, val man: Man, val walls: List<Position>,
                val targets: List<Position>, val boxes: List<Position>,
                val level: Int, val moves: Int)
data class Dimension(val width: Int, val height: Int)
data class Man(val pos: Position, val dir: Direction, val push: Boolean = false)


enum class Direction(val lineDif: Int, val colDif: Int) {
    LEFT(0,-1), RIGHT(0,+1),
    UP(-1,0), DOWN(+1,0)
}


/**
 * Create the initial game.
 */
fun createGame(idx: Int, moves: Int): Game {
    val levels = loadLevels("Classic.txt")
    val man = levels[idx].cells.first{ it.type == Type.MAN}.pos  //println(man.line)
    return Game(
        dim = Dimension(levels[idx].width, levels[idx].height),
        man = Man(man, Direction.DOWN),
        walls = walls(levels[idx]),
        targets = targets (levels[idx]),
        boxes = boxes(levels[idx]),
        level = idx,
        moves = moves
    )
}


/**
 * @param maze Described map
 * Walls in the right positions from the maze map
 */
fun walls(maze: Maze) : List<Position> {
    val walls = maze.cells.filter { it.type == Type.WALL }.map { it.pos }
    return walls.map { Position(it.col, it.line) }
}


/**
 * @param maze Described map
 * Targets in the right positions from the maze map
 */
fun targets(maze: Maze) : List<Position> {
    val targets = maze.cells.filter { it.type == Type.TARGET }.map { it.pos }
    return targets.map { Position(it.col, it.line) }
}


/**
 * @param maze Described map
 * Boxes in the right positions from the maze map
 */
fun boxes(maze: Maze) : List<Position> {
    val boxes = maze.cells.filter { it.type == Type.BOX }.map { it.pos }
    return boxes.map { Position(it.col, it.line) }
}


/**
 * Executes all collisions between walls, man and boxes
 * Checks the man-made process of pushing the boxes
 * @receiver The current game
 * @param keyCode Key code of key pressed
 * @return Game actualized
 */
fun Game.changeDirection (keyCode: Int): Game {
    val newDirection = when (keyCode) {
        DOWN_CODE -> Direction.DOWN
        UP_CODE -> Direction.UP
        RIGHT_CODE -> Direction.RIGHT
        else -> Direction.LEFT
    }
    val newMan = this.man.copy(dir = newDirection)
    val newMan2 = newMan.process(newDirection)


    if(manCollisionWall(newMan2, this)) {
        return this.copy(man=newMan)
    }

    // pushBox retorna a lista de caixas igual se o man nao conseguiu mover
    val newBoxPositions = pushBox(this, newDirection)
    if(newBoxPositions != boxes) {
        // houve mudanca de posicoes
        return this.copy(boxes = newBoxPositions, man = newMan2)
    }
    else {
        // nao houve mudanca (ou a caixa ta no limite)
        return if (boxes.find{ box -> Position(box.col, box.line) == newMan2.pos} != null) {
            this
        } else {
            this.copy(man = newMan2, moves = this.moves + 1)
        }
    }
}


/**
 * Returns true if the list of positions obtained has a length different from zero
 * @param man The original man
 * @param game The current game
 */
fun manCollisionWall( man:Man, game:Game ) : Boolean =
    game.walls.any { it == man.pos }  //game.walls.filter { it==man.pos }.size != 0


/**
 * Returns true if there is a wall (from [walls] at [boxPosition])
 * @param walls List of positions
 * @param boxPosition Position of box
 */
fun wallExistsInPosition(walls: List<Position>, boxPosition: Position): Boolean {
    return walls.find { wall -> Position(wall.col, wall.line) == boxPosition } != null
}


/**
 * Returns true if there is a box (from [boxes] at [boxPosition])
 * @param boxes List of positions
 * @param boxPosition Position of box
 */
fun boxExistsInBox(boxes: List<Position>, boxPosition: Position): Boolean {
    return boxes.find { box -> Position(box.col, box.line) == boxPosition} != null
}


/**
 * Executes the man-made process of pushing the boxes
 * @param game The current game
 * @param newDirection
 */
fun pushBox ( game: Game, newDirection: Direction): List<Position> {
    val newMan = game.man.process(newDirection)
    val boxList = game.boxes.filter { it == newMan.pos }
    if (boxList.isNotEmpty()) {
        return when (newDirection) {
            Direction.DOWN -> {
                val newBoxPos = Position(boxList[0].col, boxList[0].line+1)
                when (wallExistsInPosition(game.walls, newBoxPos) || boxExistsInBox(game.boxes, newBoxPos)) {
                    true -> game.boxes
                    false ->game.boxes.map{if (it == boxList[0]) newBoxPos else it}
                }
            }
            Direction.UP -> {
                val newBoxPos = Position(boxList[0].col, boxList[0].line-1)
                when (wallExistsInPosition(game.walls, newBoxPos) || boxExistsInBox(game.boxes, newBoxPos)) {
                    true -> game.boxes
                    false -> game.boxes.map{if (it == boxList[0]) newBoxPos else it}
                }
            }
            Direction.RIGHT -> {
                val newBoxPos = Position(boxList[0].col+1, boxList[0].line)
                when (wallExistsInPosition(game.walls, newBoxPos) || boxExistsInBox(game.boxes, newBoxPos)) {
                    true -> game.boxes
                    false ->game.boxes.map{if (it == boxList[0]) newBoxPos else it}
                }
            }
            else -> {
                val newBoxPos = Position(boxList[0].col-1, boxList[0].line)
                when (wallExistsInPosition(game.walls, newBoxPos) || boxExistsInBox(game.boxes, newBoxPos)) {
                    true -> game.boxes
                    false ->game.boxes.map{if (it == boxList[0]) newBoxPos else it}
                }
            }
        }
    }
    return game.boxes
}

/**
 * Returns true if the box position list is the same as the target position list
 * @receiver The current game
 */
fun Game.endGame (): Boolean = this.boxes.toSet() == this.targets.toSet()

