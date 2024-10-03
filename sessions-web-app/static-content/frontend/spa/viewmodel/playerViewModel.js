import {API_BASE_URL} from "./ViewModel.js";


async function playerDetails(id) {
    try {
        const queryString = API_BASE_URL + "players/" + id;
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

async function getPlayersFromSearch(name,limit,skip){
    try {
        const queryString = API_BASE_URL + "players/search?name=" + name + "&limit=" + limit + "&skip=" + skip;
        const res = await fetch(queryString, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json"
            }
        });
        if (!res.ok) {
            const text = await res.text();
            return { status: res.status, message: text };
        }
        return await res.json();
    } catch (error) {
        console.error('Error: ', error);
    }
}

async function addPlayerToSession(sessionId,playerId){
    try {
        const queryString = API_BASE_URL + "sessions";
        const res = await fetch(queryString, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization" : "Bearer " + "player1_token"
            },
            body: JSON.stringify(
                {
                    "sessionID": Number(sessionId),
                    "playerID": Number(playerId)
                }
            )
        });
        if (!res.ok) {
            const text = await res.text();
            return { status: res.status, message: text };
        }
        return await res.json();
    } catch (error) {
        console.error('Error: ', error);
    }
}

async function getIdByToken(token){
    try {
        const queryString = API_BASE_URL + "players/get-id" + "?token=" + token;
        const res = await fetch(queryString, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization" : "Bearer " + token
            }
        });
        if (!res.ok) {
            const text = await res.text();
            return { status: res.status, message: text };
        }
        return await res.json();
    } catch (error) {
        console.error('Error: ', error);
    }
}

export const playerViewModel = {
    playerDetails,
    getPlayersFromSearch,
    addPlayerToSession,
    getIdByToken
}