package pt.isel.ls.encryption

import org.junit.Test
import pt.isel.ls.db.encryptPassword
import pt.isel.ls.db.verifyPassword

class EncryptionTests {

    @Test
    fun testEncryptPassword() {
        val password = "password"
        val encryptedPassword = encryptPassword(password)
        assert(verifyPassword(password, encryptedPassword))
    }

}