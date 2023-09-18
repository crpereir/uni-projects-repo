const val MAX_WIDTH = 700
const val MIN_WIDTH = 0
const val MIN_SPEED = 1
const val MAX_SPEED = 4
const val NOPOINTS = 0

/**
 * Represents the Game
 * @property area Area of the Game
 * @property alienShots List of the Shots
 * @property ship Initial SpaceShip
 * @property over Decides if the Game is over or not
 * @property invaders Initial Invaders
 * @property dir Direction of the Invaders
 * @property win Decides if the player wins or not the Game
 * @property score Initial score
 */
data class Game(
    val area: Area, val alienShots: List<Shot>, val ship: Spaceship, val over: Boolean, val invaders: List<Invader>,
    val dir: Direction = Direction.RIGHT, val win: Boolean = false, val score: Int
)

/**
 * Adds an ShipShot to the List of Shots if over is false, win is false and the list is empty
 * @receiver Current state of the game
 * @return Game actualized with the new ShipShot in the list
 */
fun Game.addShipShot(): Game {
    if (!over && !win && ship.shipShot.isEmpty()) {
        return copy(ship = ship.shot())
    } else {
        return copy()
    }
}

/**
 * Adds an AlienShot with a 50% probability to the List of Shots if over and win is false
 * @receiver Current state of the game
 * @return Game actualized with the new AlienShots
 */
fun Game.addAlienShot(): Game {
    val probability = (0..99).random()
    val alien: Invader = invaders.random()
    return if (!over && !win && probability > 49) {
        return copy(alienShots = alienShots + Shot(alien.x + INVADERS_WIDTH / 2, alien.y + INVADERS_HEIGHT / 2, (MIN_SPEED..MAX_SPEED).random()))
    } else {
        copy()
    }
}

/**
 * Moves the Spaceship in the x-axis in the Area Width limits depending on the position of the mouse
 * @receiver Current state of the game
 * @param x Position in the x-axis of the SpaceShip
 * @return Game actualized with the new SpaceShip position in the x-axis
 */
fun Game.moveTo(x: Int): Game {
    if (x + SHIP_WIDTH / 2 < MAX_WIDTH && x - SHIP_WIDTH / 2 > MIN_WIDTH && !over && !win) {
        return copy(ship = ship.move(x - SHIP_WIDTH / 2))
    } else {
        return this
    }
}

/**
 * Moves the ShipShot in the y-axis if it is in the height limits of Area and if exceeded the Shot is erased
 * @receiver Current state of the game
 * @return Actualized Game with the new ShipShot in the list
 */
fun Game.moveShipShot(): List<Shot> {
    val moveShipShot = ship.shipShot.map { shot -> shot.move() }
    return moveShipShot.filter { shot -> shot.y >= 0 }
}

/**
 * Moves the AlienShots in the y-axis if they are in the height limits of the Area and if they haven't been hit
 * @receiver Current state of the game
 * @return Actualized Game with the new AlienShots in the list
 */
fun Game.moveAlienShot(): List<Shot> {
    val movedShot = alienShots.map { shot -> shot.move() }
    return movedShot.filter { shot -> shot.y <= CANVAS_HEIGHT && !killAliens(shot) }
}

/**
 * Returns true or false depending on the ShipShot hitting the AlienShots
 * @receiver Current state of the game
 * @param shot of the AlienShots that are in the list
 * @return returns false if the ShipShot doesn't hit any AlienShot
 */
fun Game.killAliens(shot: Shot): Boolean {
    return ship.shipShot.any { shipShot ->
        (shot.x + SHOT_WIDTH in shipShot.x..shipShot.x + SHOT_WIDTH || shot.x in shipShot.x..shipShot.x + SHOT_WIDTH)
            && shot.y + SHOT_HEIGHT in shipShot.y..shipShot.y + SHOT_HEIGHT
    }

}

/**
 * Checks if there has been a collision between the shipShot and the Invaders or Invaders shot
 * @receiver Current state of the game
 * @return Actualized Game without the Invader that got hit and erases the shipShot that hit it or the alien killed type
 */
fun Game.checkInvaderscollisions(): Game {
    this.invaders.forEachIndexed { i, a ->
        if (ship.shipShot.isNotEmpty())
            if (ship.shipShot[0].x + SHOT_WIDTH in a.x..a.x + a.width && ship.shipShot[0].y + SHOT_HEIGHT in a.y..a.y + a.height)
                return copy(invaders = invaders.filterIndexed { idx, _ -> idx != i }, ship = ship.resetShot(), score = score + getScoreAlien(a.type))
    }
    return this
}

/**
 * Changes over to true if the AlienShots hit the SpaceShip or if the Invaders hit the SpaceShip ending the Game
 * @receiver Current state of the game
 * @return Returns false if a collision doesn't happen
 */
fun Game.endGame(): Boolean {
    return alienShots.any { shot -> (shot.x + SHOT_WIDTH in ship.x..ship.x + SHIP_WIDTH ||
                shot.x in ship.x..ship.x + SHIP_WIDTH) && shot.y + SHOT_HEIGHT in ship.y..ship.y + SHIP_HEIGHT }
            || invaders.any { invaders -> (invaders.y + INVADERS_HEIGHT in ship.y..ship.y + SHIP_HEIGHT)}
}

/**
 * Changes over to true if all the Invaders have been hit wining and ending the Game
 * @receiver Current state of the game
 * @return Returns false if a not all Invaders have been hit
 */
fun Game.verifyWin(): Boolean {
    if (invaders.isEmpty()) {
        return true
    }
    return false
}

/**
 * Updates the Game with the new AlienShots, the Ship with the new x coordinate, the new ShipShot and the new Score if over and win is false
 * @receiver Current state of the game
 * @return Actualization of the Game if Game Over is not achieved
 */
fun Game.update(): Game {
    if (!over && !win) {
        return copy(alienShots = moveAlienShot(), ship = ship.copy(shipShot = moveShipShot()), over = endGame(), win = verifyWin(), score = score())
    } else {
        return copy()
    }
}

/**
 * Counts the Scores of the game depending on which Invaders gets hit
 * @param type type of alien
 * @return Points for hit
 */
fun getScoreAlien(type: Int): Int {
    return if (type == SQUID_TYPE) {
        SQUID_POINTS
    } else if (type == CRAB_TYPE) {
        CRAB_POINTS
    } else if (type == OCTOPUS_TYPE) {
        OCTOPUS_POINTS
    } else
        NOPOINTS
}

/**
 * Counts the Scores of the game when the alienShots get hit
 * @receiver Current state of the game
 * @return Points for hit
 */
fun Game.score(): Int {
    if(alienShots.any {shot -> killAliens(shot) })
        return score + ALIENSHOTS_POINTS
    return score
}