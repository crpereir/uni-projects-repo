import KBD.waitKey
import LCD.clear
import LCD.cursor
import LCD.write


object TUI {
    fun read(key: Long): Int {
        val char = waitKey(key)
        return char.code
    }

    fun writeLCD(text: String) {
        write(text)
    }

    fun init() {
        cursor(0, 0)
    }

    fun setCursor(line: Int, column: Int) {
        cursor(line, column)
    }

    fun clearLCD() {
        clear()
    }

}



fun main() {
    TUI.init()
}