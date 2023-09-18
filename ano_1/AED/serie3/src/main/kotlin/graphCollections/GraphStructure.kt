package graphCollections

class GraphStructure<I, D>: Graph<I, D> {

    private val graphMap: MutableMap<I, Graph.Vertex<I, D>> = mutableMapOf()
    private val edgeMap: MutableMap<I, MutableSet<Graph.Edge<I>>> = mutableMapOf()

    override var size: Int = graphMap.size
    private set

    override fun getEdge(id: I, idAdj: I): Graph.Edge<I>? =
        edgeMap[id]?.find{ it.id == id && it.adjacent == idAdj }


    override fun getVertex(id: I): Graph.Vertex<I, D>? {
        graphMap[id] ?: return null
        return graphMap[id]
    }

    override fun addEdge(id: I, idAdj: I): I? {
        edgeMap[id] ?: return null
        edgeMap[id]?.add(Edge(id, idAdj))
        return idAdj
    }

    private inner class Edge(
        override val id: I,
        override val adjacent: I
    ): Graph.Edge<I>

    private inner class Vertex(override val id: I, d: D) : Graph.Vertex<I, D>{

        override var data: D = d
        private set
        override fun setData(newData: D): D {
            data = newData
            return newData
        }

        override fun getAdjacencies(): MutableSet<Graph.Edge<I>> {
            return edgeMap[id] ?: mutableSetOf()
        }
    }
    override fun addVertex(id: I, d: D): D? =
        if (graphMap[id] == null){
            graphMap[id] = Vertex(id, d)
            edgeMap[id] = mutableSetOf()
            size++
            d
        } else {
            null
        }


    override fun iterator(): Iterator<Graph.Vertex<I, D>> = graphMap.values.iterator()

}