import {API_BASE_URL} from "./ViewModel.js";


async function gameDetails(id) {
    try {
        const queryString = API_BASE_URL + "games/" + id;
        return await fetch(queryString, {
            method: "GET",
            headers: {
                "Accept": "application/json"
            }
        });
    }
    catch (error) {
        console.error('Error:', error);
    }
}

async function fetchGames(name, developer, genres, limit, skip) {
    try {
        let params = [];
        if (name) params.push(`name=${name}`);
        if (developer) params.push(`developer=${developer}`);
        if (genres) params.push(`genres=${genres}`);
        if (limit) params.push(`limit=${limit}`);
        if (skip) params.push(`skip=${skip}`);

        let queryString = API_BASE_URL + `games`;

        if (params.length > 0) {
            queryString += '?' + params.join('&');
        }

        return await fetch(queryString, {
            method: "GET",
            headers: {
                "Accept": "application/json"
            }
        });
    }
    catch (error) {
        console.error('Error: ', error);
    }
}

async function createGame(name, developer, genres) {
    try {
        const queryString = API_BASE_URL + "games";

        return await fetch(queryString, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer player1_token",
            },
            body: JSON.stringify({
                "name": name,
                "developer": developer,
                "genres": genres
            })
        });
    } catch (error) {
        console.error('Error: ', error);
    }
}

export const gameViewModel = {
    fetchGames,
    createGame,
    gameDetails,
}
