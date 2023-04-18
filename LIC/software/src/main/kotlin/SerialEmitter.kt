import isel.leic.utils.Time

object SerialEmitter { // Envia tramas para os diferentes módulos Serial Receiver.
    enum class Destination {LCD, DOOR}
    private const val SERIAL_DATA=0x02
    private const val SERIAL_SS=0X04
    private const val DOOR_SS=0X20
    private const val SERIAL_CLK=0x08
    private const val SERIAL_ACCEPT=0x10
    // Inicia a classe
    fun init() {
        HAL.init()
        HAL.setBits(SERIAL_SS)
        HAL.clrBits(SERIAL_CLK)

    }
    // a comunicação e com e com serial
// Envia uma trama para o SerialReceiver identificado o destino em addr e os bits de dados em ‘data’.
    fun send(addr: Destination, data: Int) {
        //adiciona o bit destino à frame
        var frame = data
        // var data = data
        if (addr==Destination.LCD) HAL.clrBits(SERIAL_SS) //clk = 0
        else HAL.clrBits(DOOR_SS)
        repeat(5){
            if (frame.and(1)  ==0) HAL.clrBits(SERIAL_DATA)
            else HAL.setBits(SERIAL_DATA)
            frame= frame.shr(1)
            // var myData =  SERIAL_DATA //rs,d0,d1,d2
            HAL.setBits(SERIAL_CLK)//1,2,3,4
            // Time.sleep(1)
            // myData = myData.shl(1)//d0,d1,d2,d3
            HAL.clrBits(SERIAL_CLK)
            //  Time.sleep(1)

        }
        if (addr==Destination.LCD)
            HAL.setBits(SERIAL_SS)
        else HAL.setBits(DOOR_SS)

    }
    // Retorna true se o canal série estiver ocupado
    fun isBusy(): Boolean =!HAL.isBit(SERIAL_ACCEPT)
}
fun main(){
    SerialEmitter.init()
    SerialEmitter.send(SerialEmitter.Destination.LCD,0x02   )
}