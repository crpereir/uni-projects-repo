import {gameViews} from "../view/gameViews.js";
import {views} from "../view/View.js";
import {gameViewModel} from "../viewmodel/gameViewModel.js";

async function getGameSearch(mainContent) {
    const view = gameViews.getGameSearchView();
    views.loadView(view, mainContent);
}

async function createGame(mainContent) {
    const params = window.location.hash.includes("?") ? window.location.hash.split("/")[1].split("?")[1] : window.location.hash.split("/")[1];

    // Check if the user is authenticated
    const token = sessionStorage.getItem("token");
    if (!token) {
        window.location.hash = "#auth/login/";
    }

    // Get the parameters for the game creation
    if (params) {
        const gameParams = getGameQueryParams(params);
        const name = gameParams.name;
        const developer = gameParams.developer;
        const genres = gameParams.genres;

        const res = await gameViewModel.createGame(name, developer, genres);
        const json = await res.json();
        if (res.status !== 201) {
            alert(json.error);
        } else {
            const game = await gameViewModel.gameDetails(json.gameID);
            const gameObject = await game.json();
            const html = await gameViews.getParticularGameView(gameObject, "", false);
            views.loadView(html, mainContent);
        }
    } else {
        const view = gameViews.createGameView();
        views.loadView(view, mainContent);
    }
}

async function getGameSearchResults(mainContent) {
    const params = window.location.hash.split("/")[2];
    const gameParams = getGameQueryParams(params);
    const name = gameParams.name;
    const developer = gameParams.developer;
    const genres = gameParams.genres;

    try {
        if (developer || genres) {
            const games = await gameViewModel.fetchGames(name, developer, genres)
            const parsedGames = await games.json();
            if (parsedGames.length === 0) {
                const view = gameViews.getGameSearchView(true);
                views.loadView(view, mainContent);
            } else {
                // Show search results
                const view = gameViews.getGameSearchResultView(parsedGames);
                views.loadView(view, mainContent);
            }
        } else {
            const games = await gameViewModel.fetchGames(name);
            const parsedGames = await games.json()
            const view = gameViews.getGameSearchResultView(parsedGames);
            views.loadView(view, mainContent);
        }
    } catch (error) {
        console.log(error);
    }
}

function getGameQueryParams(params) {
    let gameParams = {}

    if (params !== undefined && params !== "") {
        const splitParams = params.split("&") ? params.split("&") : params;
        splitParams.forEach(param => {
            if (param.startsWith("name")) {
                gameParams["name"] = param.split("=")[1].replaceAll('%20', ' ');
            }
            if (param.startsWith("developer")) {
                gameParams["developer"] = param.split("=")[1].replaceAll('%20', ' ');
            }
            if (param.startsWith("genres")) {
                gameParams["genres"] = param.split("=")[1].split(",");
            }
        });
    }

    return gameParams
}

async function getParticularGame(mainContent) {
    const gameId = window.location.hash.split("/")[1];
    const game = await gameViewModel.gameDetails(gameId);
    const parsedGame = await game.json();
    if (window.location.hash.includes("?")) {
        const searchParams = window.location.hash.split('?')[1].replace("search=", "");
        const view = gameViews.getParticularGameView(parsedGame, searchParams, true);
        views.loadView(view, mainContent);
    } else {
        const view = gameViews.getParticularGameView(parsedGame, null, false);
        views.loadView(view, mainContent);
    }
}

export const gameHandlers = {
    getGameSearch,
    getParticularGame,
    createGame,
    getGameSearchResults,
}
