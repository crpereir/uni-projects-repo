import kotlin.math.max

data class Node<E>(var item: E, var left:Node<E>?, var right:Node<E>?)

fun <E> contains(root: Node<E>?, min:E, max:E, cmp:(e1:E, e2:E)->Int): Boolean {
    root ?: return false
    if(cmp(root.item, min) >= 0 && cmp(root.item, max) <= 0) return true
    return if(root.left != null) contains(root.left, min, max, cmp)
     else if(root.right != null) contains(root.right, min, max, cmp)
    else false
}

fun <E> height(root: Node<E>?): Int =
    if (root == null)
        -1
    else
        1 + max(height(root.left),height(root.right))

fun <E> isBalanced(root: Node<E>?): Boolean {
    root ?: return true
    return if(height(root.left) - height(root.right) in -1..1){
        isBalanced(root.right)
        isBalanced(root.left)
    } else {
        false
    }
}

fun createBSTFromRange(start:Int, end:Int): Node<Int>? = when{
        end < start -> null
        end == start -> Node(start, null, null)
        else -> {
            val value = (start+end)/2
            val node = Node(value, null, null)
            node.left = createBSTFromRange(start, (value - 1))
            node.right = createBSTFromRange((value + 1), end)
            node
        }
    }

