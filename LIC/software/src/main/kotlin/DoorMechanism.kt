
object DoorMechanism {
    // Controla o estado do mecanismo de abertura da porta.
    // Inicia a classe, estabelecendo os valores iniciais.
    fun init(){
        SerialEmitter.init()

    }
    // Envia comando para abrir a porta, com o parâmetro de velocidade
    fun open(velocity: Int){
        val velocity = velocity.shl(1) or 1
        SerialEmitter.send(SerialEmitter.Destination.DOOR,velocity)

    }
    // Envia comando para fechar a porta, com o parâmetro de velocidade
    fun close(velocity: Int){
        val velocity = velocity.shl(1)
        SerialEmitter.send(SerialEmitter.Destination.DOOR,velocity)
    }

    // Verifica se o comando anterior está concluído
    fun finished() : Boolean{
        return (!(SerialEmitter.isBusy()))
    }

}