package serie2

import kotlin.time.ExperimentalTime
import kotlin.time.measureTime
import serie2.mapCollections.AEDHashMapAED
import java.io.PrintWriter

fun generateAnagramHash(word: String): Long? {
    val primes = mapOf(
        'a' to 2, 'b' to 3, 'c' to 5, 'd' to 7, 'e' to 11, 'f' to 13, 'g' to 17, 'h' to 19,
        'i' to 23, 'j' to 29, 'k' to 31, 'l' to 37, 'm' to 41, 'n' to 43, 'o' to 47, 'p' to 53,
        'q' to 59, 'r' to 61, 's' to 67, 't' to 71, 'u' to 73, 'v' to 79, 'w' to 83, 'x' to 89,
        'y' to 97, 'z' to 101
    )
    var hashCode = 1L
    for (char in word) {
        val charLower = char.lowercaseChar()
        if (charLower in primes) {
            hashCode *= primes[charLower]!!.toLong()
        }
    }
    return if(hashCode != 1L) hashCode else null
}

fun writeTableToFile(map: AEDHashMapAED<Long, HashSet<String>>, writer: PrintWriter){
    val it = map.iterator()
    while (it.hasNext()) {
        writer.println(it.next().value)
    }
    writer.close()
}

@OptIn(ExperimentalTime::class)
fun main (args: Array<String>) =
    println("Time of execution -> ${measureTime { groupingWords(args) }}")


fun groupingWords(args: Array<String>){
    val reader = createReader(args[1])
    val writer = createWriter(args[0])
    val map = AEDHashMapAED<Long, HashSet<String>>()
    var line: String? = reader.readLine()
    while (line != null){
        val words = line.split(Regex("\\P{L}+"))
        for (e in words){
            val word = e.lowercase()
            val anagramHash = generateAnagramHash(word)
            if(anagramHash != null){
                if(map.containsKey(anagramHash)){
                    map[anagramHash]!!.add(word)
                    continue
                }
                map.put(anagramHash, hashSetOf(word))
            }
        }
        line = reader.readLine()
    }
    writeTableToFile(map, writer)
}