package problema

import java.io.BufferedReader

class Word1(private val file: String) {
    var reader: BufferedReader
    var nextReader: BufferedReader
    var current: String?
    var next: String?

    init {
        reader = createReader(file)
        nextReader = createReader(file)
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

    fun repeated(){
        while(current == next && next != null){
            getNext()
        }
    }

}

class PriorityQueue(val heap: Array<Word1>, var size: Int) {
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

    private fun poll(): Word1? {
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

fun main(args: Array<String>){
    val pq1 = PriorityQueue(Array(args.lastIndex){ Word1(args[it + 1]) }, args.lastIndex)
    val writer = createWriter(args[0])
    while(pq1.size > 0){
        pq1.minHeapify(0)
        writer.println(pq1.peek())
        pq1.skip()
    }
    writer.close()
}