import isel.leic.UsbPort

object HAL { // Virtualiza o acesso ao sistema UsbPort

    var state = 0

    fun init() {
        UsbPort.write(state)
    }

    // Retorna true se o bit tiver o valor lógico ‘1’

    fun isBit(mask: Int): Boolean = mask and UsbPort.read()==mask// ver o d mask

    // Retorna os valores dos bits representados por mask presentes no UsbPort
    fun readBits(mask: Int): Int = mask and UsbPort.read()

    // Escreve nos bits representados por mask o valor de value
    fun writeBits(mask: Int, value: Int) {
        val valueUnderMask = mask and value
        val outMaskOn = mask.inv() and state
        val result = valueUnderMask or outMaskOn
        UsbPort.write(result)
        state = result
    }

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

