fun main(){
    val k = getPositiveInt()
    k ?: return
    val writer = createWriter("exemplo${k}.txt")
    for(i in 1..k){
        for(j in i .. k){
            if(i == j) continue
            writer.println("$i,$j")
        }
    }
    writer.close()
}