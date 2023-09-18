

object TUI {
    fun readInt(key: Long): Int {
        val char = KBD.waitKey(key)
        return char.code
    }

    fun useriD(): Int? {
        var id = ""
        writeStr("ID:???")
        LCD.cursor(1,3)
        while (id.length <= 2) {
            //println("id: ${id.length}")
            val char = readInt(5000).toChar()
            when{
                char == KBD.NONE -> {
                    break
                }
                id.isNotEmpty() && char == '*' -> {
                    id = ""
                    LCD.cursor(1,0)
                    writeStr("ID:   ")
                    LCD.cursor(1,3)
                }
                char == '*' -> break
                else -> {
                    id += char
                    LCD.write(char)
                }
            }
        }
        return if (id.length == 3) id.toIntOrNull() else null
    }

    fun userPIN(): Int?{
        var pass = ""
        LCD.cursor(1,4)
        while (pass.length <= 3 ) {
            //println("pass: ${pass.length}")
            val char = readInt(5000).toChar()
            when{
                char == KBD.NONE -> {
                    break
                }
                pass.isNotEmpty() && char == '*' -> {
                    pass = ""
                    LCD.cursor(1,0)
                    writeStr("PIN:????")
                    LCD.cursor(1,4)
                }
                char == '*' -> break
                char == '#' -> continue                                              //não aceitar #
                else -> {
                    pass += char
                    LCD.write("*")
                }
            }
        }
        return if (pass.length == 4) pass.toIntOrNull() else null
    }
    fun writeStr (txt: String) {
        if (txt.length >= 16) {
            for (i in 0 until 16) {
                LCD.write(txt[i])
            }
            LCD.cursor(1,0)
            for (i in 16 until txt.length) {
                LCD.write(txt[i])
            }

        } else
            LCD.write(txt)
    }
    fun writeLCD(text: String) {
        LCD.write(text)
    }
    fun init() {
        KBD.init()
        LCD.init()
        LCD.cursor(0, 0)
        //writeStr("batatas")
    }
    fun setCursor(line: Int, column: Int) {
        LCD.cursor(line, column)
    }
    fun clearLCD() {
        LCD.clear()
    }

}



fun main() {
    TUI.init()
}