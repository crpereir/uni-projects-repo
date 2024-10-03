
import {landingViews} from "../view/landingViews.js";
import {views} from "../view/View.js";

async function getLandingView(mainContent){
    const html = landingViews.getLandingView(mainContent);
    views.loadView(html, mainContent)
}

export const landingHandlers = {
    getLandingView
}