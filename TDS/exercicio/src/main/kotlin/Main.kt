
data class Node<T : Comparable<T>>(
    val elem: T,
    val left: BSTree<T> = EmptyTree(),
    val right: BSTree<T> = EmptyTree()
)

class EmptyTree<T : Comparable<T>> : BSTree<T> {
    override fun add(e: T): BSTree<T> {
        return NonEmptyTree(Node(e))
    }

    override operator fun contains(e: T): Boolean {
        return false
    }

    override val height: Int = 0

    override fun forEachByOrder(visitor: (T) -> Unit) {
        TODO("Not yet implemented")
    }

}

class NonEmptyTree<T : Comparable<T>>(val root: Node<T>) : BSTree<T> {
    override fun add(e: T): BSTree<T> {
        return when {
            e < root.elem -> NonEmptyTree(root.copy(left = root.left.add(e)))
            e > root.elem -> NonEmptyTree(root.copy(right = root.right.add(e)))
            else -> this
        }
    }

    override operator fun contains(e: T): Boolean {
        return when {
            e < root.elem -> root.left.contains(e)
            e > root.elem -> root.right.contains(e)
            else -> true
        }
    }

    override val height: Int = 1 + maxOf(root.left.height, root.right.height)

    override fun forEachByOrder(visitor: (T) -> Unit) {
        root.left.forEachByOrder(visitor)
        visitor(root.elem)
        root.right.forEachByOrder(visitor)
    }
}


fun <T : Comparable<T>> BSTree(): BSTree<T> {
    return EmptyTree()
}


fun <T : Comparable<T>> bsTreeOf(vararg elems: T): BSTree<T> {
    return elems.fold(BSTree()) { acc, e -> acc.add(e) }
}
