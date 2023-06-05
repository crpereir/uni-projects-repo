import java.io.FileOutputStream
import java.io.PrintWriter
import java.time.LocalDate
import java.time.LocalTime

object LOG {
    class log(
        val uid:Int,
        val name:String?,
        val data:String
    )


fun writeLog(file:String,lista:MutableList<log>){
    FileAccess.writeLog(file, lista)
}

}