package graphCollections

operator fun  <I,D> MutableSet<Graph.Edge<I>>.contains(vertex: Graph.Vertex<I, D>):Boolean{
   for(v in this){
      if(v.adjacent == vertex.id) return true
   }
   return false
}
