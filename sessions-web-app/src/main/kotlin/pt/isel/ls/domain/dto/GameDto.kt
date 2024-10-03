package pt.isel.ls.domain.dto

import kotlinx.serialization.Serializable

@Serializable
data class GameDto(val id: Int, val name: String, val developer: String, val genres: Set<String>) {
    init {
        require(id > 0) { "Game id must be greater than 0" }
        require(name.isNotEmpty()) { "Game name must not be empty" }
        require(developer.isNotEmpty()) { "Game developer must not be empty" }
        require(genres.isNotEmpty()) { "Game genres must not be empty" }
    }
}
