import isel.leic.UsbPort


object HAL { // Virtualiza o acesso ao sistema UsbPort
    var state = 0

    // Inicia a classe
    fun init() {
        UsbPort.write(state)
    }


    // Retorna true se o bit tiver o valor lógico ‘1’
    fun isBit(mask: Int): Boolean =
        readBits(mask) == mask


    // Retorna os valores dos bits representados por mask presentes no UsbPort
    fun readBits(mask: Int): Int = mask and UsbPort.read()


    // Escreve nos bits representados por mask o valor de value
    fun writeBits(mask: Int, value: Int) {
        val valueUnderMask = mask and value  // para ter o valor(led ligado) do value na gama dos valores da mask
        val outMaskOn = mask.inv() and state // o state é tudo que tenho no outport (10001001, IMAGEM DO SLIDE)
                                             // o inv é o inverso, é para termos acesso a todos os valores fora da mascara
        val result = valueUnderMask or outMaskOn // temos todos os valores ligados
        UsbPort.write(result) // aqui tou a escrever o outport, da a cor aos led's
        state = result // guardar o estado
    }

    /**
     * Na função writeBits se nós tivermos uma mask = 0101 e um value = 1111 queremos obter apenas o valor da mask
     * logo atualizamos o state para o valor 0101 porque é o resultado da operação mask and value, e no fim
     * escrevemos no UsbPort o valor do state
     */


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


