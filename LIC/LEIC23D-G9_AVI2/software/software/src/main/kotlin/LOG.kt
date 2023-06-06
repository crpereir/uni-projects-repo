

object LOG {
    class log (
            val data: String,
            val uid: Int

    )

    fun writeLog(file: String, lista: MutableList<log>) =
        FileAccess.writeLog(file, lista)
}