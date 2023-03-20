import pt.isel.canvas.*


const val CELL_SIZE = 32
const val GRID_WIDTH = 11
const val GRID_HEIGHT = 11
const val MAX_COUNTER = 120

fun main () {
    onStart {
        val area = Canvas(CELL_SIZE * GRID_WIDTH, CELL_SIZE * GRID_HEIGHT + CELL_SIZE, BLACK)
        var game = createGame()
        area.drawArena(game)
        area.onKeyPressed { key: KeyEvent ->
            game = game.movePacMan(key.code)
            area.drawArena(game)
        }
        area.onTimeProgress(20000) { //20 segundos
           game = game.createGhost()
           area.drawArena(game)
        }
    }

    onFinish {}
}



