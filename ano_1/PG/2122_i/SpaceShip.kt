
const val SPACESHIP_Y = 450
const val SHIP_WIDTH = 50
const val SHIP_HEIGHT = 30

/**
 * Represents the SpaceShip
 * @property x Positive x-axis value of the SpaceShip
 * @property y Positive y-axis value of the SpaceShip
 * @property shipShot list of the ShipShots
 */
data class Spaceship (val x: Int, val y: Int = SPACESHIP_Y, val shipShot: List<Shot>)

/**
 * Moves the SpaceShip on the x-axis inside the Canvas width limits
 * @receiver SpaceShip that is going to be moved
 * @param mousex x position of the mouse
 * @return the Spaceship with the new x from the mouse movement
 */
fun Spaceship.move(mousex: Int): Spaceship {
    return copy(x = mousex)
}

/**
 * Creates the ShipShots and adds them to a list
 * @receiver Current Spaceship
 * @return New shots
 */
fun Spaceship.shot(): Spaceship {
    return copy(shipShot = shipShot + Shot(x + SHIP_WIDTH/2, y - SHIP_HEIGHT/2, -MAX_SPEED))
}

/**
 * Cleans the shipShot from the List
 * @receiver Spaceship where the shot comes from
 */
fun Spaceship.resetShot() = copy(shipShot = emptyList())