import pt.isel.canvas.*

const val FRAME_RATE = 70
const val FRAMES_PER_SECOND = 1000 / FRAME_RATE
const val MILLISECONDS = 250
const val CANVAS_WIDTH = 700
const val CANVAS_HEIGHT = 500

const val INVADERS_LINES = 11
const val INVADERS_COLUMNS = 5
const val INITIAL_INVADERS = 1
const val PERIOD_ENEMIES = 500

/**
 * Represents the Area
 * @property width Width of the Area
 * @property height Height of the Area
 * @property color Color of the Area
 */
data class Area (val width: Int = CANVAS_WIDTH, val height: Int = CANVAS_HEIGHT, val color: Int = BLACK)

/**
 * Entry point of application
 * The game has one SpaceShip that moves on the x-axis in the Area width and is able of shooting shots controlled by the mouse click and the space bar
 * It also has Aliens that move to the sides and down and that are capable of shooting
 */
fun main() {
    onStart {
        val area = Area()
        val arena = Canvas(CANVAS_WIDTH,CANVAS_HEIGHT, BLACK)
        val invaders: List<Invader> = emptyList()

        var game = Game(area, emptyList(), Spaceship(area.width/2, shipShot = emptyList()), false, invaders, score=NOPOINTS)

        for (y in INITIAL_INVADERS..INVADERS_COLUMNS ) {
            for (x in INITIAL_INVADERS..INVADERS_LINES ) {
                game = Game(game.area, game.alienShots, game.ship, game.over,
                    game.invaders.createInvader(x,y), score=NOPOINTS)
            }
        }
        arena.drawInvader(game.invaders)

        arena.onTimeProgress(PERIOD_ENEMIES) {
            if (!game.over && !game.win)
                game = game.invaders.moveInvaders(game)
        }

        arena.onMouseMove { me: MouseEvent -> game = game.moveTo(me.x) }

       arena.onTimeProgress(MILLISECONDS) {
            game = game.addAlienShot()
        }

        arena.onKeyPressed {
                k -> if (k.text == "Space") game = game.addShipShot()
        }

        arena.onMouseDown {
            game = game.addShipShot()
        }

        arena.onTimeProgress(FRAMES_PER_SECOND) {
            game = game.checkInvaderscollisions()
            game = game.update()
            arena.reDraw(game)
        }
    }
    onFinish {}
}