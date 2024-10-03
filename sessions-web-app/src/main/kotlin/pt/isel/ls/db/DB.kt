package pt.isel.ls.db

import org.postgresql.ds.PGSimpleDataSource
import org.postgresql.util.PSQLException
import pt.isel.ls.domain.Game
import pt.isel.ls.domain.Player
import pt.isel.ls.domain.Session
import java.sql.PreparedStatement
import java.sql.ResultSet
import java.sql.SQLException
import java.sql.Statement.RETURN_GENERATED_KEYS
import java.text.SimpleDateFormat
import java.util.UUID

class DB : DBFactory {

    override fun createGame(name: String, developer: String, genres: Set<String>): Int {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        var gameID = 0

        dataSource.setURL(jdbcDatabaseURL)
        try {
            dataSource.connection.use {
                val stm = it.prepareStatement(
                    "insert into game(name,developer) values(?,?) returning id"
                )
                stm.setString(1, name)
                stm.setString(2, developer)
                val rs = stm.executeQuery()
                if (rs.next()) {
                    gameID = rs.getInt("id")
                }

                val genreStm = it.prepareStatement(
                    "insert into game_genre(id,genre) values(?,?)"
                )
                for (genre in genres) {
                    genreStm.setInt(1, gameID)
                    genreStm.setString(2, genre)
                    genreStm.executeUpdate()
                }
            }
        } catch (e: PSQLException) {
            val message = e.serverErrorMessage?.message
            throw IllegalArgumentException(message ?: "")
        } catch (e: SQLException) {
            throw IllegalArgumentException("Game already exists")
        }

        return gameID
    }

    override fun getGameDetails(id: Int): Game? {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        var name = ""
        var developer = ""
        var finalId = 0

        dataSource.setURL(jdbcDatabaseURL)
        try {
            dataSource.connection.use {
                val stm = it.prepareStatement(
                    "select game.id, game.name, game.developer, game_genre.genre as genre from game " +
                        "join game_genre on game.id = game_genre.id " +
                        "where game.id = ?"
                )
                stm.setInt(1, id)

                val rs = stm.executeQuery()
                val genres = mutableSetOf<String>()
                while (rs.next()) {
                    finalId = rs.getInt("id")
                    name = rs.getString("name")
                    developer = rs.getString("developer")
                    genres.add(rs.getString("genre"))
                }
                if (name.isEmpty() || developer.isEmpty() || genres.isEmpty()) {
                    return null
                }
                return Game(
                    finalId,
                    name,
                    developer,
                    genres
                )
            }
        } catch (e: SQLException) {
            throw IllegalArgumentException("Game not found")
        }
    }

    override fun getGames(name: String, genres: Set<String>, developer: String): List<Game> {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        val filteredGames: List<Game>

        dataSource.setURL(jdbcDatabaseURL)
        try {
            dataSource.connection.use {
                val gameStm: PreparedStatement
                // If they are both empty
                if (genres.isEmpty() && developer == "") {
                    gameStm = it.prepareStatement(
                        "select g.id, g.name, g.developer, ARRAY_AGG(gg.genre) as genres " +
                            "from game g " +
                            "join game_genre gg on gg.id = g.id " +
                            "group by g.id, g.name, g.developer " +
                            "order by g.name asc"
                    )
                }
                // If only genre is empty
                else if (genres.isEmpty()) {
                    gameStm = it.prepareStatement(
                        "select g.id, g.name, g.developer, ARRAY_AGG(gg.genre) as genres " +
                            "from game g " +
                            "join game_genre gg on g.id = gg.id " +
                            "where g.developer = ? " +
                            "group by g.id, g.name, g.developer " +
                            "order by g.name asc"

                    )
                    gameStm.setString(1, developer)
                }
                // If only developer is empty
                else if (developer == "") {
                    val sql: StringBuilder = StringBuilder(
                        "SELECT g.id, g.name, g.developer, ARRAY_AGG(gg.genre) as genres " +
                            "FROM game g " +
                            "JOIN game_genre gg ON g.id = gg.id " +
                            "WHERE EXISTS (" +
                            "SELECT 1 " +
                            "FROM game_genre gg2 " +
                            "WHERE gg2.id = g.id " +
                            "AND gg2.genre IN ("
                    )
                    var query = appendGenres(sql, genres)
                    query += ") GROUP BY g.id, g.name, g.developer ORDER by g.name asc"

                    gameStm = it.prepareStatement(query)

                    for ((index, genre) in genres.withIndex()) {
                        gameStm.setString(index + 1, genre)
                    }
                }
                // If none are empty
                else {
                    val sql: StringBuilder = StringBuilder(
                        "SELECT g.id, g.name, g.developer, ARRAY_AGG(gg.genre) as genres " +
                            "FROM game g " +
                            "JOIN game_genre gg ON g.id = gg.id " +
                            "WHERE g.developer = ? " +
                            "AND EXISTS ( " +
                            "SELECT 1 " +
                            "FROM game_genre gg2 " +
                            "WHERE gg2.id = g.id " +
                            "AND gg2.genre IN ("
                    )

                    var query = appendGenres(sql, genres)
                    query += ") GROUP BY g.id, g.name, g.developer ORDER by g.name asc"

                    gameStm = it.prepareStatement(query)
                    gameStm.setString(1, developer)
                    for ((index, genre) in genres.withIndex()) {
                        gameStm.setString(index + 2, genre)
                    }
                }

                val gameRs = gameStm.executeQuery()
                val games = getGamesFromRs(gameRs)
                filteredGames = if (name.isNotEmpty()) {
                    games.filter { game -> game.name.contains(name) }
                } else {
                    games
                }
            }
        } catch (e: SQLException) {
            throw IllegalArgumentException("Game not found")
        }
        return filteredGames
    }

    private fun getGamesFromRs(rs: ResultSet): List<Game> {
        val games = mutableListOf<Game>()
        while (rs.next()) {
            val gameId = rs.getInt("id")
            val gameName = rs.getString("name")
            val gameDeveloper = rs.getString("developer")
            val genresArr = rs.getArray("genres")

            val genresSet = if (genresArr.array is Array<*>) {
                (genresArr.array as Array<*>).map { it.toString() }.toSet()
            } else {
                emptySet()
            }
            games.add(Game(gameId, gameName, gameDeveloper, genresSet))
        }
        return games
    }

    private fun appendGenres(sql: StringBuilder, genres: Set<String>): String {
        for (genre in genres) {
            sql.append("?,")
        }
        sql.append(")")
        sql.append("\n group by g.id, g.name, g.developer")

        return sql.toString().replace(",)", ")")
    }

    override fun createSession(
        numberOfPlayers: Int,
        date: String,
        state: String,
        game: Game,
        players: List<Player>,
        ownerID: Int
    ): Int {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        var sessionID = 0

        dataSource.setURL(jdbcDatabaseURL)
        try {
            dataSource.connection.use { connection ->
                connection.autoCommit = false
                val stm = connection.prepareStatement(
                    "insert into session(numberofplayers,game,date,owner) values(?,?,?,?)",
                    RETURN_GENERATED_KEYS
                )
                stm.setInt(1, numberOfPlayers)
                stm.setInt(2, game.id)
                stm.setInt(4, ownerID)
                val format = SimpleDateFormat("yyyy-MM-dd")
                val parsedDate = format.parse(date)
                println(parsedDate)
                val sqlDate = java.sql.Date(parsedDate.time)
                println(sqlDate)
                stm.setDate(3, sqlDate)
                stm.executeUpdate()

                val rs = stm.generatedKeys
                while (rs.next()) {
                    sessionID = rs.getInt("id")
                }
                for (player in players) {
                    val playerStmt = connection.prepareStatement(
                        "insert into session_player(sessionid,playerid) values(?,?)"
                    )
                    playerStmt.setInt(1, sessionID)
                    playerStmt.setInt(2, player.id)
                    playerStmt.executeUpdate()
                }
                connection.commit()
            }
        } catch (e: SQLException) {
            throw IllegalArgumentException("Session already exists")
        }
        return sessionID
    }

    override fun deleteSession(id: Int) {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        dataSource.setURL(jdbcDatabaseURL)
        try {
            dataSource.connection.use {
                val stm = it.prepareStatement(
                    "begin;\n delete from session_player where sessionid = ?;\n delete from session where id = ?;\n commit;"
                )
                stm.setInt(1, id)
                stm.setInt(2, id)
                stm.executeUpdate()
            }
        } catch (e: SQLException) {
            throw IllegalArgumentException("Session not found")
        }
    }

    override fun removePlayerFromSession(sid: Int, pid: Int) {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        dataSource.setURL(jdbcDatabaseURL)

        try {
            dataSource.connection.use {
                val stm = it.prepareStatement(
                    "begin;\n delete from session_player where sessionid = ? and playerid = ?;\n commit;"
                )
                stm.setInt(1, sid)
                stm.setInt(2, pid)
                stm.executeUpdate()
            }
        } catch (e: SQLException) {
            println("Error when trying to remove player from session: ${e.message}")
        }
    }

    override fun updateSession(id: Int, numberOfPlayers: Int, date: String) {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        dataSource.setURL(jdbcDatabaseURL)
        try {
            dataSource.connection.use {
                val stm = it.prepareStatement(
                    "begin;\n update session set numberofplayers = ?, date = ? where id = ?;\n commit;"
                )
                stm.setInt(1, numberOfPlayers)

                val format = SimpleDateFormat("yyyy-MM-dd")
                val parsedDate = format.parse(date)
                val sqlDate = java.sql.Date(parsedDate.time)

                stm.setDate(2, sqlDate)
                stm.setInt(3, id)
                stm.executeUpdate()
            }
        } catch (e: SQLException) {
            throw IllegalArgumentException("Session not found")
        }
    }

    override fun addPlayer(id: Int, player: Player) {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        dataSource.setURL(jdbcDatabaseURL)
        try {
            dataSource.connection.use {
                val sessionStm = it.prepareStatement(
                    "select numberofplayers from session where id = ?"
                )
                sessionStm.setInt(1, id)
                val rs = sessionStm.executeQuery()
                var numberOfPlayers = 0
                while (rs.next()) {
                    numberOfPlayers = rs.getInt("numberofplayers")
                }
                if (numberOfPlayers == 0) {
                    throw Exception("Session not found")
                }

                val playerStm = it.prepareStatement(
                    "select count(*) from session_player where sessionid = ?"
                )
                playerStm.setInt(1, id)
                val playerRs = playerStm.executeQuery()
                var count = 0
                while (playerRs.next()) {
                    count = playerRs.getInt("count")
                }
                if (count >= numberOfPlayers) {
                    throw Exception("Session is full")
                }

                val stm = it.prepareStatement(
                    "begin;\n insert into session_player(sessionid,playerid) values(?,?);\n commit;"
                )
                stm.setInt(1, id)
                stm.setInt(2, player.id)
                stm.executeUpdate()
            }
        } catch (e: SQLException) {
            throw IllegalArgumentException("Can't add player")
        }
    }

    override fun getDetails(id: Int): Session {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        dataSource.setURL(jdbcDatabaseURL)

        val emptySession =
            Session(
                1,
                1,
                "2004-12-24",
                "open",
                Game(1, "abc", "abc", setOf("aaa")),
                listOf(Player(1, "aaa", "aaa@aaa.com")),
                1
            )

        var session: Session? = null

        try {
            dataSource.connection.use {
                val stm = it.prepareStatement(
                    "select session.id,session.numberofplayers,session.date,session.state,session.owner,game.id as game_id,game.name,game.developer,game_genre.genre\n" +
                        "from session join game on session.game = game.id\n" +
                        "join game_genre on game.id = game_genre.id\n" +
                        "where session.id = ?"
                )
                stm.setInt(1, id)
                val rs = stm.executeQuery()
                val genreSet = mutableSetOf<String>()
                while (rs.next()) {
                    genreSet.add(rs.getString("genre"))
                    if (session == null) {
                        session = Session(
                            rs.getInt("id"),
                            rs.getInt("numberofplayers"),
                            rs.getString("date"),
                            rs.getString("state"),
                            Game(rs.getInt("game_id"), rs.getString("name"), rs.getString("developer"), genreSet),
                            listOf(),
                            rs.getInt("owner")

                        )
                    }
                }

                val playerStm = it.prepareStatement(
                    "select player.id,player.name,player.email\n" +
                        "from session_player join player on session_player.playerid = player.id\n" +
                        "where session_player.sessionid = ?"
                )
                playerStm.setInt(1, id)
                val playerRs = playerStm.executeQuery()

                val players = mutableListOf<Player>()
                while (playerRs.next()) {
                    players.add(
                        Player(
                            playerRs.getInt("id"),
                            playerRs.getString("name").replace("\"", "").replace("\\", ""),
                            playerRs.getString("email").replace("\"", "").replace("\\", "")
                        )
                    )
                }
                session = session?.copy(players = players)
            }

            if (session == null) throw IllegalArgumentException("Session not found")
        } catch (e: Exception) {
            throw IllegalArgumentException("Session not found")
        }
        return session ?: emptySession
    }

    override fun fetchSessions(gid: Int, date: String?, pid: Int?): List<Session> {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        val sessions = mutableListOf<Session>()

        dataSource.setURL(jdbcDatabaseURL)
        try {
            dataSource.connection.use {
                val sessionStm = it.prepareStatement(
                    "select distinct session.id, session.numberofplayers,session.date,session.state,session.owner,game.id as game_id, game.name,game.developer\n" +
                        "from session join game on session.game = game.id\n" +
                        "join game_genre on game.id = game_genre.id\n" +
                        "where game.id = ?"
                )
                sessionStm.setInt(1, gid)
                val sessionRs = sessionStm.executeQuery()

                while (sessionRs.next()) {
                    val sessionId = sessionRs.getInt("id")
                    val numberOfPlayers = sessionRs.getInt("numberofplayers")
                    val owner = sessionRs.getInt("owner")
                    val sessionDate = sessionRs.getString("date")
                    val sessionState = sessionRs.getString("state")
                    val gameName = sessionRs.getString("name")
                    val gameId = sessionRs.getInt("game_id")
                    val gameDeveloper = sessionRs.getString("developer")

                    val genreStm = it.prepareStatement(
                        "select genre from game_genre where id = ?"
                    )
                    genreStm.setInt(1, gid)
                    val genreRs = genreStm.executeQuery()

                    val gameGenres = mutableSetOf<String>()
                    while (genreRs.next()) {
                        gameGenres.add(genreRs.getString("genre"))
                    }

                    val playerStm = it.prepareStatement(
                        "select player.id, player.name,player.email\n" +
                            "from session_player join player on session_player.playerid = player.id\n" +
                            "where session_player.sessionid = ?"
                    )
                    playerStm.setInt(1, sessionId)
                    val playerRs = playerStm.executeQuery()

                    val players = mutableListOf<Player>()
                    while (playerRs.next()) {
                        players.add(
                            Player(
                                playerRs.getInt("id"),
                                playerRs.getString("name").replace("\"", "").replace("\\", ""),
                                playerRs.getString("email").replace("\"", "").replace("\\", "")
                            )
                        )
                    }
                    if (pid != null) {
                        if (players.find { it.id == pid } == null) {
                            continue
                        } else {
                            if (date != null && date != sessionDate) {
                                continue
                            } else {
                                sessions.add(
                                    Session(
                                        sessionId,
                                        numberOfPlayers,
                                        sessionDate,
                                        sessionState,
                                        Game(gameId, gameName, gameDeveloper, gameGenres),
                                        players,
                                        owner
                                    )
                                )
                            }
                        }
                    } else {
                        if (date != null && date != sessionDate) {
                            continue
                        } else {
                            sessions.add(
                                Session(
                                    sessionId,
                                    numberOfPlayers,
                                    sessionDate,
                                    sessionState,
                                    Game(gameId, gameName, gameDeveloper, gameGenres),
                                    players,
                                    owner
                                )
                            )
                        }
                    }
                }
            }
        } catch (e: Exception) {
            throw IllegalArgumentException("Session not found")
        }
        return sessions.toList()
    }

    override fun createPlayer(name: String, email: String, password: String): String {
        if (name.isEmpty() || email.isEmpty() || password.isEmpty()) {
            throw IllegalArgumentException("Name, email and password cannot be empty")
        }
        val hashedPassword = encryptPassword(password)

        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        val token = UUID.randomUUID().toString()

        dataSource.setURL(jdbcDatabaseURL)
        try {
            dataSource.connection.use {
                val stm = it.prepareStatement(
                    "begin; " +
                        "insert into player(name,email,token) values(?,?,?); " +
                        "insert into player_pass(token,password) values(?,?);" +
                        "commit;\n"
                )
                stm.setString(1, name)
                stm.setString(2, email)
                stm.setString(3, token)
                stm.setString(4, token)
                stm.setString(5, hashedPassword)

                stm.executeUpdate()
            }
        } catch (e: PSQLException) {
            val message = e.serverErrorMessage?.message
            throw IllegalArgumentException(message ?: "")
        } catch (e: SQLException) {
            throw IllegalArgumentException()
        }
        return token
    }

    override fun getPlayerDetails(id: Int): Player {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        var name = ""
        var email = ""

        dataSource.setURL(jdbcDatabaseURL)
        try {
            dataSource.connection.use {
                val stm = it.prepareStatement(
                    "select name, email from player where id = ?"
                )
                stm.setInt(1, id)

                val rs = stm.executeQuery()
                while (rs.next()) {
                    name = rs.getString("name").replace("\"", "").replace("\\", "")
                    email = rs.getString("email").replace("\"", "").replace("\\", "")
                }
                if (name.isEmpty() || email.isEmpty()) {
                    throw Exception("Player not found")
                }
                return Player(
                    id,
                    name,
                    email
                )
            }
        } catch (e: Exception) {
            throw IllegalArgumentException("Player not found")
        }
    }

    override fun authenticate(token: String): Boolean {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        var authenticated = false

        dataSource.setURL(jdbcDatabaseURL)
        try {
            dataSource.connection.use {
                val stm = it.prepareStatement(
                    "select ID from PLAYER where token = ?"
                )
                stm.setString(1, token)

                val rs = stm.executeQuery()

                if (rs.next()) {
                    authenticated = true
                }
            }
        } catch (e: Exception) {
            throw IllegalArgumentException("Player not found")
        }
        return authenticated
    }

    override fun getPlayerSessions(pid: Int): List<Session> {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        val sessions = mutableListOf<Session>()

        dataSource.setURL(jdbcDatabaseURL)
        try {
            dataSource.connection.use {
                val sessionStm = it.prepareStatement(
                    "select distinct session.id, session.numberofplayers,session.date,session.owner,state,game.id as game_id, game.name,game.developer\n" +
                        "from session join game on session.game = game.id\n" +
                        "join game_genre on game.id = game_genre.id\n" +
                        "join session_player on session.id = session_player.sessionid\n" +
                        "where session_player.playerid = ?"
                )
                sessionStm.setInt(1, pid)
                val sessionRs = sessionStm.executeQuery()

                while (sessionRs.next()) {
                    val sessionId = sessionRs.getInt("id")
                    val numberOfPlayers = sessionRs.getInt("numberofplayers")
                    val sessionDate = sessionRs.getString("date")
                    val owner = sessionRs.getInt("owner")
                    val sessionState = sessionRs.getString("state")
                    val gameName = sessionRs.getString("name")
                    val gameId = sessionRs.getInt("game_id")
                    val gameDeveloper = sessionRs.getString("developer")

                    val genreStm = it.prepareStatement(
                        "select genre from game_genre where id = ?"
                    )
                    genreStm.setInt(1, gameId)
                    val genreRs = genreStm.executeQuery()

                    val gameGenres = mutableSetOf<String>()
                    while (genreRs.next()) {
                        gameGenres.add(genreRs.getString("genre"))
                    }

                    val playerStm = it.prepareStatement(
                        "select player.id, player.name,player.email\n" +
                            "from session_player join player on session_player.playerid = player.id\n" +
                            "where session_player.sessionid = ?"
                    )
                    playerStm.setInt(1, sessionId)
                    val playerRs = playerStm.executeQuery()

                    val players = mutableListOf<Player>()
                    while (playerRs.next()) {
                        players.add(
                            Player(
                                playerRs.getInt("id"),
                                playerRs.getString("name").replace("\"", "").replace("\\", ""),
                                playerRs.getString("email").replace("\"", "").replace("\\", "")
                            )
                        )
                    }

                    sessions.add(
                        Session(
                            sessionId,
                            numberOfPlayers,
                            sessionDate,
                            sessionState,
                            Game(gameId, gameName, gameDeveloper, gameGenres),
                            players,
                            owner
                        )
                    )
                }
            }
        } catch (e: Exception) {
            throw IllegalArgumentException("Player not found")
        }
        return sessions.toList()
    }

    override fun loginPlayer(name: String, password: String): String {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        var token = ""

        dataSource.setURL(jdbcDatabaseURL)
        try {
            dataSource.connection.use {
                val stm = it.prepareStatement(
                    "select player.id, player.token, player_pass.password from player join player_pass on player.token = player_pass.token where player.name = ?"
                )
                stm.setString(1, name)

                val rs = stm.executeQuery()
                while (rs.next()) {
                    val hashedPassword = rs.getString("password")
                    if (verifyPassword(password, hashedPassword)) {
                        token = rs.getString("token")
                    } else {
                        throw IllegalArgumentException("Invalid credentials")
                    }
                }
            }
        } catch (e: Exception) {
            throw IllegalStateException(e.message)
        }
        return token
    }

    override fun searchPlayerByName(name: String): List<Player> {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        val players = mutableListOf<Player>()

        dataSource.setURL(jdbcDatabaseURL)

        try {
            dataSource.connection.use {
                val stm = it.prepareStatement(
                    "select * from player"
                )

                val rs = stm.executeQuery()
                while (rs.next()) {
                    players.add(
                        Player(
                            rs.getInt("id"),
                            rs.getString("name").replace("\"", "").replace("\\", ""),
                            rs.getString("email").replace("\"", "").replace("\\", "")
                        )
                    )
                }
            }
        } catch (e: Exception) {
            throw IllegalArgumentException("No players were found")
        }
        val filteredPlayers = players.filter { it.name.contains(name) }
        return filteredPlayers
    }

    override fun getIdByToken(token: String): String {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("JDBC_DATABASE_URL")
        var id = ""

        dataSource.setURL(jdbcDatabaseURL)

        try {
            dataSource.connection.use {
                val stm = it.prepareStatement(
                    "select id from player p where p.token = ?"
                )
                stm.setString(1, token)

                val rs = stm.executeQuery()

                while (rs.next()) {
                    id = rs.getInt("id").toString()
                    println("id at db")
                    println(id)
                }
            }
        } catch (e: SQLException) {
            println("exception")
            println(e.message)
            throw Exception("No player found")
        }

        return id
    }
}
