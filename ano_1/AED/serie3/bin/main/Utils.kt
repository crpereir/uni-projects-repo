import java.io.BufferedReader
import java.io.FileReader
import java.io.PrintWriter

fun createReader(fileName: String): BufferedReader {
    return BufferedReader(FileReader(fileName))
}

fun createWriter(fileName: String): PrintWriter {
    return PrintWriter(fileName)
}

fun getPositiveInt(): Int?{
    var k: Int?
    while (true) {
        println("Introduza um número positivo k ou 0 se quiser terminar a aplicação")
        val input = readln()
        try {
            k = input.toInt()
            when{
                k > 0 -> return k
                k == 0 -> return null
                else -> {}
            }
        } catch (_: NumberFormatException) { }
    }
}