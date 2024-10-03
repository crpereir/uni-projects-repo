package pt.isel.ls.domain.dto

import kotlinx.serialization.Serializable

@Serializable
data class PlayerDto(val id: Int, val name: String, val email: String) {
    init {
        require(id > 0) { "Game id must be greater than 0" }
        require(name.isNotBlank()) { "Player name must not be blank" }
        require(email.isNotBlank()) { "Player email must not be blank" }
        require(email.contains("@")) { "Player email must contain @" }
    }
}
