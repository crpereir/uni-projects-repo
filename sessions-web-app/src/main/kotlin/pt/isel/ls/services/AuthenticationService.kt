package pt.isel.ls.services

import pt.isel.ls.db.DBFactory

class AuthenticationService(val db: DBFactory) {
    fun authenticate(token: String): Boolean {
        return db.authenticate(token)
    }
}
