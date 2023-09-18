
const val SHOT_WIDTH = 4
const val SHOT_HEIGHT = 7
const val ALIENSHOTS_POINTS = 1

/**
 * Represents the Shots
 * @property x x-axis value of the Shot
 * @property y y-axis value of the Shot
 * @property speed velocity that the shoots move in the y-axis
 */
data class Shot (val x: Int, val y: Int, val speed: Int)

/**
 * Moves the Shots in function of the speed
 * @receiver Current shot
 */
fun Shot.move() = copy(y = y + speed)