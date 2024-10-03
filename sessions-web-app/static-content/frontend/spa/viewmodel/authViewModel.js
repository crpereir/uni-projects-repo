import {API_BASE_URL} from "./ViewModel.js";


async function login(username,password){
    try {
        const queryString = API_BASE_URL + "auth/login";
        return await fetch(queryString, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json"
            },
            body: JSON.stringify({
                "name": username,
                "password": password
            })
        });
    }
    catch (error) {
        console.error('Error:', error);
    }
}

async function signup(email,username,password) {
    try {
        const queryString = API_BASE_URL + "auth/register";
        return await fetch(queryString, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json"
            },
            body: JSON.stringify({
                "email": email,
                "name": username,
                "password": password
            })
        });
    } catch(error) {
        console.error('Error:', error);
    }
}


async function getIdByToken(token) {
    try {
        const queryString = API_BASE_URL + "players/get-id" + "?token=" + token;
        return await fetch(queryString, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
            }
        })
    } catch(error){
        console.error('Error:', error);
    }
}

export {
    login,
    getIdByToken,
    signup
}