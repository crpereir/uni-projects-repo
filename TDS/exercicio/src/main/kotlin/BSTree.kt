

/**
 * Immutable and Unbalanced Binary Search Tree
 */
interface BSTree<T :Comparable<T>> {
    fun add(e: T): BSTree<T>
    operator fun contains(e: T): Boolean
    val height: Int
    fun forEachByOrder(visitor: (T)->Unit )
}