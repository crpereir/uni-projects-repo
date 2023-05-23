import KBD.waitKey
import isel.leic.utils.Time


object KBD { // Ler teclas. Métodos retornam ‘0’..’9’,’#’,’*’ ou NONE.
    const val DVAL_MASK = 0X01
    const val KACK_MASK=0X01
    const val LEDS_MASK=0x1E
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
            HAL.clrBits(KACK_MASK)
            return values[value]
        }
        return NONE
    }

    // Retorna a tecla premida, caso ocorra antes do ‘timeout’ (representado em milissegundos), ou NONE caso contrário.
    fun waitKey(timeout: Long): Char {
        val StartTime = Time.getTimeInMillis()
        while (Time.getTimeInMillis() - StartTime < timeout) {
            val pressedKey = getKey()
            if (pressedKey != NONE) return pressedKey
        }
        return NONE
    }
}
fun main(){
    while (true){
        val k= KBD.waitKey(10000)
        println(k)
    }
}
