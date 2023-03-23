

object LCD { // Escreve no LCD usando a interface a 4 bits.

    private const val LINES = 2 // Dimensão do display.
    private const val COLS = 16 // Dimensão do display.


    // Escreve um nibble de comando/dados no LCD em paralelo
    private fun writeNibbleParallel(rs: Boolean, data: Int) {

    }


    // Escreve um nibble de comando/dados no LCD em série
    // rs: false -> comando; true -> dado
    private fun writeNibbleSerial(rs: Boolean, data: Int) {


    }
    // Escreve um nibble de comando/dados no LCD
    private fun writeNibble(rs: Boolean, data: Int) {


    }


    // Escreve um byte de comando/dados no LCD
    private fun writeByte(rs: Boolean, data: Int) {
        writeNibbleSerial(rs, data) // vai escrever um byte no display
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
    fun cursor(line: Int, column: Int) {

    }


    // Envia comando para limpar o ecrã e posicionar o cursor em (0,0)
    fun clear() {

    }
}