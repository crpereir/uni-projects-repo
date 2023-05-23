import java.sql.Time

object DoorMechanism { // Controla o estado do mecanismo de abertura da porta.
    // Inicia a classe, estabelecendo os valores iniciais.
    fun init(){
        SerialEmitter.init()

    }
    // Envia comando para abrir a porta, com o parâmetro de velocidade
    fun open(velocity: Int){
        val speed=velocity.shl(1) or (1)
        SerialEmitter.send(SerialEmitter.Destination.DOOR,speed)
        /* if (HAL.isBit(SCLOSE)){
             SerialEmitter.send()
         }

         */


    }
    // Envia comando para fechar a porta, com o parâmetro de velocidade
    fun close(velocity: Int){
        val speed=velocity.shl(1)
        SerialEmitter.send(SerialEmitter.Destination.DOOR,speed)
    }

    // Verifica se o comando anterior está concluído
    // true se nao esta busy
    fun finished() : Boolean = !SerialEmitter.isBusy()


}

fun main(){
    DoorMechanism.init()
    //DoorMechanism.open(0x02)
    DoorMechanism.close(0x03)
    while (!DoorMechanism.finished()){// validar o busy, entra neste while qunado o busy esta true
        Thread.sleep(100)
        println("closing")
    }

}