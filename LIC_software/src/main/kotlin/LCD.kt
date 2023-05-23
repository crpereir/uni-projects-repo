import isel.leic.utils.Time

object LCD { // Escreve no LCD usando a interface a 4 bits.
    private const val LCD_RS = 0x20
    private const val LCD_ENABLE = 0x40
    private const val LCD_DATA = 0x1E
    private const val CLEAR_DISPLAY = 0x01
    private var state = false
    private const val CMD_DISPLAY_LENGHT = 0x28
    private const val CMD_DISPLAY_ENTRY_MODE = 0x06
    private const val CMD_DISPLAY_OFF = 0x08
    private const val CMD_DISPLAY_ON = 0x0F
    private const val CMD_DISPLAY_CLEAR = 0x01


    // Escreve um nibble de comando/dados no LCD em paralelo
    private fun writeNibbleParallel(rs: Boolean, data: Int) {
        HAL.writeBits(LCD_DATA, data shl 1)
        if (rs) HAL.setBits(LCD_RS) else HAL.clrBits(LCD_RS)
        Time.sleep(1)
        HAL.setBits(LCD_ENABLE)
        Time.sleep(1)
        HAL.clrBits(LCD_ENABLE)
        Time.sleep(1)

    }


    // Escreve um nibble de comando/dados no LCD em série
    private fun writeNibbleSerial(rs: Boolean, data: Int) {
        val rsToInt = if (rs) 1 else 0
        val newData = data.shl(1) or rsToInt
        SerialEmitter.send(SerialEmitter.Destination.LCD,newData)
    }

    // Escreve um nibble de comando/dados no LCD
    private fun writeNibble(rs: Boolean, data: Int) {
        if (state) writeNibbleParallel(rs,data) else writeNibbleSerial(rs,data)
    }


    // Escreve um byte de comando/dados no LCD
    private fun writeByte(rs: Boolean, data: Int) {
        writeNibble(rs,data shr 4) // vai escrever um byte no display// fazer shift de 4 bits para a direita para ler a parte alta
        // Time.sleep(1)
        writeNibble(rs,data and 0x0F) // aqui fazer o and com a  e a mascara para oter o val
        Time.sleep(2)
    }



    // passa data que é o valor do comando enviado para o display
    private fun writeCMD(data: Int) {
        writeByte(false, data)
    }
    // passa data que é o valor dos dados que são enviados para o display
    private fun writeDATA(data: Int) {
        writeByte(true, data)
    }


    // Envia a sequência de iniciação para comunicação a 4 bits.
    fun init() {
        Time.sleep(15)
        writeNibble(false, 0x03)
        writeNibble(false, 0x03)
        writeNibble(false, 0x03)
        writeNibble(false, 0x02)
        writeCMD(CMD_DISPLAY_LENGHT)
        writeCMD(CMD_DISPLAY_OFF)
        writeCMD(CMD_DISPLAY_CLEAR)
        writeCMD(CMD_DISPLAY_ENTRY_MODE)
        writeCMD(CMD_DISPLAY_ON)
    }

    fun write(c: Char) {
        writeDATA(c.code)
    }

    // a string é escrita no display caracter por caracter
    fun write(text: String) {
        for (c in text) {
            write(c)
        }
    }


    // Envia comando para posicionar cursor (‘line’:0..LINES-1 , ‘column’:0..COLS-1)
    fun cursor(lin: Int, col: Int) {
        writeCMD( (lin * 0x40 + col) or 0x80) // colocar bit de maior peso a 1
    }
    // Envia comando para limpar o ecrã e posicionar o cursor em (0,0)
    fun clear() {
        writeCMD(CLEAR_DISPLAY)
    }
}
fun main(){
    HAL.init()
    LCD.init()
    LCD.cursor(0,0)

    LCD.write("hey word")
    Time.sleep(5000)
    LCD.clear()
    Time.sleep(200)
    while (true){
        LCD.cursor(0,0)
        LCD.write("0123456789ABCDEF")
        LCD.cursor(1,0)
        LCD.write("0123456789ABCDEF")
    }

}
