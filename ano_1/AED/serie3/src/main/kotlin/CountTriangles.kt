/*
import graphCollections.Graph
import graphCollections.GraphStructure
import java.io.BufferedReader
import java.io.FileReader
import java.io.PrintWriter


fun main(args: Array<String>){

    if (args.size < 2) {
        println("Usage: countingTrianglesKt <inputFile> <outputFile>")
        return
    }

    val inputFile = args[0]
    val outputFile = args[1]

    val reader = createReader("exemplo.txt")

    var k: Int?
    while (true) {
        println("Introduza um número positivo k ou 0 se quiser terminar a aplicação")
        val input = readLine()
        try {
            k = input?.toInt()
            if (k != null) break
        } catch (e: NumberFormatException) {
            //println("Introduza um número positivo k ou 0 se quiser terminar a aplicação")
        }
    }

    if (k != null) {
        readFile(reader, ",", 0, false, k, "listCounting.txt")
    }
}

fun createReader(fileName: String): BufferedReader {
    return BufferedReader(FileReader(fileName))
}

fun createWriter(fileName: String?): PrintWriter {
    return PrintWriter(fileName)
}


fun readFile(reader: BufferedReader, sep: String, start: Int, oriented: Boolean, k: Int, outputFile: String){
    val graph = GraphStructure<Int, MutableSet<MutableSet<Int>>>()
    var line: String?
    line = reader.readLine()
    repeat(start){
        line = reader.readLine()
    }
    while(line != null){
        var (src, dest) = line!!.split(sep).map{ it.toInt() }
        graph.addVertex(src, mutableSetOf<MutableSet<Int>>())
        graph.addVertex(dest, mutableSetOf<MutableSet<Int>>())
        if(oriented){
            graph.addEdge(src, dest)
        } else {
            graph.addEdge(src, dest)
            graph.addEdge(dest, src)
        }
        line = reader.readLine()
    }
    val iterator = graph.iterator()
    while(iterator.hasNext()){
        countTriangles(graph, iterator.next())
    }
    listCounting("listCounting.txt", graph)
    if (k > 0) {
        kCounting(createReader("listCounting.txt"), outputFile, graph, k)
    }
}

fun countTriangles(graph: GraphStructure<Int, MutableSet<MutableSet<Int>>>, vertex: Graph.Vertex<Int, MutableSet<MutableSet<Int>>>) {
    val history = mutableSetOf<Int>()
    history.add(vertex.id)
    if (history.size == graph.size) return

    when (vertex.getAdjacencies().size) {
        0 -> return
        1 -> {}
        else -> {

            val nextVertex = vertex.getAdjacencies()

            for (edge in nextVertex) {
                val vertexid = edge.adjacent
                val adjVertex = graph.getVertex(vertexid)
                val adjacencies = adjVertex?.getAdjacencies()

                if (adjacencies != null) {

                    for (adjEdge in adjacencies) {
                        if (nextVertex.find { it.adjacent == adjEdge.adjacent } != null) {
                            val sameAdjVertex = graph.getVertex(adjEdge.adjacent)

                            if (sameAdjVertex != null) {
                                addTriangle(vertex, adjVertex, sameAdjVertex)
                            }
                        }
                    }
                }
            }
        }
    }
}




fun addTriangle(
    a: Graph.Vertex<Int, MutableSet<MutableSet<Int>>>,
    b: Graph.Vertex<Int, MutableSet<MutableSet<Int>>>,
    c: Graph.Vertex<Int, MutableSet<MutableSet<Int>>>
){
    a.setData(
        a.data.also { a.data.add(mutableSetOf(b.id, c.id)) }
    )
    b.setData(
        b.data.also { b.data.add(mutableSetOf(a.id, c.id)) }
    )
    c.setData(
        c.data.also { c.data.add(mutableSetOf(a.id, b.id)) }
    )
}

fun listCounting(fileName: String, graph: GraphStructure<Int, MutableSet<MutableSet<Int>>>){
    val pw = createWriter(fileName)
    for(vertex in graph){
        pw.println("${vertex.id} -> ${vertex.data.size}")
    }
    pw.close()
}

fun kCounting(reader: BufferedReader, fileName: String, graph: GraphStructure<Int, MutableSet<MutableSet<Int>>>, k: Int){
    var line = reader.readLines()
    line = line.sortedWith(compareBy { it.last() }).take(k)
    val pw = createWriter(fileName)
    for(i in line){
        pw.println(i)
    }
    pw.close()
}
*/
