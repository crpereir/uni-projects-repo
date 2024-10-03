import {h1, div, button, h2} from "../lib/Library.js";
function getHomeView(mainDiv, currentPlayer) {

    const pageTitle = h1({
        attributes: {class: "flex text-white font-semibold text-4xl cursor-pointer select-none"}
    }, "Sessions Web App");

    const signOut = button({
            attributes: {class: "w-24 ml-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                sessionStorage.removeItem("token")
                window.location.hash = "#"
            }
        },
        'Sign out')
    const navWrapper = div({attributes: {class: "w-full p-10 flex flex-row justify-between"}}, [pageTitle, signOut])


    const welcomeMessage = h1({
        attributes: {class: "text-white font-semibold text-6xl"}
    }, 'Welcome ');
    const playerName = h2({attributes: {class: "text-white text-5xl"}}, currentPlayer.name);
    const messageDiv = div({attributes: {class: "flex flex-col align-middle justify-center text-center"}}, [welcomeMessage, playerName]);

    const myProfileButton = button({
            attributes: {class: "w-24 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = "players/" + currentPlayer.id
            }

        },
        'My Profile');
    const sessionsButton = button({
            attributes: {class: "w-24 ml-5 mr-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = "sessionSearch"
            }
        },
        'Sessions');
    const gamesButton = button({
            attributes: {class: "w-24 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = "games"
            }
        },
        'Games');
    const createGameButton = button({
            attributes: {class: "w-24 ml-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = "create-game"
            }
        },
        'Create Game');

    const searchPlayersButton = button({
        attributes: {class: "w-24 rounded-md ml-5 shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
        onClick: () => {
            window.location.hash = "player-search"
        }
    }, "Search Players")

    const createSessionButton = button({
        attributes: {class: "w-24 rounded-md ml-5 shadow-md text-sm text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
        onClick: () => {
            window.location.hash = `session/create/`
        }
    }, 'Create Session')
    const buttonWrapper = div({attributes: {class: "mt-10 flex flex-row justify-evenly"}}, [myProfileButton,searchPlayersButton, sessionsButton, gamesButton, createGameButton, createSessionButton])
    const actionWrapper = div({attributes: {class: "flex flex-col mt-72"}},[messageDiv, buttonWrapper])
    return div({attributes: {class: "flex flex-col h-screen items-center justify-start align-middle"}}, [navWrapper,actionWrapper])
}

export const homeViews = {
    getHomeView: getHomeView
}