import LCD.clear
import LCD.cursor


object TUI {
    fun init() {
        cursor(0, 0)
    }

    fun setCursor(line: Int, column: Int) {
        cursor(line, column)
    }

    fun clearLCD() {
        clear()
    }

    fun write() {

    }

    fun read() {

    }
}



fun main() {
    TUI.init()

}