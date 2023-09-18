data class Point(var x:Int, var y:Int)

fun main(){
    val arr = Array<Int>(5){if(it == 2 || it == 3) 3 else it}
    val res = count(arr, 0, arr.indices.last, 3)
    print(res)
}
fun count(v: Array<Int>, l: Int, r: Int, element: Int): Int {
    if(l>r || v.size==0) return 0
    fun lowerBound(arr: Array<Int>, left: Int, right: Int, element: Int): Int{
        var r = right
        var l = left
        while(l <= r){
            val mid = (l+r)/2
            when{
                arr[mid] < element -> l = mid + 1
                else -> r = mid - 1
            }
        }
        return l
    }

    fun upperBound(arr: Array<Int>, left: Int, right: Int, element: Int): Int{
        var r = right
        var l = left
        while(l <= r){
            val mid = (l+r)/2
            when{
                arr[mid] > element -> r = mid - 1
                else -> l = mid + 1
            }
        }
        return r
    }
     val upperBound = upperBound(v, l, r, element)
    return (upperBound - lowerBound(v, l, r, element)) + 1
}



fun minAbsSum(ar:Array<Int>): Pair<Int, Int>? {
    fun absV(num: Int) = if(num < 0) -num else num
    val pair: Pair<Int, Int>
    when{
        ar.size < 2 -> return null
        ar[0] >= 0 -> pair = Pair(ar[0], ar[1])
        ar[ar.indices.last] <= 0 -> pair = Pair(ar[ar.indices.last-1], ar[ar.indices.last])
        else -> {
            var a = ar.indices.first
            var b = ar.indices.last
            var sum = absV(ar[a] + ar[b])
            while(a < b){
                sum = when{
                    absV(ar[a+1]+ar[b]) < sum && a+1 != b -> absV(ar[++a] + ar[b])
                    absV(ar[a]+ar[b-1]) < sum && b-1 != a -> absV(ar[a] + ar[--b])
                    else -> break
                }
            }
            pair = Pair(ar[a], ar[b])
        }
    }
    return if(pair.first != pair.second) pair else null
}

fun countSubKSequences(a: Array<Int>, k: Int): Int {
    var sum = 0
    var count = 0
    fun addCount(sum: Int, k: Int) = if(sum % k == 0) 1 else 0
    return when{
        k > a.size -> 0
        k==1 -> a.size
        else -> {
            for(i in 0 until k){
                sum += a[i]
            }
            count += addCount(sum, k)
            if(a.size == k) return count
            for(i in k..a.indices.last){
                sum -= a[i-k]
                sum += a[i]
                count += addCount(sum, k)
            }
            count
        }
    }
}

fun countEquals( points1: Array<Point>, points2: Array<Point>, cmp: (p1:Point, p2:Point )-> Int): Int {
    var a = 0
    var b = 0
    var eq = 0
    while(a < points1.size && b < points2.size){
        when{
            cmp(points1[a], points2[b]) < 0 -> a++
            cmp(points1[a], points2[b]) > 0 -> b++
            else -> {
                eq++
                a++
                b++
            }
        }
    }
    return eq
}
