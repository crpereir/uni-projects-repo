interface I { fun f1() = 0 }
class A: I { override fun f1() = 1 }
object B: I { override fun f1() = 2 }
fun I.f2() = 'I'
fun A.f2() = 'A'
fun main() {
    val objs = listOf( A() , B )
    objs.forEach { print( it.f1() ) }
    objs.forEach { print( it.f2() ) }
}
