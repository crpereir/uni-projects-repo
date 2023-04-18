import isel.leic.utils.Time

// fazer um while com chamadas consecutivas?



//


object KBD { // Ler teclas. Métodos retornam ‘0’..’9’,’#’,’*’ ou NONE.
    const val DVAL_MASK = 0X01
    const val KACK_MASK=0X01
    const val LEDS_MASK=0x1E
    const val NONE = 0.toChar()
    private val values= charArrayOf('1','4', '7', '*' ,'2','5','8','0','3','6','9','#', NONE, NONE, NONE, NONE)

    // criar as mascaras como constantes
    // Inicia a classe
    // se o k val nao ativar o k 0-3 nao tem significado
    fun init() {
        HAL.init()// para conseguirmos ter acesso as funcoes do hal
        HAL.clrBits(KACK_MASK) // precisamos do ack a 0 para nao porque poderia ahaver o caso de haver k press mas nao detetar porque o val está o 0
    }

    // Retorna de imediato a tecla premida ou NONE se não há tecla premida.
    // e por quem quer fazer a leitrua da tecla5555555222222222222222222222222222222222222222222222222
    fun getKey(): Char {// working
        if (HAL.isBit(DVAL_MASK)) {
            val value = HAL.readBits(LEDS_MASK).shr(1)

            HAL.setBits(KACK_MASK)// set bit
            while (HAL.isBit(DVAL_MASK)) {

            }

            HAL.clrBits(KACK_MASK)
            return values[value]// parece que todos os valores estao a 1 e faz com que o k val esteja a 1
        }
        return NONE.toChar()

    }

    //completar

    // Retorna a tecla premida, caso ocorra antes do ‘timeout’ (representado em milissegundos), ou NONE caso contrário.
    fun waitKey(timeout: Long): Char {
        val StartTime = Time.getTimeInMillis()// tempo inicial, quando comeaca a funcao
        while (Time.getTimeInMillis() - StartTime < timeout) {
            val pressedKey = getKey()
            if (pressedKey != NONE.toChar()) return pressedKey
        }
        return NONE.toChar()
    }

}
fun main(){
    Thread.sleep(5000)// para dar tempo de qundo abrir a janela e definir

    while(true){

    }


    /*
    while (true){ // so parace none quando meto o 0 no bit dval
        val k= waitKey(10000)
        println(k)
    }
     */



}