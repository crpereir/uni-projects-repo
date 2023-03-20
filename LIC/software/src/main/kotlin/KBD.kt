import isel.leic.UsbPort
import isel.leic.utils.Time


object KBD { // Ler teclas. Métodos retornam ‘0’..’9’,’#’,’*’ ou NONE.
    const val NONE = 0;
    // Inicia a classe
    fun init() {
        HAL.init()
    }


    // Retorna de imediato a tecla premida ou NONE se não há tecla premida.
    fun getKey(): Char {
        if (HAL.isBit()){
            return NONE.toChar()
        }
        //completar
    }


// Retorna a tecla premida, caso ocorra antes do ‘timeout’ (representado em milissegundos), ou NONE caso contrário.
    fun waitKey(timeout: Long): Char {
        val StartTime = Time.getTimeInMillis()// tempo inicial, quando comeaca a funcao
        while (Time.getTimeInMillis() - StartTime < timeout){
            val pressedKey = getKey()
            if (pressedKey != NONE.toChar()) return pressedKey
        }
        return NONE.toChar()
    }
}