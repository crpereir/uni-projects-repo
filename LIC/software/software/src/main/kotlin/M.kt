
object M {
    val signal = 0x40
    fun manutencao(): Boolean =
            HAL.isBit(signal)

}
