package serie2

fun <E> removeAfterIntersectionPoint(list1: Node<E>, list2: Node<E>, cmp: Comparator<E>) {
    var l1 = list1.previous
    var l2 = list2.previous
    if(l1 == list1 || l2 == list2) return
    while(l1.previous != list1 && l2.previous != list2 && cmp.compare(l1.value, l2.value) == 0){
        remove(list1, l1.value, cmp)
        l1 = l1.previous
        l2 = l2.previous
    }
    if(cmp.compare(l1.value, l2.value) == 0) remove(list1, l1.value, cmp)
}
fun <E> remove(head: Node<E>, k: E, cmp:Comparator<E>) {
    var x = head.next
    while (x != head) {
        if (cmp.compare(k, x.value) == 0) {
            x.previous.next= x.next
            x.next.previous = x.previous
            break
        }
        else x = x.next
    }
}

fun <E> add(head: Node<E>, k: E) {
    val new = Node(k, head.previous, head)
    head.previous.next = new
    head.previous = new
}

fun <E> xor(list1: Node<E>, list2: Node<E>, cmp: Comparator<E>): Node<E> {
    val node: Node<E> = Node()
    var node1 = list1.next
    var node2 = list2.next
     when {
        node1 == list1 && node2 == list2 -> return node
        node1 == list1 -> return list2
        node2 == list2 -> return list1
        else -> {
            while (node1 != list1 && node2 != list2) {
                when {
                    cmp.compare(node1.value, node2.value) < 0 -> {
                        add(node, node1.value)
                        remove(list1, node1.value, cmp)
                        node1 = node1.next
                    }

                    cmp.compare(node1.value, node2.value) > 0 -> {
                        add(node, node2.value)
                        remove(list2, node2.value, cmp)
                        node2 = node2.next
                    }

                    else -> {
                        node1 = node1.next
                        node2 = node2.next
                    }
                }
            }
            if(node1 == list1){
                while(node2 != list2){
                    add(node, node2.value)
                    remove(list2, node2.value, cmp)
                    node2 = node2.next
                }
            } else {
                while(node1 != list1){
                    add(node, node1.value)
                    remove(list1, node1.value, cmp)
                    node1 = node1.next
                }
            }
            return node
        }

    }
}

class Node<E> {
    val value: E
    var previous: Node<E>
    var next: Node<E>

    constructor() {
        value = Any() as E
        previous = this
        next = this
    }

    constructor(data: E, p: Node<E>, n: Node<E>) {
        value = data
        previous = p
        next = n
    }
}





