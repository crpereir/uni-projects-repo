package pt.isel.ls.domain

data class Player(val id: Int, val name: String, val email: String) {
    init {
        require(id > 0) { "Player id must be positive" }
        require(name.isNotBlank()) { "Player name must not be blank" }
        require(email.isNotBlank()) { "Player email must not be blank" }
        require(email.contains("@")) { "Player email must contain @" }
    }
}

data class PlayerPass(val token: String, val password: String) {
    init {
        require(token.isNotBlank()) { "Player token must not be blank" }
        require(password.isNotBlank()) { "Player password must not be blank" }
    }
}
