package serie2

class StreamMedian {
    private val list = mutableListOf<Int>()

    fun getMediana(): Int {
        return if (list.size % 2 == 0) {
            (list[list.size / 2] + list[list.size / 2 - 1]) / 2
        } else {
            list[list.size / 2]
        }
    }

    fun updateSet(i: Int) {
        list.add(i)
        if (list.size > 1) {
            mergeSort(list, 0, list.size - 1)
        }
    }

    private fun mergeSort(list: MutableList<Int>, left: Int, right: Int) {
        if (left < right) {
            val mid = (left + right) / 2
            mergeSort(list, left, mid)
            mergeSort(list, mid + 1, right)
            merge(list, left, mid, right)
        }
    }

    private fun merge(list: MutableList<Int>, left: Int, mid: Int, right: Int) {
        val sizeLeft = mid - left + 1
        val sizeRight = right - mid

        val leftArray = IntArray(sizeLeft)
        val rightArray = IntArray(sizeRight)

        for (i in 0 until sizeLeft) {
            leftArray[i] = list[left + i]
        }

        for (i in 0 until sizeRight) {
            rightArray[i] = list[mid + 1 + i]
        }

        var i = 0
        var j = 0
        var k = left

        while (i < sizeLeft && j < sizeRight) {
            if (leftArray[i] <= rightArray[j]) {
                list[k] = leftArray[i]
                i++
            } else {
                list[k] = rightArray[j]
                j++
            }
            k++
        }

        while (i < sizeLeft) {
            list[k] = leftArray[i]
            i++
            k++
        }

        while (j < sizeRight) {
            list[k] = rightArray[j]
            j++
            k++
        }
    }
}
