
const val SQUID_TYPE = 0
const val CRAB_TYPE = 1
const val OCTOPUS_TYPE = 2

const val SQUID_POINTS = 30
const val CRAB_POINTS = 20
const val OCTOPUS_POINTS = 10

const val IMAGE_WIDTH = 112
const val IMAGE_HEIGHT = 80
const val INVADERS_WIDTH = 56
const val INVADERS_HEIGHT = 40

const val INITIAL_Y = 40
const val INITIAL_ANIMATION = 0

const val NEXT_ANIMATION = 1
const val NEXT_X = 4
const val NEXT_Y = 20

/**
 * Represents the Invader
 * @property x x-axis value of the Invader
 * @property y y-axis value of the Invader
 * @property width Width of the Invader
 * @property height Height of the Invader
 * @property animation Initial animation
 * @property type Type of the Invader
 */
data class Invader (val x: Int, val y: Int, val width: Int, val height: Int, val animation: Int, val type: Int)

/**
 * Adds the Invader to the list
 * @receiver List of the Invaders where the Invader is added
 * @param x x-axis value of the Invader
 * @param y y-axis value of the Invader
 * @return the new List of Invader
 */
fun List<Invader>.createInvader(x: Int, y: Int): List<Invader> {
    return if (x == 1 && (y-1 == SQUID_TYPE || y-2 == SQUID_TYPE)) {
        this + Invader(x, INITIAL_Y * y, INVADERS_WIDTH, INVADERS_HEIGHT, INITIAL_ANIMATION, SQUID_TYPE)
    } else if (x == 1 && (y - 2 == CRAB_TYPE || y - 3 == CRAB_TYPE)) {
        this + Invader(x, INITIAL_Y * y, INVADERS_WIDTH, INVADERS_HEIGHT, INITIAL_ANIMATION, CRAB_TYPE)
    } else if (x == 1 && y - 3 == OCTOPUS_TYPE) {
        this + Invader(x, INITIAL_Y * y, INVADERS_WIDTH, INVADERS_HEIGHT, INITIAL_ANIMATION, OCTOPUS_TYPE)
    } else if (y - 1 == SQUID_TYPE || y - 2 == SQUID_TYPE) {
        this + Invader(this [this.lastIndex].x + INVADERS_WIDTH, INITIAL_Y * y, INVADERS_WIDTH, INVADERS_HEIGHT, INITIAL_ANIMATION, SQUID_TYPE)
    } else if (y - 2 == CRAB_TYPE || y - 3 == CRAB_TYPE) {
        this + Invader(this [this.lastIndex].x + INVADERS_WIDTH, INITIAL_Y * y, INVADERS_WIDTH, INVADERS_HEIGHT, INITIAL_ANIMATION, CRAB_TYPE)
    } else {
        this + Invader(this [this.lastIndex].x + INVADERS_WIDTH, INITIAL_Y * y, INVADERS_WIDTH, INVADERS_HEIGHT, INITIAL_ANIMATION, OCTOPUS_TYPE)
    }
}

/**
 * The two possible directions
 */
enum class Direction { LEFT, RIGHT }

/**
 * Moves the Invaders to the sides and down
 * @receiver List<Invader> that has the current Invaders
 * @param g Current state of the Game
 * @return Actualized Game with the new x and y of the Invaders
 */
fun List<Invader>.moveInvaders(g: Game): Game {
    if (this.any { it.x + INVADERS_WIDTH >= g.area.width || it.x <= 0 }) {
        val delta = if(g.dir == Direction.RIGHT) -NEXT_X else +NEXT_X
        val movedAliens = this.map {
            Invader(it.x + delta, it.y + NEXT_Y, it.width, it.height, INITIAL_ANIMATION, it.type)
        }
        return g.copy(invaders = movedAliens,
            dir = if(g.dir == Direction.RIGHT) Direction.LEFT else Direction.RIGHT)
    } else {
        val delta = if(g.dir == Direction.RIGHT) +NEXT_X else -NEXT_X
        val movedAliens = this.map {
            if (it.animation == NEXT_ANIMATION)
                Invader(it.x + delta, it.y, it.width, it.height, INITIAL_ANIMATION, it.type)
            else
                Invader(it.x + delta, it.y, it.width, it.height, NEXT_ANIMATION, it.type)
        }
        return g.copy(
            invaders = movedAliens,
        )
    }
}

