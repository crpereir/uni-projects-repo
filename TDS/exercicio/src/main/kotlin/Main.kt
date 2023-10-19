
//Represents a node in a binary search tree.
data class Node<T : Comparable<T>>(
    val elem: T,
    val left: BSTree<T> = EmptyTree(),
    val right: BSTree<T> = EmptyTree()
)

fun <T : Comparable<T>> BSTree(): BSTree<T> {
    return EmptyTree()
}

// Creates a binary search tree from a list of elements.
fun <T : Comparable<T>> bsTreeOf(vararg elems: T): BSTree<T> {
    return elems.fold(BSTree()) { acc, e -> acc.add(e) }
}

// Defines an empty tree.
class EmptyTree<T : Comparable<T>> : BSTree<T> {

    // Adds an element to the empty tree.
    override fun add(e: T): BSTree<T> {
        return NotAnEmptyTree(Node(e))
    }

    // Verifies if an element is contained in the empty tree.
    override operator fun contains(e: T): Boolean {
        return false
    }

    // Defines the height of the empty tree as 0.
    override val height: Int = 0

    // Implements the function that iterates over the elements in the tree in order.
    override fun forEachByOrder(visitor: (T) -> Unit) {
        return Unit
    }
}

// Defines a non-empty tree.
class NotAnEmptyTree<T : Comparable<T>>(val root: Node<T>) : BSTree<T> {
    // Adds an element to the non-empty tree.
    override fun add(e: T): BSTree<T> {
        return when {
            e < root.elem -> NotAnEmptyTree(root.copy(left = root.left.add(e)))
            e > root.elem -> NotAnEmptyTree(root.copy(right = root.right.add(e)))
            else -> this
        }
    }

    // Verifies if an element is contained in the non-empty tree.
    override operator fun contains(element: T): Boolean {
        return when {
            element < root.elem -> root.left.contains(element)
            element > root.elem -> root.right.contains(element)
            else -> true
        }
    }

    // Calculates the height of the non-empty tree.
    override val height: Int = 1 + maxOf(root.left.height, root.right.height)

    // Iterates over the elements in the tree in order.
    override fun forEachByOrder(visitor: (T) -> Unit) {
        root.left.forEachByOrder(visitor)
        visitor(root.elem)
        root.right.forEachByOrder(visitor)
    }
}
