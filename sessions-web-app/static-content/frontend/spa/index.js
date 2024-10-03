import router from "./router/Router.js";
import {playerHandlers} from "./handlers/playerHandlers.js";
import {homeHandlers} from "./handlers/homeHandlers.js";
import {sessionsHandlers} from "./handlers/sessionsHandlers.js"
import {gameHandlers} from "./handlers/gameHandlers.js";
import {authHandlers} from "./handlers/authHandlers.js";
import {landingHandlers} from "./handlers/landingHandlers.js";

window.addEventListener('load', loadHandler)
window.addEventListener('hashchange', hashChangeHandler)

function loadHandler(){
    router.addRouteHandler("landing",landingHandlers.getLandingView)
    router.addRouteHandler("home", homeHandlers.getHome)
    router.addRouteHandler("sessionSearch", sessionsHandlers.getSessionSearch)
    router.addRouteHandler("sessions", sessionsHandlers.getSessions)
    router.addRouteHandler("session", sessionsHandlers.getParticularSession)
    router.addRouteHandler("players", playerHandlers.playerDetails)
    router.addRouteHandler("create-game", gameHandlers.createGame)
    router.addRouteHandler("games", gameHandlers.getGameSearch)
    router.addRouteHandler("games/results", gameHandlers.getGameSearchResults);
    router.addRouteHandler("game", gameHandlers.getParticularGame)
    router.addRouteHandler("players/sessions", sessionsHandlers.getPlayerSessions);
    router.addRouteHandler("session/update", sessionsHandlers.updateSession);
    router.addRouteHandler("session/update/apply", sessionsHandlers.applyUpdateToSession);
    router.addRouteHandler("session/create",sessionsHandlers.createSession)
    router.addRouteHandler("session/apply/remove-player",sessionsHandlers.removePlayerFromSession)
    router.addRouteHandler("player-search",playerHandlers.playerSearch)
    router.addRouteHandler("player-search-results",playerHandlers.playerSearchResults)
    router.addRouteHandler("session/apply/delete",sessionsHandlers.applyDeleteSession)
    router.addRouteHandler("add-player-to-session",playerHandlers.addPlayerToSession)
    router.addRouteHandler("auth/login", authHandlers.loginPage)
    router.addRouteHandler("auth/signup", authHandlers.signupPage)
    router.addRouteHandler("auth/login/submit", authHandlers.login)
    router.addRouteHandler("auth/signup/submit", authHandlers.signupSubmit)
    router.addDefaultNotFoundRouteHandler(() => window.location.hash = "home/1")

    hashChangeHandler()
}

function hashChangeHandler(){
    const mainContent = document.getElementById("mainContent")
    let path =  window.location.hash.replace("#", "")
    let id;

    if (path.includes("?")) {
        path = path.split("?")[0];
    }

    if (path.includes("/")) {
        let splitPath = path.split("/");
        if (splitPath.length > 2) {
            if(splitPath.length === 3){
            path = splitPath[0] + "/" + splitPath[1];
            id = splitPath[2];
            } else {
                path = splitPath[0] + "/" + splitPath[1] + "/" + splitPath[2];
                id = splitPath[2] + "/" + splitPath[3];
            }
        } else {
            path = splitPath[0];
            id = splitPath[1];
        }
    }
    const handler = router.getRouteHandler(path)
    handler(mainContent,id)
}
