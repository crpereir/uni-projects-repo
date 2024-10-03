package pt.isel.ls.db
import com.toxicbakery.bcrypt.Bcrypt
import java.nio.charset.Charset

fun encryptPassword(password: String): String {
    val hash = Bcrypt.hash(password, 13)
    return String(hash, Charset.defaultCharset())
}

fun verifyPassword(password: String, hash: String): Boolean {
    val bytes = hash.toByteArray(Charset.defaultCharset())
    return Bcrypt.verify(password, bytes)
}
