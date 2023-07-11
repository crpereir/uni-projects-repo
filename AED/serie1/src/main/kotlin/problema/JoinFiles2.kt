package problema

import java.io.BufferedReader
import kotlin.time.ExperimentalTime
import kotlin.time.measureTime

class Word2(private val file: String) {
    private var reader: BufferedReader = createReader(file)
    private var nextReader: BufferedReader = createReader(file)
    var current: String?
    var next: String?

    init {
        nextReader.readLine()
        current = reader.readLine()
        next = nextReader.readLine()
        repeated()
    }
    
    fun getNext(){
        current = reader.readLine()
        next = nextReader.readLine()
        repeated()
    }

    private fun repeated(){
        while(current == next && next != null){
            getNext()
        }
    }

}

class PriorityQueue2(private val heap: MutableList<Word2>, var size: Int) {
    operator fun String?.compareTo(other: String?) = when {
        this == null && other == null -> 0
        this == null -> -1
        other == null -> 1
        else -> this.compareTo(other)
    }

    // Returns the Word with the highest priority
    fun peek() = if(size == 0) null else heap[0].current

    fun minHeapify(i: Int){
        var smallest = i
        val l = left(i)
        val r = right(i)
        if (l < size && heap[l].current < heap[i].current) smallest = l
        if (r < size && heap[r].current < heap[smallest].current) smallest = r
        if (smallest != i) {
            exchange(i, smallest)
            minHeapify(smallest)
        }
    }

    fun skip(){
        for(wordIdx in 1 until size){
            if(heap[wordIdx].current == peek())
                if(heap[wordIdx].next == null) {
                    size--
                    exchange(wordIdx, size)
                    minHeapify(0)
                } else {
                    heap[wordIdx].getNext()
                }
        }
        if(heap[0].next == null) poll() else heap[0].getNext()
    }

    private fun poll(): Word2? {
        if(size == 0) return null
        val element = heap[0]
        size--
        exchange(0, size)
        minHeapify(0)
        return element
    }
    private fun exchange(first: Int, second: Int){
        val temp = heap[first]
        heap[first] = heap[second]
        heap[second] = temp
    }

    private fun parent(i: Int) = (i - 1) / 2

    private fun left(i: Int) = 2 * i + 1

    private fun right(i: Int) = 2 * i + 2
}

fun main2(args: Array<String>, size: Int){
    val pq2 = PriorityQueue2(MutableList(size){ Word2(args[it + 1]) }, size)
    val writer = createWriter(args[0])
    while(pq2.size > 0){
        pq2.minHeapify(0)
        writer.println(pq2.peek())
        pq2.skip()
    }
    writer.close()
}



@OptIn(ExperimentalTime::class)
fun main (args: Array<String>) {
    for (i in 1 until args.size ) {
        val e = measureTime { main2(args, i) }
        println("$i -> $e")
    }
}

