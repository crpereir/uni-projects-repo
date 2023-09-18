
import pt.isel.canvas.*

const val TEXT_WIDTH = CANVAS_WIDTH/2 - 2*SHIP_WIDTH
const val TEXT_HEIGHT = CANVAS_HEIGHT - SHIP_HEIGHT
const val FONT_SIZE = 32
const val YOUWIN_XPOSITION = 10
const val YOUWIN_YPOSITION = 490

/**
 * Shows all game (Spaceship, Aliens, Shots and Game Over and You Win text)
 * @receiver Canvas where Game is showed
 * @param g Current state of the Game
 */
fun Canvas.reDraw(g: Game) {
    erase()
    drawSpaceship(g)
    drawInvader(g.invaders)
    g.ship.shipShot.forEach { drawShipShot(it) }
    g.alienShots.forEach { drawAlienShots(it) }
    drawText(YOUWIN_XPOSITION,YOUWIN_YPOSITION, txt = "${g.score}", WHITE,FONT_SIZE)
    if (g.verifyWin()) {
        drawText(TEXT_WIDTH, TEXT_HEIGHT, txt = "YOU WIN", GREEN, FONT_SIZE)
    }
    if (g.over) {
        drawText(TEXT_WIDTH, TEXT_HEIGHT, txt = "Game Over", RED, FONT_SIZE)
    }
}

/**
 * Shows Spaceship in canvas
 * @receiver Canvas where Spaceship is showed
 * @param g Current state of the Game
 */
fun Canvas.drawSpaceship(g: Game) {
    drawImage("spaceship.png",g.ship.x, g.ship.y, SHIP_WIDTH, SHIP_HEIGHT)
}

/**
 * Shows ShipShot in canvas
 * @receiver Canvas where ShipShot is showed
 * @param shot Current ShipShot to show
 */
fun Canvas.drawShipShot (shot: Shot) {
    drawRect(shot.x, shot.y, SHOT_WIDTH, SHOT_HEIGHT, WHITE)
}

/**
 * Shows AlienShots in canvas
 * @receiver Canvas where AlienShots are showed
 * @param shot Current AlienShot to show
 */
fun Canvas.drawAlienShots(shot: Shot) {
    drawRect(shot.x, shot.y, SHOT_WIDTH, SHOT_HEIGHT, RED)
}

/**
 * Shows Invader in canvas
 * @receiver Canvas where Invader is showed
 * @param invader Current Invader on the List to show
 */
fun Canvas.drawInvader(invader: List<Invader>) {
    invader.map {
        this.drawImage("invaders.png|${IMAGE_WIDTH*it.animation},${IMAGE_HEIGHT*it.type},$IMAGE_WIDTH," +
                "$IMAGE_HEIGHT",it.x,it.y, it.width,it.height)
    }
}

