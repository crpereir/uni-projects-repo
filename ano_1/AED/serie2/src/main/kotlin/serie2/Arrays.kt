package serie2


import java.util.PriorityQueue

fun median(v: IntArray, l: Int, r: Int): Int {
    val queue = PriorityQueue<Int>()
    for (i in l..r) {
        queue.offer(v[i])
    }
    val idx = (queue.size - 1) / 2
    for (i in 0 until idx) {
        queue.poll()
    }
    return if (queue.size % 2 == 0) {
        (queue.poll() + queue.poll()) / 2
    } else {
        queue.poll()
    }
}

