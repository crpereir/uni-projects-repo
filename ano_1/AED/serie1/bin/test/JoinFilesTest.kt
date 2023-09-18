import org.junit.jupiter.api.Test
import kotlin.test.assertEquals
import java.io.BufferedReader
import java.io.FileReader

class JoinFiles1Test {
    private var reader: BufferedReader = BufferedReader(FileReader("src/main/kotlin/problema/output1.txt"))
    private var nextReader: BufferedReader = BufferedReader(FileReader("src/main/kotlin/problema/output1.txt"))
    private var current: String?
    var next: String?

    init {
        nextReader.readLine()
        current = reader.readLine()
        next = nextReader.readLine()
    }

    operator fun String?.compareTo(other: String?) = when {
        this == null && other == null -> 0
        this == null -> -1
        other == null -> 1
        else -> this.compareTo(other)
    }

    private fun getNext(){
        current = reader.readLine()
        next = nextReader.readLine()
    }

    @Test
    fun checkDuplicates(){
        var duplicates = false
        while(next != null){
            if(current == next) {
                duplicates = true
                break
            }
            getNext()
        }
        assertEquals(false, duplicates)
    }

    @Test
    fun checkOrder(){
        var sorted = true
        while(next != null){
            if(current > next) {
                sorted = false
                break
            }
            getNext()
        }
        assertEquals(true, sorted)
    }
}