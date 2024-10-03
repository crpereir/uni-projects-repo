import {sessionsViewModel} from "../viewmodel/sessionsViewModel.js";
import {gameViewModel} from "../viewmodel/gameViewModel.js";
import {sessionsView} from "../view/sessionsViews.js";
import {views} from "../view/View.js";
import {playerViews} from "../view/playerViews.js";
import {playerViewModel} from "../viewmodel/playerViewModel.js";


async function getSessionSearch(mainContent) {
    const response = await gameViewModel.fetchGames();
    const games = await response.json();
    const html = sessionsView.getSessionSearchView( games);
    views.loadView(html, mainContent);
}

async function getSessions(mainContent){
    const params = window.location.hash.split("/")[1];
    const gid = params.split("&")[0];
    const URLParams = new URLSearchParams(params);
    const state = URLParams.get("state");
    const date = URLParams.get("date");
    const skip = Number(URLParams.get("skip"));

    const sessions = await sessionsViewModel.sessionSearch(gid,1000,skip, state, date);
    const html = sessionsView.getSessionsView(sessions,skip);
    views.loadView(html, mainContent);
}


async function getParticularSession(mainContent) {
    const token = sessionStorage.getItem("token");
    if(!token){
        window.location.hash = "#auth/login/";
    } else {
        const res = await playerViewModel.getIdByToken(token);
        const ownerID = res.id;
        const sessionId = window.location.hash.split("/")[1];
        const session = await (await sessionsViewModel.sessionDetails(sessionId)).json();
        const html = sessionsView.getParticularSessionView(session, ownerID);
        views.loadView(html, mainContent);
    }
}

async function getPlayerSessions(mainContent) {
    const queryString = window.location.hash.split("/")[2];
    const playerId = queryString.substring(0,queryString.indexOf("&"));
    const params = new URLSearchParams(queryString);
    const skip = Number(params.get("skip"));
    const sessions = await sessionsViewModel.fetchPlayerSessions(playerId,1000,skip);
    const html = sessionsView.getSessionsView(sessions,skip,true);
    views.loadView(html, mainContent);
}

async function updateSession(mainContent){
    const sessionId = window.location.hash.split("/")[2];
    const session = await (await sessionsViewModel.sessionDetails(sessionId)).json();
    const html = sessionsView.updateSessionView(session);
    views.loadView(html, mainContent);
}

async function applyUpdateToSession(mainContent){
    const token = sessionStorage.getItem("token");
    const sessionId = window.location.hash.split("/")[3][0];
    const query = window.location.hash.split("/")[3].split("?")[1];
    if (!token) {
        window.location.hash = "#auth/login/";
    } else {
        const params = new URLSearchParams(query);
        const numberOfPlayers = params.get("numberOfPlayers");
        const date = params.get("date");
        await sessionsViewModel.updateSession(sessionId,numberOfPlayers,date);
        const session = await (await sessionsViewModel.sessionDetails(sessionId)).json();
        const html = sessionsView.getParticularSessionView(session);
        views.loadView(html, mainContent);
    }
}

async function createSession(mainContent){

    const params = window.location.hash.split("/")[2].split("?")[1];
    const URLParams = new URLSearchParams(params);
    const numberOfPlayers = URLParams.get("numberOfPlayers");
    const date = URLParams.get("date");
    const gid = URLParams.get("gid");
    const token = sessionStorage.getItem("token");
    if(!token){
        window.location.hash = "#auth/login/";
    } else {
        let res = await playerViewModel.getIdByToken(token);
        let ownerID = res.id;
    if(params){
        await sessionsViewModel.createSession(numberOfPlayers,date,gid,ownerID);
        const player = await playerViewModel.playerDetails(ownerID);
        const playerSessions = await sessionsViewModel.fetchPlayerSessions(ownerID,1000,0);
        const html = playerViews.getPlayerDetailsView(player,playerSessions);
        views.loadView(html, mainContent);
    } else {
        const response = await gameViewModel.fetchGames();
        const games = await response.json();
        const html = sessionsView.createSessionView(ownerID,games);
        views.loadView(html, mainContent);
    }
    }
}

async function removePlayerFromSession(){
    // #session/apply/remove-player?sessionID=${session.id}&playerID=${player.id}
    const token = sessionStorage.getItem("token");
    const params = window.location.hash.split("/")[3].split("?")[1];
    console.log("Handler debug remove player")
    if (!token) {
        window.location.hash = "#auth/login/";
    } else {
        const URLParams = new URLSearchParams(params);
        const sessionID = URLParams.get("sessionID");
        const playerID = URLParams.get("playerID");
        await sessionsViewModel.removePlayerFromSession(sessionID, playerID);
        window.location.hash = `#session/${sessionID}`;
    }
}

async function applyDeleteSession(){
    const token = sessionStorage.getItem("token");
    const sessionID = window.location.hash.split("/")[3];
    if (!token) {
        window.location.hash = "#auth/login/";
    } else {
        await sessionsViewModel.deleteSession(sessionID);
        window.location.hash = "#sessionSearch";
    }
}

export const sessionsHandlers = {
    getSessionSearch,
    getSessions,
    getParticularSession,
    getPlayerSessions,
    updateSession,
    applyUpdateToSession,
    createSession,
    removePlayerFromSession,
    applyDeleteSession
}