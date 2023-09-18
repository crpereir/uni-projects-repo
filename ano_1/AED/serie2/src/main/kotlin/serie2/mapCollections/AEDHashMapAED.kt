package serie2.mapCollections

class AEDHashMapAED<K, V>() : AEDMutableMap<K, V> {
    override var size: Int = 0
        private set

    private class Node<K, V>(k: K, v: V): AEDMutableMap.MutableEntry<K, V> {
        override var value: V = v
        override var key = k
        var next: Node<K, V>? = null

        override fun setValue(newValue: V): V {
            value = newValue
            return value
        }

    }

    private var table: Array<Node<K, V>?> = arrayOfNulls<Node<K, V>?>(10)
    private var dimTable = table.size


    private fun hash(k: K): Int {
        var idx = (k.hashCode() % dimTable)
        if(idx < 0) idx += dimTable
        return idx
    }

    private fun expand(factor: Int = 2) {
        dimTable *= factor
        val newTable = arrayOfNulls<Node<K, V>?>(dimTable)
        for (node in table) {
            var x = node
            while (x != null) {
                val idx = hash(x.key) % dimTable
                val next = x.next
                x.next = newTable[idx]
                newTable[idx] = x
                x = next
            }
        }
        table = newTable
    }



    override fun put(key: K, value: V): V? {
        val idx = hash(key)
        if(size.toDouble() / dimTable >= 0.75) expand()
        if(table[idx] == null){
            table[idx] = Node(key, value)
            size++
        } else {
            var x = table[idx]
            while(x != null){
                if(x.key == key) {
                    val temp = x.value
                    x.value = value
                    return temp
                }
                if(x.next == null) {
                    x.next = Node(key, value)
                    break
                }
                x = x.next
            }
        }
        return null
    }

    override fun remove(key: K) {
        val idx = hash(key)
        var x = table[idx]
        while(x != null){
            if(x.next?.key == key){
                x.next = x.next?.next
                break
            }
            x = x.next
        }
    }

    override operator fun get(key: K): V? {
        val idx = hash(key)
        table[idx]?: return null
        var x = table[idx]
        while (x != null){
            if(x.key == key) return x.value
            x = x.next
        }
        return null
    }


    override fun iterator(): Iterator<AEDMutableMap.MutableEntry<K, V>> {
        return MyIterator()
    }

    private inner class MyIterator: Iterator<AEDMutableMap.MutableEntry<K, V>>{
        var currentPos = -1
        var nodeIt: Node<K, V>? = null
        var currentElement: Node<K, V>? = null

         override fun hasNext(): Boolean {
            if(currentElement != null) return true
            while(currentPos < table.size){
                if(nodeIt == null){
                    currentPos++
                    if(currentPos < table.size) nodeIt = table[currentPos]
                }
                else{
                    currentElement = nodeIt
                    nodeIt = nodeIt!!.next
                    return true
                }
            }
            return false
        }

        override fun next(): AEDMutableMap.MutableEntry<K, V> {
            if(!hasNext()) throw NoSuchElementException()
            val aux = currentElement
            currentElement = null
            return aux!!
        }
    }
    override fun containsKey(k: K):Boolean {
        val idx = hash(k)
        var x = table[idx]
        x?: return false
        while(x != null){
            if(x.key == k) return true
            x = x.next
        }
        return false
    }

}



