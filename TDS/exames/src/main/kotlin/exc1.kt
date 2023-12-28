fun log(prefix: String, message: String) { println("$prefix:$message") }
fun getLogger(prefix: String) = { msg: String -> log(prefix, msg) }
val mainLogger = getLogger("main")

fun main() {
    mainLogger("the_message")
}