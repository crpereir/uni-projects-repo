import KBD.NONE
import KBD.waitKey
import isel.leic.utils.Time


object KBD { // Ler teclas. Métodos retornam ‘0’..’9’,’#’,’*’ ou NONE.
    const val DVAL_MASK = 0X01
    const val KACK_MASK=0X01
    const val LEDS_MASK=0x1E// alterar o nome
    const val NONE = 0.toChar()
    private val values= charArrayOf('1','4', '7', '*' ,'2','5','8','0','3','6','9','#', NONE, NONE, NONE, NONE)

    // Inicia a classe
    fun init() {
        HAL.init()
        HAL.clrBits(KACK_MASK)
    }

    // Retorna de imediato a tecla premida ou NONE se não há tecla premida.
    fun getKey(): Char {// working
        if (HAL.isBit(DVAL_MASK)) {
            val value = HAL.readBits(LEDS_MASK).shr(1)

            HAL.setBits(KACK_MASK)// set bit
            while (HAL.isBit(DVAL_MASK)) {
            }
            HAL.clrBits(KACK_MASK) // o value é sempre 15
            return values[value]
        }
        return NONE
    }

    // Retorna a tecla premida, caso ocorra antes do ‘timeout’ (representado em milissegundos), ou NONE caso contrário.
    fun waitKey(timeout: Long): Char {// se eu emter 100000 por no maximo os 10 000 se encontrar uma tecla retorna imediatamente
        val StartTime = Time.getTimeInMillis()
        while (Time.getTimeInMillis() - StartTime < timeout) {
            val pressedKey = getKey()
            if (pressedKey != NONE) return pressedKey
        }
        return NONE
    }
}
fun main(){// carregar nas teclas
    HAL.init()
    KBD.init()
    /*
    while (true){
        val k= KBD.getKey()
        if (k!= NONE)
        println("$k")
    }
     */
    while (true) {
        println(waitKey(123440))
    }

}// hardcoded no tui e no aplications
