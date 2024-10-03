import {views} from "../view/View.js";
import {playerViewModel} from "../viewmodel/playerViewModel.js";
import {sessionsViewModel} from "../viewmodel/sessionsViewModel.js";
import {playerViews} from "../view/playerViews.js";
import {sessionsView} from "../view/sessionsViews.js";

const hardCodedPlayerID = 1

async function playerDetails(mainContent){
    const params = window.location.hash.split("/")[1];
    let player;
    const token = sessionStorage.getItem("token");
    if(!token){
        window.location.hash = "#auth/login/";
    } else{
    const res = await playerViewModel.getIdByToken(token);
    const currentPlayerID = res.id;
    if(!params){
    player = await playerViewModel.playerDetails(currentPlayerID);
    } else {
        player = await playerViewModel.playerDetails(Number(params));
    }

    const playerSessions = await sessionsViewModel.fetchPlayerSessions(currentPlayerID,1000,0);
    console.log("Sessions: " + playerSessions)
    const html = playerViews.getPlayerDetailsView(player, playerSessions,currentPlayerID);
    views.loadView(html, mainContent);
    }
}


async function playerSearch(mainContent){
    const html = playerViews.playerSearchView();
    views.loadView(html, mainContent);
}

async function playerSearchResults(mainContent){
    const params = window.location.hash
    const searchParams = params.split("?")[1];
    const URLParams = new URLSearchParams(searchParams);
    const name = URLParams.get("name");
    let skip = URLParams.get("skip");
    if(!skip){
        skip = 0;
    }
    const players = await playerViewModel.getPlayersFromSearch(name,1000,skip);
    console.log(players)
    const html = playerViews.playerSearchResultsView(name,players,skip);
    views.loadView(html, mainContent);
}

async function addPlayerToSession(mainContent){
    const params = window.location.hash.split("?")[1];
    const searchParams = new URLSearchParams(params);
    const sessionID = searchParams.get("sessionID");
    const playerID = searchParams.get("playerID");
    const res = await playerViewModel.addPlayerToSession(sessionID,playerID);
    console.log(res)
    if (res.status === 500) {
        const errorMessage = JSON.parse(res.message).error;
        alert(errorMessage);
        window.location.hash = "players/" + playerID;
    } else {
    const session = await (await sessionsViewModel.sessionDetails(sessionID)).json();
    const html = sessionsView.getParticularSessionView(session,hardCodedPlayerID);
    window.location.hash = "session/" + sessionID;
    views.loadView(html, mainContent);
    }
}

export const playerHandlers = {
    playerDetails,
    playerSearch,
    playerSearchResults,
    addPlayerToSession
}
