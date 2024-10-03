package pt.isel.ls.db

import pt.isel.ls.domain.Game
import pt.isel.ls.domain.Player
import pt.isel.ls.domain.Session

interface DBFactory {
    fun createGame(name: String, developer: String, genres: Set<String>): Int
    fun getGameDetails(id: Int): Game?
    fun getGames(name: String, genres: Set<String>, developer: String): List<Game>
    fun createSession(numberOfPlayers: Int, date: String, state: String = "open", game: Game, players: List<Player>, ownerID: Int): Int
    fun deleteSession(id: Int)
    fun removePlayerFromSession(sid: Int, pid: Int)
    fun updateSession(id: Int, numberOfPlayers: Int, date: String)
    fun addPlayer(id: Int, player: Player)
    fun getDetails(id: Int): Session
    fun fetchSessions(gid: Int, date: String?, pid: Int?): List<Session>
    fun createPlayer(name: String, email: String, password: String): String
    fun getPlayerDetails(id: Int): Player
    fun searchPlayerByName(name: String): List<Player>
    fun getPlayerSessions(pid: Int): List<Session>
    fun loginPlayer(name: String, password: String): String
    fun getIdByToken(token: String): String
    fun authenticate(token: String): Boolean
}
