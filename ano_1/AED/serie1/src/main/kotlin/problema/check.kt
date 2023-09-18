package problema

fun main(){
    val read = createReader("src/main/kotlin/problema/output2.txt").readLines()
    var idx = 0
    while(idx < read.indices.last){
        if(read[idx] == read[idx+1]) {
            println("$idx:${idx+1} - Repeated ${read[idx]} - ${read[idx+1]}")
            break
        }
        if(read[idx+1] < read[idx]){
            println("$idx:${idx+1} - Out of order ${read[idx]} - ${read[idx+1]}")
            break
        }
        idx++
    }
    println("All good!")
}