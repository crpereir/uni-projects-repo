import {playerViewModel} from "../viewmodel/playerViewModel.js";
import {homeViews} from "../view/homeViews.js";
import {views} from "../view/View.js";

async function getHome(mainContent) {
    const token = sessionStorage.getItem("token");
    const windowId = window.location.hash.split("/")[1];

    if (!token) {
        window.location.hash = "#landing";
    } else {
        const res = await playerViewModel.getIdByToken(token);
        const id = res.id;
        if (windowId !== id) {
            window.location.hash = "home/" + id;
        }
        const currentPlayer = await playerViewModel.playerDetails(id);
        const html = homeViews.getHomeView(mainContent, currentPlayer);
        views.loadView(html, mainContent);
    }
}

export const homeHandlers = {
    getHome
}