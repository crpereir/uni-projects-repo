package pt.isel.ls.db

import pt.isel.ls.domain.Game
import pt.isel.ls.domain.Player
import pt.isel.ls.domain.PlayerPass
import pt.isel.ls.domain.Session
import java.util.UUID

class MockDB : DBFactory {

    val players: MutableList<Player> = mutableListOf(
        Player(1, "Carlos", "carlos@example.com"),
        Player(2, "testsearch", "testsearch@example.com"),
        Player(3, "testsearch2", "testsearch2@example.com")
    )

    val sessions: MutableList<Session> = mutableListOf(
        Session(0, 1, "2021-03-01", "open", Game(1, "The Witcher 3", "CD Projekt Red", setOf("RPG")), listOf(), 1),
        Session(5, 1, "2021-03-01", "open", Game(1, "The Witcher 3", "CD Projekt Red", setOf("RPG")), listOf(players[0]), 1)
    )
    val games: MutableList<Game> = mutableListOf(
        Game(1, "The Witcher 3", "CD Projekt Red", setOf("RPG")),
        Game(2, "The Last of Us", "Naughty Dog", setOf("Action", "Adventure")),
        Game(3, "Uncharted 4", "Naughty Dog", setOf("Action", "Adventure"))
    )

    val playerToken: MutableList<Pair<Player, String>> = mutableListOf(
        Pair(players[0], "player1_token"),
        Pair(players[1], "player2_token"),
        Pair(players[2], "player3_token")
    )
    val player_pass: MutableList<PlayerPass> = mutableListOf(
        PlayerPass("player1_token", encryptPassword("password")),
    )

    private var sessionID: Int = 1
    private var gameID: Int = 4
    override fun createGame(name: String, developer: String, genres: Set<String>): Int {
        val oldGameID = gameID
        games.add(Game(gameID, name, developer, genres))
        gameID++
        return oldGameID
    }

    override fun getGameDetails(id: Int): Game? {
        val game = games.find { it.id == id } ?: return null
        return Game(game.id, game.name, game.developer, game.genres)
    }

    override fun getGames(name: String, genres: Set<String>, developer: String): List<Game> {
        return if (genres.isEmpty() && developer.isEmpty()) {
            games.filter { it.name.contains(name) }
        } else if (genres.isEmpty() && developer.isNotEmpty()) {
            games.filter { it.developer == developer && it.name.contains(name) }
        } else if (developer.isEmpty() && genres.isNotEmpty()) {
            games.filter { it.genres.containsAll(genres) && it.name.contains(name) }
        } else {
            games.filter { it.genres.containsAll(genres) && it.developer == developer && it.name.contains(name) }
        }
    }

    override fun createSession(
        numberOfPlayers: Int,
        date: String,
        state: String,
        game: Game,
        players: List<Player>,
        ownerID: Int
    ): Int {
        val newSession = Session(sessionID, numberOfPlayers, date, state, game, players, ownerID)
        sessionID++
        sessions.add(newSession)
        return newSession.id
    }

    override fun deleteSession(id: Int) {
        sessions.remove(sessions.find { it.id == id } ?: throw IllegalArgumentException("Session not found"))
        sessionID--
        return
    }

    override fun removePlayerFromSession(sid: Int, pid: Int) {
        val session = sessions.find { it.id == sid } ?: throw IllegalArgumentException("Session not found")
        val player = session.players.find { it.id == pid } ?: throw IllegalArgumentException("Player not found")
        val newSession = session.copy(players = session.players - player)
        sessions.remove(session)
        sessions.add(newSession)
    }

    override fun updateSession(id: Int, numberOfPlayers: Int, date: String) {
        val session = sessions.find { it.id == id } ?: throw IllegalArgumentException("Session not found")
        val newSession = session.copy(numberOfPlayers = numberOfPlayers, date = date)
        sessions.remove(session)
        sessions.add(newSession)
    }

    override fun addPlayer(id: Int, player: Player) {
        val session = sessions.find { it.id == id } ?: throw IllegalArgumentException("Session not found")
        val newSession = session.copy(players = session.players + player)
        sessions.remove(session)
        sessions.add(newSession)
    }

    override fun getDetails(id: Int): Session {
        val session = sessions.find { it.id == id } ?: throw IllegalArgumentException("Session not found")
        return Session(
            id,
            session.numberOfPlayers,
            session.date,
            session.state,
            Game(session.game.id, session.game.name, session.game.developer, session.game.genres),
            session.players.map { Player(it.id, it.name, it.email) },
            session.ownerID
        )
    }

    override fun fetchSessions(gid: Int, date: String?, pid: Int?): List<Session> {
        val byGame = sessions.filter { it.game.id == gid }
        val byDate = date?.let { byGame.filter { it.date == date } } ?: byGame
        val byPlayer = pid?.let { byDate.filter { it.players.any { it.id == pid } } } ?: byDate
        return byPlayer.map { session ->
            Session(
                session.id,
                session.numberOfPlayers,
                session.date,
                session.state,
                Game(session.game.id, session.game.name, session.game.developer, session.game.genres),
                session.players.map { Player(it.id, it.name, it.email) },
                session.ownerID
            )
        }
    }

    override fun createPlayer(name: String, email: String, password: String): String {
        val passwordHashed = encryptPassword(password)
        if (players.any { it.name == name && it.email == email }) {
            throw IllegalArgumentException("Player with the same name and email already exists")
        }

        val player = Player(players.size + 1, name, email)
        val token = UUID.randomUUID().toString()
        val playerPass = PlayerPass(token, passwordHashed)
        players.add(player)
        player_pass.add(playerPass)
        return token
    }

    override fun getPlayerDetails(id: Int): Player {
        val player = players.find { it.id == id } ?: throw IllegalArgumentException("Player not found")
        return Player(player.id, player.name, player.email)
    }

    override fun getPlayerSessions(pid: Int): List<Session> {
        return sessions.filter { it.players.any { it.id == pid } }.map { session ->
            Session(
                session.id,
                session.numberOfPlayers,
                session.date,
                session.state,
                Game(session.game.id, session.game.name, session.game.developer, session.game.genres),
                session.players.map { Player(it.id, it.name, it.email) },
                session.ownerID
            )
        }
    }

    override fun loginPlayer(name: String, password: String): String {
        val playerToken =
            playerToken.find { it.first.name == name } ?: throw IllegalArgumentException("Player not found")
        val playerPass =
            player_pass.find { it.token == playerToken.second } ?: throw IllegalArgumentException("Player not found")
        if (verifyPassword(password, playerPass.password)) {
            return playerPass.token
        }
        throw IllegalArgumentException("Invalid password")
    }

    override fun getIdByToken(token: String): String {
        return playerToken.find { it.second == token }?.first?.id?.toString() ?: ""
    }

    override fun searchPlayerByName(name: String): List<Player> {
        return players.filter { it.name.contains(name) }
    }

    override fun authenticate(token: String): Boolean {
        return playerToken.any { it.second == token }
    }
}
