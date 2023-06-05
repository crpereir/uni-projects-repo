
import java.io.BufferedReader
import java.io.FileReader
import java.io.PrintWriter
import kotlin.collections.HashSet

object FileAccess {
    fun createReader(fileName: String): BufferedReader =
            BufferedReader(FileReader(fileName))
    fun createWriter(fileName: String?): PrintWriter =
            PrintWriter(fileName)
// sabe que sao os 10 users
    fun read (file: String): HashSet<Users.User> {
        val br = createReader(file)
        var line: String?
        val list = HashSet<Users.User>()
        line = br.readLine()
        while (line != null) {
            val user = Users.User(line)
            list.add(user)
            line = br.readLine()
        }

        return list
    }


    fun write(file: String, mapa: HashMap<String, Users.User>) {
        val pw = createWriter(file)
        for (dados in mapa) {
            val writer = "${dados.value.id};${dados.value.password};${dados.value.name};${dados.value.mensagem}"
            pw.println(writer)
        }
        pw.close()
    }
    fun writeLog(file: String, mapa: MutableList<LOG.log>) {
        val pw = createWriter(file)
        for (log in mapa) {
            val writer = "${log.name},${log.uid},${log.data} "
            pw.println(writer)
        }
        pw.close()
    }
}