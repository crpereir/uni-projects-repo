import {API_BASE_URL} from "./ViewModel.js";


async function sessionSearch(gid, limit = 10, skip = 0,state, date) {
    try {
        state = String(state)
        let queryString = API_BASE_URL + "sessions?gid=" + gid;
        if (date) queryString += "&date=" + date;
        console.log(limit, skip, state, date)
        queryString += limit !== null && limit !== undefined ? "&limit=" + limit : "";
        queryString += skip !== null && skip !== undefined ? "&skip=" + skip : "";

        const response = await fetch(queryString, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json"
            }
        })
        const data = await response.json()
        const sessionsUnfiltered = data.sessions;
        if (state) {
            if (state === "open") {
                return sessionsUnfiltered.filter(session => session.state === "open")

            } else if (state === "closed") {
                return sessionsUnfiltered.filter(session => session.state === "closed")
            }


        }
        return sessionsUnfiltered
    }

    catch (error) {
        console.error('Error:', error);
    }
}

async function sessionDetails(id) {
    try {
        return await fetch(API_BASE_URL + "sessions/" + id, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json"
            }
        });
    } catch (error) {
        console.error('Error: ', error);
    }
}

async function createSession(numberOfPlayers, date, gid, ownerID) {
    try {
        const queryString = API_BASE_URL + "sessions";
        const res = await fetch(queryString, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization" : "Bearer player1_token"
            },
            body: JSON.stringify({
                "numberOfPlayers": numberOfPlayers,
                "date": date,
                "game": gid,
                "players": [ownerID]
            })
        })
        return await res.json();
    } catch (error) {
        console.error('Error: ', error);
    }
}

async function fetchPlayerSessions(id,limit,skip) {
    console.log("Limit: ", limit);
    console.log("Skip: ", skip);
    try {
        const queryString = API_BASE_URL + "players/sessions/" + id + "?limit=" + limit + "&skip=" + skip;
        const res = await fetch(queryString, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json"
            }
        });
        return await res.json();
    } catch (error) {
        console.error('Error: ', error);
    }
}

async function updateSession(session,numberOfPlayers,date) {
    console.log("Session: ", session)
    const queryString = API_BASE_URL + "sessions/" + session;
    console.log(queryString)
    try {


        const res = await fetch(queryString, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization" : "Bearer " + "player1_token"
            },
            body: JSON.stringify(
                {
                    "numberOfPlayers": numberOfPlayers,
                    "date": date
                }
            )
        });
        return await res.json();
    } catch (error) {
        console.error('Error: ', error);
    }
}

async function removePlayerFromSession(sessionID,playerID) {
    try {
        const queryString = API_BASE_URL + "sessions/" + sessionID + "/players/" + playerID;
        const res = await fetch(queryString, {
            method: "DELETE",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization" : "Bearer " + "player1_token"
            }
        });
        return await res.json();
    } catch (error) {
        console.error('Error: ', error);
    }
}

async function deleteSession(sessionID) {
    try {
        const queryString = API_BASE_URL + "sessions/" + sessionID;
        const res = await fetch(queryString, {
            method: "DELETE",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization" : "Bearer " + "player1_token"
            }
        });
        return await res.json();
    } catch (error) {
        console.error('Error: ', error);
    }
}


export const sessionsViewModel = {
    sessionSearch,
    sessionDetails,
    fetchPlayerSessions,
    updateSession,
    createSession,
    removePlayerFromSession,
    deleteSession
}