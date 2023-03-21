import isel.leic.UsbPort
import isel.leic.utils.Time

fun main() {
    Thread.sleep(10000)
    while (true) {
        val g = getKey()
        println(g)
    }
}

object KBD { // Ler teclas. Métodos retornam ‘0’..’9’,’#’,’*’ ou NONE.

    const val NONE = 0;

   /**
    * Inicia a classe
    * Se o kval não ativar o k 0..3 não tem significado
    * HAL.init()  -> para ter acesso às funções do HAL
    * HAL.clrBits(KACK_MASK) -> precisamos do ACK=0 pq podia haver
    * o caso de haver kpress mas não detetar pq o val=0
    */
    fun init() {
        HAL.init()
        HAL.clrBits(KACK_MASK)
    }

    const val DVAL_MASK = 0x01
    const val KACK_MASK = 0x01
    const val LEDS_MASK = 0x1E

    private val values = charArrayOf('0','1','2','3','4','5','6','7','8','9','#','*')


// Retorna de imediato a tecla premida ou NONE se não há tecla premida
    fun getKey(): Char {
        if (HAL.isBit(DVAL_MASK)) {
            val value = HAL.readBits(LEDS_MASK)
            HAL.setBits(KACK_MASK)
            while (HAL.isBit(DVAL_MASK)){

            }
            HAL.clrBits(KACK_MASK)
            return values[value]
        }
        return NONE.toChar()
    }

// Retorna a tecla premida, caso ocorra antes do ‘timeout’ (representado em milissegundos), ou NONE caso contrário.
    fun waitKey(timeout: Long): Char {
        val StartTime = Time.getTimeInMillis() // tempo inicial, quando comeaca a funcao
        while (Time.getTimeInMillis() - StartTime < timeout){
            val pressedKey = getKey()
            if (pressedKey != NONE.toChar()) return pressedKey
        }
        return NONE.toChar()
    }





}

