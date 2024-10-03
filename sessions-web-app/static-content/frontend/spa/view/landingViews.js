import {button, div, h1, img, p} from "../lib/Library.js";

function getLandingView(){
    const pageTitle = h1({
        attributes: {class: "flex text-white font-semibold text-4xl cursor-pointer select-none"}
    }, "Sessions Web App");

    const navLinks = div({
        attributes: {
            class : "flex flex-row gap-x-5 select-none"
        }
    },[
        h1({
            attributes: {
                class: "text-white font-semibold text-2xl hover:text-gray-500 cursor-pointer"
            },
            onClick : () => {
                window.location.hash = "sessionSearch"
            }
        }, "Sessions"),
        h1({
            attributes: {
                class: "text-white font-semibold text-2xl hover:text-gray-500 cursor-pointer"
            },
            onClick : () => {
                window.location.hash = "games"
            }
        }, "Games"),
        h1({
            attributes: {
                class: "text-white font-semibold text-2xl hover:text-gray-500 cursor-pointer"
            },
            onClick : () => {
                window.location.hash = "player-search"
            }
        }, "Players")

    ])

    const actionButtons = div(
        {
            attributes: {
                class : "flex flex-row gap-x-5 select-none px-10"
            }
        },
        [
            button({
                attributes: {
                    class: "w-24 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"
                },
                onClick: () => {
                    window.location.hash = "#auth/login/"
                }
            },"Sign in"),
            button({
                attributes: {
                    class: "w-24 rounded-md shadow-md text-white font-semibold p-2 bg-blue-700 hover:bg-blue-900"
                },
                onClick: () => {
                    window.location.hash = "#auth/signup/"
                }
            },"Sign up")
        ]
    )

    const navWrapper = div({
        attributes: {
            class: "w-full p-10 flex flex-row justify-between"
        }
    },[pageTitle,navLinks,actionButtons])


    const landingInfo = div({
        attributes: {
            class: "flex px-10 flex-row justify-center items-center gap-x-2 select-none"
        }
    },[
        div({
            attributes: {
                class: "flex ml-10 flex-col mb-20"
            }
        },[
            p({
                attributes: {
                    class: "p-10 text-white text-start font-semibold text-6xl"
                }
            },"Join your friends in epic all nighters!"),
            p({
                attributes: {
                    class: "p-10 text-white text-start font-semibold text-4xl"
                }
            },"Discover new games and create new memories.")
        ]),

        img({
            attributes: {
                src: "https://cdn.jsdelivr.net/gh/CardosoDev04/cdn-test/computer(1).png",
                alt: "computer with background",
                class: ""
            }
        })
    ])

    return div({},[navWrapper,landingInfo])
}

export const landingViews = {
    getLandingView
}