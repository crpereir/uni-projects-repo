import pt.isel.canvas.*



const val CELL_WIDTH = 40
const val CELL_HEIGHT = 54
const val GRID_WIDTH = 16
const val GRID_HEIGHT = 13



fun main () {
    onStart {
        val area = Canvas(CELL_WIDTH * GRID_WIDTH, CELL_HEIGHT * GRID_HEIGHT, WHITE)
        var game = createGame(0,0)
        area.drawGame(game)

        area.onKeyPressed {
            //println(it.code)

            /*if (it.code == 8) {
                game = createGame(game.level, game.moves-1)
            }*/

            if (it.code == 82) {
                game = createGame(game.level, game.moves)
            }

            if (it.code == 109) {
                game = createGame(game.level - 1, game.moves)
            }

            if (game.endGame()) {
                if ( it.code == 32 ) {
                    game = createGame(game.level + 1, 0)
                }
                println("End Game")

            } else {
                game = game.changeDirection( it.code )
                println(game.moves)
                area.drawGame(game)
            }
        }
    }
    onFinish { }
}


