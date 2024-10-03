package pt.isel.ls.db

import junit.framework.TestCase.assertEquals
import org.junit.Test
import pt.isel.ls.domain.Game
import pt.isel.ls.domain.Session

class SessionsDBTests {
    private val db = MockDB()

    @Test
    fun `create a session`() {
        val sessionID = db.createSession(1,"2024-01-01","open", db.games[0],listOf(),1)
        assertEquals(1, sessionID)
        val session = db.sessions.find { it.id == sessionID }
        assertEquals(Session(1, 1, "2024-01-01", "open", db.games[0], listOf(), 1), session)
    }

    @Test
    fun `get session details`() {
        val session = db.getDetails(0)
        assertEquals(Session(0, 1, "2021-03-01", "open", db.games[0], listOf(), 1), session)
    }

    @Test
    fun `get all sessions for game with ID 1`() {
        val sessions = db.fetchSessions(1,null,null)
        assertEquals(db.sessions, sessions)
    }

    @Test
    fun `get all sessions for game with ID 1 and date 2021-03-01`() {
        val sessions = db.fetchSessions(1,"2021-03-01",null)
        assertEquals(listOf(db.sessions[0],db.sessions[1]), sessions)
    }

    @Test
    fun `get all sessions for game with ID 1 and date 2021-03-01 and player in it with ID 0`() {
        val sessions = db.fetchSessions(1,"2021-03-01",1)
        assertEquals(listOf(db.sessions[1]), sessions)
    }

    @Test
    fun `delete a session`() {
        val sessionID = db.createSession(1,"2024-01-01","open", db.games[0],listOf(),1)
        db.deleteSession(sessionID)
        val session = db.sessions.find { it.id == sessionID }
        assertEquals(null, session)
    }

    @Test
    fun `update a session`() {
        val sessionID = db.createSession(1,"2024-01-01","open", db.games[0],listOf(),1)
        db.updateSession(sessionID, 2, "2025-01-01")
        val session = db.sessions.find { it.id == sessionID }
        assertEquals(Session(sessionID, 2, "2025-01-01", "open", db.games[0], listOf(), 1), session)
    }

    @Test
    fun `add player to a session`() {
        val sessionID = db.createSession(1,"2024-01-01","open", db.games[0],listOf(),1)
        db.addPlayer(sessionID, db.players[0])
        val session = db.sessions.find { it.id == sessionID }
        assertEquals(Session(sessionID, 1, "2024-01-01", "open", db.games[0], listOf(db.players[0]), 1), session)
    }

    @Test
    fun `remove player from a session`() {
        val sessionID = db.createSession(1,"2024-01-01","open", db.games[0],listOf(db.players[0]),1)
        db.removePlayerFromSession(sessionID, db.players[0].id)
        val session = db.sessions.find { it.id == sessionID }
        assertEquals(Session(sessionID, 1, "2024-01-01", "open", db.games[0], listOf(), 1), session)
    }

    @Test
    fun `get player sessions`() {
        val sessionID = db.createSession(1,"2024-01-01","open", db.games[0],listOf(db.players[0]),1)
        val playerSessions = db.getPlayerSessions(db.players[0].id)
        println(playerSessions)
        assertEquals(listOf(Session(id=5, numberOfPlayers=1, date="2021-03-01", state="open", game= Game(id=1, name="The Witcher 3", developer="CD Projekt Red", genres=setOf("RPG")), players=listOf(db.players[0]), ownerID=1),Session(sessionID, 1, "2024-01-01", "open", db.games[0], listOf(db.players[0]), 1)), playerSessions)
    }

}