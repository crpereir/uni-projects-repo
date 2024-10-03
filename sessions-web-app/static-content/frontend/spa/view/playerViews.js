import {button, div, h1, h2, h3, input, option, select, ul} from "../lib/Library.js";

function getPlayerDetailsView(player, playerSessions,currentlyLoggedInPlayer) {
    console.log(currentlyLoggedInPlayer)
    const pageTitle = h1({
        attributes: {class: "flex text-white font-semibold text-4xl select-none"},
    }, "My Profile");

    const homeButton = button({
            attributes: {class: "w-24 ml-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = ""
            }
        },
        'Home')

    const navWrapper = div({attributes: {class: "m-5 flex flex-row justify-between"}}, [pageTitle, homeButton])

    const playerName = h2({
        attributes: {class: "text-white text-5xl font-semibold"},
        onClick: () => {
            window.location.hash = "players/" + player.id
        }
    }, player.name);

    const playerEmail = h3({
        attributes: {class: "text-white text-2xl mt-2"},
    }, player.email);

    const sessionsButton = button({
            attributes: {class: "w-24 mt-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = "players/sessions/" + player.id + "&skip=0"
            }
        },
        'Sessions')

    let sessionID = ""

    let options = playerSessions.map(session =>
        option({
            attributes: {value: session.game.name}
        }, session.game.name))

    options = [option({attributes: {value: ""}}, "Choose a session"), ...options]

    let isDropDownHidden = true


    const addPlayerToSessionButton = button({
        attributes: {
            class: currentlyLoggedInPlayer != player.id ? "w-24 mt-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900" : "hidden"
        },
        onClick: () => {
            isDropDownHidden = !isDropDownHidden
            dropDownWrapper.className = isDropDownHidden ? "hidden" : "flex flex-col items-center";
        }
    },"Add to session")

    const sessionDropDown = select({
        attributes: {
            id: "sessions",
            class : "w-56 mt-5 h-10 rounded-xl bg-gray-800 text-center text-white text-lg"
        },
        onChange: (e) => {
            let sessionGame = e.target.value;
            sessionID = playerSessions.find(session => session.game.name === sessionGame).id
        }
    }, options)

    const addPlayerToSession = button({
        attributes: {
            class: "w-24 mt-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900",
        },
        onClick: () => {
            if (sessionID === "") {
                alert("You need to choose a session")
            } else {
                window.location.hash = `add-player-to-session?sessionID=${sessionID}&playerID=${player.id}`
            }
        }
    }, "Add")

    const dropDownWrapper = div({
        attributes: {
            class: "hidden"
        }
    },[sessionDropDown, addPlayerToSession])

    const playerSessionsWrapper = div({
        attributes: {
            class: "flex flex-col items-center"
        }
    },[addPlayerToSessionButton, dropDownWrapper])

    const playerDetailsWrapper = div({attributes: {class: "flex flex-col items-center justify-center mt-48"}}, [playerName, playerEmail, sessionsButton,playerSessionsWrapper])


    return div({}, [navWrapper, playerDetailsWrapper])
}


function playerSearchView(){
    let searchInputValue = ""

    const pageTitle = h1({
        attributes: {class: "flex text-white font-semibold text-4xl select-none"},
    }, "Players");

    const homeButton = button({
            attributes: {class: "w-24 ml-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = ""
            }
        },
        'Home')

    const navWrapper = div({attributes: {class: "m-5 flex flex-row justify-between"}}, [pageTitle, homeButton])

    const searchMessage = h3({
        attributes: {
            class : "flex text-white text-2xl"
        }
    },"Search for a player...")

    const searchInput = input({
        attributes: {
            type: "text",
            id: "playerSearchInput",
            placeholder:"Search by name",
            class : "flex bg-gray-800 w-56 text-white text-lg rounded-md p-2 mt-3"
        },
        onChange : (e) => {
            searchInputValue = e.target.value
        }
    },"")

    const searchButton = button({
        attributes: {
            class: "w-24 mt-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"
        },
        onClick: () => {
            if(searchInputValue === ""){
                alert("You need to fill the search field")
            } else {
                window.location.hash = `#player-search-results?name=${searchInputValue}`
            }
        }
    },"Search")

    const searchWrapper = div({
        attributes: {
            class: "flex flex-col items-center justify-center mt-56"
        }
    },[searchMessage,searchInput,searchButton])

    return div({},[navWrapper,searchWrapper])
}


function playerSearchResultsView(search,players,skip){
    const pageTitle = h1({
        attributes: {class: "flex text-white font-semibold text-4xl select-none"},
    }, "Players");

    const homeButton = button({
            attributes: {class: "w-24 ml-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = ""
            }
        },
        'Home')

    const navWrapper = div({attributes: {class: "m-5 flex flex-row justify-between"}}, [pageTitle, homeButton])

    const limit = 4

    let playerCards = players.map(player => {
            return div({
                attributes: {class: "flex m-2 shadow-md flex-row text-white bg-gray-800 border border-gray-800 cursor-pointer hover:bg-gray-900 rounded-2xl w-56 h-32 items-center align-middle justify-center"},
                onClick: () => {
                    window.location.hash = `#players/${player.id}`
                },
            }, [
                h3({
                    attributes: {class: "flex flex-col text-white font-semibold text-2xl"}
                }, player.name)
            ]);
        }
    )

    playerCards = playerCards.slice(0, limit)

    const handleNextClick = () => {
        window.location.hash = `#player-search-results?name=${search}&skip=${Number(skip) + limit}`
    }
    const handlePreviousClick = () => {
        window.location.hash = `#player-search-results?name=${search}&skip=${Number(skip) - limit}`
    }
    const isFirstPage = Number(skip) === 0
    const previousClass = isFirstPage ? "flex rounded-3xl text-white font-semibold p-3 bg-gray-800 hover:bg-gray-800 pointer-events-none" :
        "flex rounded-3xl text-white font-semibold p-3 bg-gray-700 hover:bg-gray-800 "
    const previousButton = button({
        id: "previousButton",
        onClick: handlePreviousClick,
        attributes: {
            class: previousClass
        }
    }, "<")
    previousButton.disabled = isFirstPage

    const isLastPage = players.length - limit <= 0

    const nextButtonClass = isLastPage ? "flex rounded-3xl text-white font-semibold p-3 bg-gray-800 hover:bg-gray-800 pointer-events-none" :
        "flex rounded-3xl text-white font-semibold p-3 bg-gray-700 hover:bg-gray-800 "
    const nextButton = button({
        id: "nextButton",
        onClick: handleNextClick,
        attributes: {class: nextButtonClass}
    }, ">")
    nextButton.disabled = isLastPage

    const playerCardsList = ul({attributes: {class: "flex flex-row"}}, [])
    playerCards.forEach(card => {
        playerCardsList.appendChild(card)
    })

    const cardsWithButtons = div({
        attributes: {
            class: "flex flex-row items-center justify-center"
        }
    },[previousButton, playerCardsList, nextButton])

    let playersWrapper
    if (players.length !== 0) {
        playersWrapper = div({
            attributes: {class: "flex flex-col justify-center items-center mx-5"}
        }, [cardsWithButtons,button({
            attributes: {
                class: "flex w-24 mt-5 rounded-md shadow-md text-white text-lg justify-center text-center items-center font-semibold p-2 bg-blue-700 hover:bg-blue-900",
            },
            onClick : () => {
                window.location.hash = "player-search"
            }
        },"Go back")])
    } else {
        playersWrapper = div({
            attributes: {class: "flex flex-col font-semibold text-white text-3xl justify-center items-center mx-5"}
        }, [h1({},"No sessions found for this search criteria"),
            button({
                attributes: {
                    class: "flex w-24 mt-5 rounded-md shadow-md text-white text-lg justify-center text-center items-center font-semibold p-2 bg-blue-700 hover:bg-blue-900",
                },
                onClick : () => {
                    window.location.hash = "player-search"
                }
            },"Go back")
        ])
    }


    const resultsWrapper = div({
        attributes: {class: "flex mt-56 flex-row items-center justify-center"}
    },[playersWrapper])

    return div ({}, [navWrapper,resultsWrapper])
}

export const playerViews = {
    getPlayerDetailsView: getPlayerDetailsView,
    playerSearchView: playerSearchView,
    playerSearchResultsView: playerSearchResultsView
}