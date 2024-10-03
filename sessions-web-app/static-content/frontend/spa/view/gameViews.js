import {button, div, h1, h2, h3, input} from "../lib/Library.js";

function createGameView() {

    const genres = [
        "RPG",
        "Adventure",
        "Shooter",
        "Turn-Based",
        "Action",
        "FPS",
        "Strategy",
        "Simulation",
        "Sports",
    ]

    let name = "";
    let developer = "";
    let selectedGenres = [];

    const pageTitle = h1({
        attributes: {class: "flex text-white font-semibold text-4xl cursor-pointer select-none"},
        onClick: () => {
            window.location.hash = "#create-game"
        }
    }, "Create Game");

    const homeButton = button({
            attributes: {class: "w-24 ml-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = ""
            }
        },
        'Home')
    const navWrapper = div({attributes: {class: "m-5 flex flex-row justify-between"}}, [pageTitle, homeButton])

    const gameNameInput = input({
        attributes: {
            class: "flex bg-gray-800 text-white text-lg rounded-md w-56 p-2 mt-5",
            type: "text",
            placeholder: "Name"
        },
        onChange : (e) => {
            name = e.target.value
        }
    })

    const gameDeveloperInput = input({
        attributes: {
            class: "flex bg-gray-800 text-white text-lg rounded-md w-56 p-2 mt-5",
            type: "text",
            placeholder: "Developer"
        },
        onChange : (e) => {
            developer = e.target.value
        }
    });


    const genreButtons = genres.map(genre => button({
        attributes: {
            class: "w-32 mx-2 my-3 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"
        },
        onClick: (event) => {
            const genreIndex = selectedGenres.indexOf(genre);
            if (genreIndex > -1) {
                selectedGenres.splice(genreIndex, 1);
                const buttonElement = event.target;
                buttonElement.classList.remove('bg-blue-900');
                buttonElement.classList.add('bg-blue-700');
            } else {
                selectedGenres.push(genre);
                const buttonElement = event.target;
                buttonElement.classList.remove('bg-blue-700');
                buttonElement.classList.add('bg-blue-900');
            }
        }
    }, genre));

    const genreButtonsWrapper = div({
        attributes: {
            class: "grid grid-cols-3 items-center justify-center mt-5"
        }
    },[...genreButtons]);

    const createButton = button({
        attributes: {
            class: "w-24 mt-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900",
        },
        onClick: () => {
            console.log(name, developer, selectedGenres)
            if (!name) {
                return alert("Name is required")
            } else if (!developer) {
                return alert("Developer is required")
            } else if (genres.length === 0) {
                return alert("At least one genre is required")
            } else {
                window.location.hash = `create-game/?name=${name}&developer=${developer}&genres=${selectedGenres.join(',')}`
            }
        }
    }, "Create")

    const inputWrapper = div({
        attributes: { class:"flex flex-col items-center justify-center mt-48" }
    }, [gameNameInput, gameDeveloperInput, genreButtonsWrapper, createButton])

    return div({class: "flex"}, [navWrapper, inputWrapper]);
}

function getGameSearchView(notFound) {
    let name = "";
    let developer = "";
    let genres = "";

    function updateHash(name, developer, genres) {
        let hash = "#games/results/";

        if (name) {
            hash += `name=${name}`;
        }

        if (developer) {
            hash += name ? '&' : '';
            hash += `developer=${developer}`;
        }

        if (genres) {
            hash += developer ? '&' : '';
            hash += `genres=${genres.join(',')}`;
        }

        window.location.hash = hash;
    }

    const pageTitle = h1({
        attributes: {class: "flex text-white font-semibold text-4xl cursor-pointer select-none"},
        onClick: () => {
            window.location.hash = "#games"
        }
    }, "Games");

    const homeButton = button({
            attributes: {class: "w-24 ml-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = ""
            }
        },
        'Home')

    const navWrapper = div({attributes: {class: "m-5 flex flex-row justify-between"}}, [pageTitle, homeButton])

    const searchBar = div({
        attributes: {id: "game-search-bar", class: "flex flex-row items-center align-middle justify-center"}
    }, [
        input({
            attributes: {
                class: "w-42 m-1 h-10 rounded-xl bg-gray-800 text-center text-white text-lg",
                placeholder: "Name"
            },
            onChange: (e) => {
                name = e.target.value;
            }
        }),

        input({
            attributes: {
                class: "w-42 m-1 h-10 rounded-xl bg-gray-800 text-center text-white text-lg",
                placeholder: "Developer"
            },
            onChange: (e) => {
                developer = e.target.value;
            }
        }),

        input({
            attributes: {
                class: "w-42 m-1 h-10 rounded-xl bg-gray-800 text-center text-white text-lg",
                placeholder: "Genres"
            },
            onChange: (e) => {
                genres = e.target.value.split(',').map(genre => genre.trim());
            }
        }),
    ])

    const searchButton = button({
        attributes: {class: "w-24 mt-2 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
        onClick: () => {
            updateHash(name, developer, genres);
        }
    }, "Search")

    const searchWrapper = div({attributes: {class: "flex mb-80 flex-col items-center"}},
        [searchBar, searchButton]
    );

    const notFoundMessage = div({
        attributes: {class: "text-red-500 text-center"}
    }, "No games found");

    if (notFound) {
        return div({attributes: {class: "flex flex-col justify-between h-screen"}},
            [navWrapper, searchWrapper, notFoundMessage]
        );
    } else {
        return div({attributes: {class: "flex flex-col justify-between h-screen"}},
            [navWrapper, searchWrapper]
        );
    }
}

function getGameSearchResultView(games) {
    const pageTitle = h1({
        attributes: {class: "flex text-white font-semibold text-4xl cursor-pointer select-none"},
        onClick: () => {
            window.location.hash = "#games"
        }
    }, "Games");

    const homeButton = button({
            attributes: {class: "w-24 ml-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = ""
            }
        },
        'Home')

    const navWrapper = div({attributes: {class: "m-5 flex flex-row justify-between"}}, [pageTitle, homeButton])

    let gameCards = div({
        id: "game-cards",
        attributes: {
            class: "flex flex-row"
        }
    }, []);

    try {
        games.forEach(game => {
            const gameCard = div({
                attributes: {class: "flex m-2 shadow-md flex-row text-white bg-gray-800 border border-gray-800 cursor-pointer hover:bg-gray-900 rounded-2xl w-56 h-32 items-center align-middle justify-center"},
                onClick: () => {
                    window.location.hash = `#game/${game.id}?search=` + window.location.hash.split(`/`)[2];
                },
            }, [
                h3({
                    attributes: {class: "flex flex-col text-white font-semibold text-2xl"}
                }, game.name)
            ]);

            gameCards.appendChild(gameCard);
        })
    } catch (e) {
        console.error("Could not parse games: " + e);
    }

    const skip = 0
    const limit = 4
    const returnedSessions = games.slice(skip, skip + limit)
    const handleNextClick = () => {
        let hash = window.location.hash
        console.log(hash)
        let parts = hash.split("/");
        console.log(parts)
        let id = parts[1].split("&")[0];
        window.location.hash = `#sessions/${id}&skip=${skip + limit}`
    }
    const handlePreviousClick = () => {
        let hash = window.location.hash
        let parts = hash.split("/");
        let id = parts[1].split("&")[0];
        window.location.hash = `#sessions/${id}&skip=${skip - limit}`
    }
    const isFirstPage = skip === 0
    const previousClass = isFirstPage ? "flex rounded-3xl h-16 items-center text-white font-semibold p-3 bg-gray-800 hover:bg-gray-800 pointer-events-none" :
        "flex rounded-3xl h-16 items-center text-white font-semibold p-3 bg-gray-700 hover:bg-gray-800 "
    const previousButton = button({
        id: "previousButton",
        onClick: handlePreviousClick,
        attributes: {
            class: previousClass
        }
    }, "<")
    previousButton.disabled = isFirstPage

    const isLastPage = returnedSessions.length - limit <= 0

    const nextButtonClass = isLastPage ? "flex rounded-3xl text-center items-center h-16 text-white font-semibold p-3 bg-gray-800 hover:bg-gray-800 pointer-events-none" :
        "flex rounded-3xl text-white font-semibold h-16 items-center p-3 bg-gray-700 hover:bg-gray-800 "
    const nextButton = button({
        id: "nextButton",
        onClick: handleNextClick,
        attributes: {class: nextButtonClass}
    }, ">")
    nextButton.disabled = isLastPage

    const resultsWrapper = div({
        attributes: {class: "flex mt-56 flex-row items-center justify-center"}
    }, [previousButton, gameCards, nextButton])

    return div({},
        [navWrapper, resultsWrapper]
    );
}

function getParticularGameView(game, searchParams, comingFromSearch = true) {
    const pageTitle = h1({
        attributes: {class: "flex text-white font-semibold text-4xl cursor-pointer select-none"},
        onClick: () => {
            window.location.hash = "#games"
        }
    }, "Games");

    const homeButton = button({
            attributes: {class: "w-24 ml-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = ""
            }
        },
        'Home')

    const backButton = button({
            attributes: {class: "w-24 ml-5 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
            onClick: () => {
                window.location.hash = "games/results/" + searchParams
            }
        },
        'Back')

    let buttonWrapper;

    if (comingFromSearch) {
        buttonWrapper = div({attributes: {class: "flex flex-row justify-evenly"}}, [backButton, homeButton])
    } else {
        buttonWrapper = div({attributes: {class: "flex flex-row justify-evenly"}}, [homeButton])
    }

    const navWrapper = div({attributes: {class: "m-5 flex flex-row justify-between"}}, [pageTitle, buttonWrapper])

    const gameName = h1({
        attributes: {class: "text-white font-semibold text-6xl"}
    }, game.name);

    const gameDeveloper = h2({
        attributes: {class: "text-white text-3xl"}
    }, game.developer);

    const gameGenres = h3({
        attributes: {class: "text-white text-lg"}
    }, game.genres.join(", "));

    const gameInfo = div({
        attributes: {class: "flex flex-col items-center align-middle justify-center text-center"}
    }, [gameName, gameDeveloper, gameGenres])

    const sessionsButton = button({
        attributes: {class: "mt-3 w-24 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"},
        onClick: () => {
            window.location.hash = "sessions/" + game.id
        }
    }, 'Sessions');

    const gameInfoWrapper = div({
        attributes: {class: "flex flex-col align-middle mb-72 flex-col justify-center items-center"}
    }, [gameInfo, sessionsButton])

    return div({attributes: {class: "flex flex-col justify-between h-screen"}}, [navWrapper, gameInfoWrapper]);
}

export const gameViews = {
    createGameView: createGameView,
    getGameSearchView: getGameSearchView,
    getGameSearchResultView: getGameSearchResultView,
    getParticularGameView: getParticularGameView,
}
