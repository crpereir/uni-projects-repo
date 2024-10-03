import {button, div, h1, h2, h3, h4, input, li, option, select, ul} from "../lib/Library.js";

function updateSessionView(session) {
    const pageTitle = h1({
        attributes: {class: "flex text-white font-semibold text-4xl cursor-pointer select-none"},
        onClick: () => {
            window.location.hash = "sessions"
        }
    }, "Sessions");

    const homeButton = button({
            attributes: {class: "w-24 ml-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = ""
            }
        },
        'Home')

    const navWrapper = div({attributes: {class: "m-5 flex flex-row justify-between"}}, [pageTitle, homeButton])

    const sessionPlayersInput = input({
        attributes: {
            type: "text",
            id: "sessionStateInput",
            class: "w-64 h-10 mt-3 rounded-xl bg-gray-800 text-center text-white text-lg",
            value: session.numberOfPlayers
        }
    }, [])

    const sessionDateInput = input({
        attributes: {
            type: "date",
            id: "sessionDateInput",
            class: "w-64 h-10 mt-3 rounded-xl bg-gray-800 text-center text-white text-lg",
            value: session.date
        }
    }, [])

    const updateButton = button({
        attributes: {class: "w-24 mt-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
        onClick: () => {
            const updatedNumberOfPlayers = sessionPlayersInput.value;
            if(updatedNumberOfPlayers < session.numberOfPlayers){
                alert("You cannot reduce the number of players")
            } else {
                const updatedDate =  sessionDateInput.value;
                window.location.hash = `#session/update/apply/${session.id}?numberOfPlayers=${updatedNumberOfPlayers}&date=${updatedDate}`
            }
        }
    }, "Update")

    const formWrapper = div({
        attributes: {class: "flex flex-col items-center justify-center mt-48"}
    }, [sessionPlayersInput, sessionDateInput, updateButton])

    return div({}, [navWrapper, formWrapper])
}

function getSessionSearchView(games) {
    let state = "";
    let date = "";
    let game = "";
    const pageTitle = h1({
        attributes: {class: "flex text-white font-semibold text-4xl cursor-pointer select-none"},
        onClick: () => {
            window.location.hash = "sessionSearch"
        }
    }, "Sessions");

    const homeButton = button({
            attributes: {class: "w-24 ml-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = ""
            }
        },
        'Home')

    const navWrapper = div({attributes: {class: "m-5 flex flex-row justify-between"}}, [pageTitle, homeButton])

    const searchMessage = h3({
        attributes: {class: "text-white text-2xl"}
    }, "Search based on...");

    const hiddenFilterCardClass = "hidden flex flex-col items-center justify-center bg-gray-800 h-8 rounded-xl p-2 m-2";

    function updateFilterClass() {
        const shownFilterCardClass = "flex flex-col items-center text-white shadow-md justify-center bg-gray-800 h-8 rounded-xl p-2 m-2";

        const gameFilterDiv = document.querySelector('#gameFilterDiv');
        const stateFilterDiv = document.querySelector('#stateFilterDiv');
        const dateFilterDiv = document.querySelector('#dateFilterDiv');

        gameFilterDiv.className = game === "" ? hiddenFilterCardClass : shownFilterCardClass;
        stateFilterDiv.className = state === "" ? hiddenFilterCardClass : shownFilterCardClass;
        dateFilterDiv.className = date === "" ? hiddenFilterCardClass : shownFilterCardClass;

        gameFilterDiv.textContent = game;
        stateFilterDiv.textContent = state;
        dateFilterDiv.textContent = date;
    }

    let appliedFiltersDiv = div({
        attributes: {class: " flex flex-col items-center mt-3 flex rounded-xl bg-gray-900 border border-white w-72 h-24 justify-center select-none"}
    }, [
        h4({
            attributes: {class: "flex mb-5 text-white text-lg"}
        }, "Applied Filters"),
        div({
            attributes: {class: "flex flex-row h-8 items-center justify-center"}
        }, [
            div({
                attributes: {
                    class: hiddenFilterCardClass,
                    id: "gameFilterDiv"
                }
            }, game),
            div({
                attributes: {
                    class: hiddenFilterCardClass,
                    id: "stateFilterDiv"
                }
            }, state),
            div({
                attributes: {
                    class: hiddenFilterCardClass,
                    id: "dateFilterDiv"
                }
            }, date)
        ])
    ])

    const availableGames = games.map(game => game.name)
    let options = availableGames.map(game =>
        option({
            attributes: {value: game}
        }, game))

    options = [option({attributes: {value: ""}}, "Game"), ...options]

    const gameDropDown = select({
        attributes: {
            id: "games",
            class: "w-32 h-10 rounded-xl bg-gray-800 text-center text-white text-lg"
        },
        onChange: (e) => {
            game = e.target.value;
            updateFilterClass();
        }
    }, options)

    const stateDropDown = select({
        attributes: {
            id: "state",
            class: "w-32 h-10 ml-2 rounded-xl bg-gray-800 text-center text-white text-lg"
        },
        onChange: (e) => {
            state = e.target.value;
            console.log(state)
            updateFilterClass();
        }
    }, [
        option({attributes: {value: ""}}, "State"),
        option({attributes: {value: "open"}}, "Open"),
        option({attributes: {value: "closed"}}, "Closed")
    ])

    const dateInput = input({
        attributes: {
            type: "date",
            id: "dateInput",
            class: "w-64 h-10 mt-3 rounded-xl bg-gray-800 text-center text-white text-lg"
        },
        onChange: (e) => {
            date = e.target.value;
            updateFilterClass();
        }
    }, [])

    const dateWrapper = div({}, [dateInput])

    const filterWrapper = div({
        attributes: {
            class: "flex flex-row justify-between mt-5"
        }
    }, [gameDropDown, stateDropDown])

    const searchButton = button({
        attributes: {class: "w-24 mt-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
        onClick: () => {
            const gameName = document.getElementById("games").value
            if (!gameName) return alert("You need to select at least the game")

            if (gameName) {
                const state = document.getElementById("state").value.toLowerCase()
                const date = document.getElementById("dateInput").value
                const gameID = games.find(game => game.name === gameName).id
                let hashStr = `#sessions/${gameID}`
                if (state) hashStr += `&state=${state}`
                if (date) hashStr += `&date=${date}`
                hashStr += "&skip=0"
                window.location.hash = hashStr
            }
        }
    }, "Search")

    const searchWrapper = div({
        attributes: {class: "flex mb-72  flex-col items-center align-middle justify-center"}
    }, [searchMessage, appliedFiltersDiv, filterWrapper, dateWrapper, searchButton])

    return div({
        attributes: {class: "flex flex-col justify-between h-screen"}
    }, [navWrapper, searchWrapper])
}


function getSessionsView(returnedSessions, skip, isPlayerSessions = false) {
    const limit = 4;
    const sessions = returnedSessions


    const pageTitle = h1({
        attributes: {class: "flex text-white font-semibold text-4xl cursor-pointer select-none"},
        onClick: () => {
            window.location.hash = "sessionSearch"
        }
    }, "Sessions");

    const homeButton = button({
            attributes: {class: "w-24 ml-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = ""
            }
        },
        'Home')

    const navWrapper = div({attributes: {class: "m-5 flex flex-row justify-between"}}, [pageTitle, homeButton])

    let sessionCards = sessions.map(session => {
            const cardClass = session.state === "open" ? "flex w-56 flex-col items-center justify-center bg-gray-800 rounded-xl p-5 m-5 select-none" : "flex w-56 select-none flex-col items-center justify-center bg-gray-800 rounded-xl p-5 m-5 opacity-50"
            return li({attributes: {class: "flex flex-row items-center justify-center"}}, [
                div({attributes: {class: cardClass}}, [
                    h2({attributes: {class: "text-white text-2xl"}}, session.game.name),
                    h3({attributes: {class: "text-white text-lg"}}, session.players.length + " / " + session.numberOfPlayers),
                    h4({attributes: {class: "text-white text-lg"}}, session.state),
                    button({
                        attributes: {class: "w-24 mt-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
                        onClick: () => {
                            window.location.hash = `#session/${session.id}`
                        }
                    }, "Details")
                ])
            ])
        }
    )

    sessionCards = sessionCards.slice(0, limit)

    const sessionList = div({
        attributes: {class: "flex flex-row items-center justify-center"}
    }, [
        ul({attributes: {class: "flex flex-row"}}, sessionCards)
    ])

    const handleNextClick = () => {
        let hash = window.location.hash
        let parts = hash.split("/");
        console.log(parts)
        let id
        if (isPlayerSessions) {
            id = parts[2].split("&")[0]
        } else {
            id = parts[1].split("&")[0]
        }
        console.log(id)
        if (!isPlayerSessions) {
            window.location.hash = `#sessions/${id}&skip=${skip + limit}`
        } else {
            window.location.hash = `#players/sessions/${id}&skip=${skip + limit}`
        }
    }
    const handlePreviousClick = () => {
        let hash = window.location.hash
        let parts = hash.split("/");
        let id
        if (isPlayerSessions) {
            id = parts[2].split("&")[0]
        } else {
            id = parts[1].split("&")[0]
        }
        console.log(parts)
        console.log(id)
        if (!isPlayerSessions) {
            window.location.hash = `#sessions/${id}&skip=${skip - limit}`
        } else {
            window.location.hash = `#players/sessions/${id}&skip=${skip - limit}`
        }
    }
    const isFirstPage = skip === 0
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

    const isLastPage = returnedSessions.length - limit <= 0

    const nextButtonClass = isLastPage ? "flex rounded-3xl text-white font-semibold p-3 bg-gray-800 hover:bg-gray-800 pointer-events-none" :
        "flex rounded-3xl text-white font-semibold p-3 bg-gray-700 hover:bg-gray-800 "
    const nextButton = button({
        id: "nextButton",
        onClick: handleNextClick,
        attributes: {class: nextButtonClass}
    }, ">")
    nextButton.disabled = isLastPage

    let sessionsWrapper
    if (returnedSessions.length !== 0) {
        sessionsWrapper = div({
            attributes: {class: "flex justify-center items-center mt-56"}
        }, [previousButton, sessionList, nextButton])
    } else {
        sessionsWrapper = div({
            attributes: {class: "flex font-semibold text-white text-3xl justify-center items-center mt-72"}
        }, "No sessions found for this search criteria")
    }


    return div({}, [navWrapper, sessionsWrapper])
}

function getParticularSessionView(session,ownerID) {
    window.location.hash = "session/" + session.id
    const pageTitle = h1({
        attributes: {class: "flex text-white font-semibold text-4xl cursor-pointer select-none"},
        onClick: () => {
            window.location.hash = "sessions"
        }
    }, "Sessions");

    const homeButton = button({
            attributes: {class: "w-24 ml-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = ""
            }
        },
        'Home')

    const updateButton = button({
        attributes: {class:
                session.owner == ownerID ? "w-24 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900" : "hidden"
        },
        onClick: () => {
            window.location.hash = `#session/update/${session.id}`
        }
    }, "Update")

    console.log(session.owner == ownerID)

    const deleteButton = button({
        attributes: {
            class:
                session.owner == ownerID ? "w-24 mt-2 rounded-md shadow-md text-white font-semibold p-2 bg-red-700 hover:bg-red-900" : "hidden",
        },
        onClick: () => {
            window.location.hash = `#session/apply/delete/${session.id}`
    }
    }, "Delete")


    const navWrapper = div({attributes: {class: "m-5 flex flex-row justify-between"}}, [pageTitle, homeButton])

    const sessionGameTitle = h2({
        attributes: {class: "flex font-semibold text-white hover:text-gray-500 cursor-pointer text-6xl"},
        onClick: () => {
            window.location.hash = `#game/${session.game.id}`
        }
    }, session.game.name)

    const state = h3({
        attributes: {class: "flex mt-4 text-white text-2xl"}
    }, "State: " + session.state)

    const date = h4({
        attributes: {class: "flex mt-2 text-white text-xl"}
    }, session.date)

    const deleteCrossButton = (session,player) => {
        return session.owner == ownerID && player.id != ownerID && session.state !== "closed" ? h4({
            attributes: {
                class: "text-white ml-2 text-sm cursor-pointer select-none hover:text-gray-500",
            },
            onClick: () => {
                console.log(session)
                if (player.id == session.owner) {
                    alert("You cannot remove the owner of the session, please close the session instead")
                } else {
                    const hashStr = `#session/apply/remove-player/${ownerID}?sessionID=${session.id}&playerID=${player.id}`
                    console.log(hashStr)
                    window.location.hash = hashStr
                }
            }

        },"X") : h1({},"")
    }

    const playerPoolDiv = div({
        attributes: {
            class: "flex flex-col items-center justify-center bg-gray-800 rounded-xl p-5 m-5"
        }
    }, [
        h4({attributes: {class: "text-white text-lg"}}, "Players"),
        ul({attributes: {class: "flex flex-row items-center justify-center"}}, session.players.map(player =>
            li({attributes: {class: "flex flex-row items-center justify-center"}}, [
                div({
                    attributes: {class: "flex flex-row items-center justify-center hover:bg-gray-800 border border-gray-900 bg-gray-900 rounded-xl p-2 m-1"},

                }, [
                    button({
                        attributes: {class: "text-white text-lg"},
                        onClick: () => {
                            window.location.hash = `#players/${player.id}`
                        }
                    }, player.name),
                    deleteCrossButton(session,player)
                ])
            ])
        ))
    ])

    const detailsWrapper = div({
        attributes: {class: "flex flex-col items-center justify-center mt-48"}
    }, [sessionGameTitle, state, date, playerPoolDiv, updateButton,deleteButton])

    return div({}, [navWrapper, detailsWrapper])
}


function createSessionView(ownerID,games){

    let date = null;
    let numberOfPlayers = null;
    let gid = null;

    const pageTitle = h1({
        attributes: {class: "flex text-white font-semibold text-4xl cursor-pointer select-none"},
        onClick: () => {
            window.location.hash = "sessions"
        }
    }, "Create a session");

    const homeButton = button({
            attributes: {class: "w-24 ml-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = ""
            }
        },
        'Home')
    const navWrapper = div({attributes: {class: "m-5 flex flex-row justify-between"}}, [pageTitle, homeButton])

    const numberOfPlayersInput = input({
        attributes: {
            class: "flex bg-gray-800 w-56 text-white text-lg rounded-md p-2",
            placeholder:"Number of players",
            type: "number"
        },
        onChange : (e) => {
            numberOfPlayers = e.target.value
        }
    })

    const dateInput = input({
        attributes: {
            class: "flex bg-gray-800 w-56 text-white text-lg rounded-md p-2 mt-5",
            type: "date"
        },
        onChange : (e) => {
            date = e.target.value
        }
    })

    const availableGames = games.map(game => game.name)
    let options = availableGames.map(game =>
        option({
            attributes: {value: game}
        }, game))

    options = [option({attributes: {value: ""}}, "Game"), ...options]

    const gidInput = select({
        attributes: {
            id: "games",
            class: "w-32 mt-2 h-10 rounded-xl bg-gray-800 text-center text-white text-lg"
        },
        onChange: (e) => {
            let gameName = e.target.value
            gid = games.find(game => game.name === gameName).id
            console.log(gid)
        }
    }, options)


    const submitButton = button({
        attributes: {
            class: "w-24 mt-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900",

        },
        onClick: () => {
            console.log(numberOfPlayers, date, gid)

            if (!numberOfPlayers || !date || !gid) {
                return alert("You need to fill all the fields")
            } else if (numberOfPlayers < 1) {
                return alert("Number of players must be greater than 0")
            } else if (date < new Date().toISOString().split("T")[0]) {
                return alert("Date must be in the future")
            } else if (gid < 1) {
                return alert("Game ID must be greater than 0")
            } else if (isNaN(numberOfPlayers) || isNaN(gid)) {
                return alert("Number of players and Game ID must be numbers")
            } else {
                window.location.hash = `session/create/${ownerID}?numberOfPlayers=${numberOfPlayers}&date=${date}&gid=${gid}`
            }
        }
    }, "Create")

    const inputWrapper = div({
        attributes:
            {
                class:"flex flex-col items-center justify-center mt-48"
            }
    },[numberOfPlayersInput,dateInput,gidInput,submitButton])

    return div({class:"flex"},[navWrapper, inputWrapper])

}


export const sessionsView = {
    createSessionView: createSessionView,
    getSessionSearchView: getSessionSearchView,
    getSessionsView: getSessionsView,
    getParticularSessionView: getParticularSessionView,
    updateSessionView: updateSessionView,
}