import isel.leic.UsbPort

object HAL { // Virtualiza o acesso ao sistema UsbPort// o hall os sabe os sinais ativos
    // Inicia a classe
    var state = 0

    fun init() {
        UsbPort.write(state)
    }

    // Retorna true se o bit tiver o valor lógico ‘1’
    // fun isBit(mask: Int): Boolean = readBits(mask) == mask
    fun isBit(mask: Int): Boolean = mask and UsbPort.read()==mask// ver o d mask

    // Retorna os valores dos bits representados por mask presentes no UsbPort
    fun readBits(mask: Int): Int = mask and UsbPort.read()

    // Escreve nos bits representados por mask o valor de value
    fun writeBits(mask: Int, value: Int) {
        val valueUnderMask = mask and value// para ter o valor(led ligado) do value na gama dos valores da mask
        val outMaskOn = mask.inv() and state //o state é tudo que tenho no outport (10001001, IMAGEM DO SLIDE)
        // o inv é o inverso, é para termos acesso a todos os valores fora da mascara
        val result = valueUnderMask or outMaskOn // temos todos os valores ligados
        UsbPort.write(result)// aqui tou a escrever o outport, da a cor aos led's
        state = result // guardar o estado
    } // apagar os bits que estavam escritos e...

    // Coloca os bits representados por mask no valor lógico ‘1’
    fun setBits(mask: Int) {
        state = state or mask
        UsbPort.write(state)
    }

    // Coloca os bits representados por mask no valor lógico ‘0’
    fun clrBits(mask: Int) {
        state = state and mask.inv()
        UsbPort.write(state)
    }
}

fun main(){


    while(true) {
        val x = HAL.isBit(0x09)
        if (x) println("hey")
    }




}
// kbd, utiliza as funcoes para manipular os bits
// o set, get ckear
// olhar para o decode no inicio do sistema, epseamos o sinal de entrada antes de inciar