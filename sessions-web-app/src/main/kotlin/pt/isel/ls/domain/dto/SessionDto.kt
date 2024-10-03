package pt.isel.ls.domain.dto

import kotlinx.serialization.Serializable
@Serializable
data class SessionDto(val id: Int, val numberOfPlayers: Int, val date: String, val state: String, val game: GameDto, val players: List<PlayerDto>, val owner: Int) {
    init {
        require(id > 0) { "Game id must be greater than 0" }
        require(numberOfPlayers > 0) { "Number of players must be greater than 0" }
        require(date.matches(Regex("\\d{4}-\\d{2}-\\d{2}"))) { "Date must be in the format YYYY-MM-DD" }
        require(players.size <= numberOfPlayers) { "Number of players must be greater than or equal to the number of players" }
        require(players.distinctBy { it.email }.size == players.size) { "Players must have unique emails" }
    }
}
