import graphCollections.Graph
import graphCollections.GraphStructure
import java.io.BufferedReader
import kotlin.time.ExperimentalTime
import kotlin.time.measureTime

enum class Color {GREEN, YELLOW, RED}

@OptIn(ExperimentalTime::class)
fun main(args: Array<String>){
    val e = measureTime { run(args) }
    print("Execution Time -> $e")
}

fun run(args: Array<String>){
    if (args.size < 2) {
        println(
            "Usage: countingTrianglesKt <inputFile> <outputFile>"
        )
        return
    }

    val reader = createReader(args[0])
    //val k = getPositiveInt()
    //k ?: return
    readFile(reader, args[1], " ", 0, true, 1)
    // TODO: Handle exception
}

fun readFile(reader: BufferedReader, outputFile: String, sep: String, start: Int, oriented: Boolean, k: Int){
    val graph = GraphStructure<Int, Color>()
    var line: String?
    line = reader.readLine()
    repeat(start){
        line = reader.readLine()
    }
    while(line != null){
        val (src, dest) = line!!.split(sep).map{ it.toInt() }
        graph.addVertex(src, Color.GREEN)
        graph.addVertex(dest, Color.GREEN)
        if(oriented){
            graph.addEdge(src, dest)
        } else {
            graph.addEdge(src, dest)
            graph.addEdge(dest, src)
        }
        line = reader.readLine()
    }
    val arr = IntArray(graph.size)
    for(vertex in graph){
        countTriangles(graph, arr, vertex)
    }
    listCounting(outputFile, arr)
    kCounting(createReader(outputFile), "kCounting.txt", k)
    println("Número total de triângulos -> ${arr.reduce { acc, i -> acc + i } / 3}")
    println("----")
    println("${(graph.size * (graph.size-1) * (graph.size - 2)) / 6}")
    println("----")
}


fun countTriangles(graph: GraphStructure<Int, Color>, arr: IntArray, vertex: Graph.Vertex<Int, Color>){
    val adjacencies = getAdjVertices(graph, vertex)
    if(adjacencies.size <= 1){
        vertex.setData(Color.RED)
        return
    }
    vertex.setData(Color.YELLOW)
    for(v in getAdjVertices(graph, vertex)){
        val commonVertices = getAdjVertices(graph, vertex) intersect getAdjVertices(graph, v).toSet()
        arr[vertex.id] += commonVertices.size
        arr[v.id] += commonVertices.size
        for(i in commonVertices){
            arr[i.id]++
        }
    }
    vertex.setData(Color.RED)
}

fun getAdjVertices(graph: GraphStructure<Int, Color>, vertex: Graph.Vertex<Int, Color>): MutableList<Graph.Vertex<Int, Color>> {
    val adjVertices = mutableListOf<Graph.Vertex<Int, Color>>()
    for (edge in vertex.getAdjacencies()){
        val adjVertex = graph.getVertex(edge.adjacent)
        if (adjVertex!!.data == Color.GREEN) adjVertices.add(adjVertex)
    }
    return adjVertices
}

fun listCounting(fileName: String, arr: IntArray){
    val pw = createWriter(fileName)
    for(idx in arr.indices){
        arr[idx] /= 2
        pw.println("${idx+1} -> ${arr[idx]}")
    }
    pw.close()
}

fun kCounting(reader: BufferedReader, fileName: String, k: Int){
    var lines = reader.readLines()
    lines = lines.sortedWith(compareByDescending { it.last() }).take(k)
    val pw = createWriter(fileName)
    for(line in lines){
        pw.println(line)
    }
    pw.close()
}
