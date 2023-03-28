import isel.leic.utils.Time

object LCD { // Escreve no LCD usando a interface a 4 bits.
    //private const val LINES = 2 // Dimensão do display.
    //private const val COLS = 16 // Dimensão do display.
    private const val LCD_RS = 0x20
    private const val LCD_ENABLE = 0x40 // 0b0100_0000
    private const val LCD_DATA = 0x1E
    private const val CLEAR_DISPLAY = 0x01
    private var state = true
    private const val CMD_DISPLAY_LENGHT = 0x28 //0b0000_1100
    private const val CMD_DISPLAY_ENTRY_MODE = 0x06 // 0b0000_0110
    private const val CMD_DISPLAY_OFF = 0x08 // 0b0000_1000
    private const val CMD_DISPLAY_ON = 0x0F // 0b0000_1111
    private const val CMD_DISPLAY_CLEAR = 0x01 //0b0000_0001


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
    // rs: false -> comando; true -> dado
    private fun writeNibbleSerial(rs: Boolean, data: Int) {


    }
    // Escreve um nibble de comando/dados no LCD
    private fun writeNibble(rs: Boolean, data: Int) {
        if (state) writeNibbleParallel(rs,data) else writeNibbleSerial(rs,data)
    }


    // Escreve um byte de comando/dados no LCD
    private fun writeByte(rs: Boolean, data: Int) {
        writeNibble(rs,data shr 4) // vai escrever um byte no display// fazer shift de 4 bits para a direita para ler a parte alta
        writeNibble(rs,data and 0x0F) // aqui fazer o and com a  e a mascara para oter o val
    }


    // Escreve um comando no LCD
    // data tem o comando que vai ser escrito no display
    // passa false para dizer que o byte a ser escrito é um comando
    // passa data que é o valor do comando enviado para o display
    private fun writeCMD(data: Int) {
        writeByte(false, data)
    }


    // Escreve um dado no LCD
    // data tem os dados que vao ser escritos no display
    // passa true para dizer que o byte a ser escrito é um dado
    // passa data que é o valor dos dados que sao enviados para o display
    private fun writeDATA(data: Int) {
        writeByte(true, data)
    }


    // Envia a sequência de iniciação para comunicação a 4 bits.
    fun init() {

        Time.sleep(15)
        writeNibble(false, 0x03)
        Time.sleep(5)
        writeNibble(false, 0x03)
        Time.sleep(1)

        writeNibble(false, 0x03)
        writeNibble(false, 0x02)
        writeCMD(CMD_DISPLAY_LENGHT)
        writeCMD(CMD_DISPLAY_OFF)
        writeCMD(CMD_DISPLAY_CLEAR)
        writeCMD(CMD_DISPLAY_ENTRY_MODE)
        writeCMD(CMD_DISPLAY_ON)
    }



    // Escreve um caráter na posição corrente.
    // c é o caracter que vai ser escrito no display
    // c.code vai dar o valor do caracter em unicode
    // c.code é passado à writeDATA com os dados para serem escritos no display
    fun write(c: Char) {
        writeDATA(c.code)
    }


    // Escreve uma string na posição corrente.
    // text é a string que vai ser escrita no display
    // para cada c na string ele escreve cada caracter no display (um de cada vez)
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
        cursor(0,0)
    }
}
fun main(){
    HAL.init()
    LCD.init()
    //LCD.cursor(0,10) //avança as linhas
    LCD.write("hello world")
    //LCD.write('e')


}
