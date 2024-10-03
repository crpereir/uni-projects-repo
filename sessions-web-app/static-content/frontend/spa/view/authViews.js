import {button, div, h1, h2, input, p, span} from "../lib/Library.js";

function authView(type){

    let username = ""
    let password = ""
    let email = ""
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const passwordRegex = /^(?=.*\d)[\w\d!@#$%^&*]{8,}$/;

    const weakPasswordRegex = /^[a-z\d]*$/;
    const goodPasswordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]*$/;
    const excellentPasswordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]*$/;
    let points;




    let passwordStrength = div({
        attributes: {
            id: "passwordStrength",
            class : "flex flex-row gap-x-1 " + (type === "login" ? "hidden" : "")
        }
    });
    function testPoints(){
        points = 0;
        if (weakPasswordRegex.test(password)) {
            points = 0;
        }
        if (goodPasswordRegex.test(password)) {
            points = 1;
        }
        if (excellentPasswordRegex.test(password)) {
            points = 2;
        }
    }

    function getPasswordStrengthDenominator(){
        if(points == 0) return "Weak";
        if(points == 1) return "Good";
        if(points == 2) return "Excellent";
    }

    function getPasswordStrength(){
        return div({
            attributes: {
                class: "flex flex-col items-center justify-start align-middle",
                id: "passwordStrength"
            }
        }, [
            h2({
                attributes: {
                    class: `font semibold text-md text-${points == 0 ? "red-500" : (points == 1 ? "yellow-500" : "green-500")}`
                }
            },getPasswordStrengthDenominator()),
            div({
                attributes: {
                    class :"flex flex-row gap-x-1"
                }
            },[
                div({
                    attributes: {
                        class: `w-10 mt-2 h-1 bg-${points == 0 ? "red-500" : (points == 1 ? "yellow-500" : "green-500")}`,
                        id: "poor-strength"
                    }
                }),
                div({
                    attributes: {
                        class: `w-10 mt-2 h-1 bg-${points > 0 ? (points == 1 ? "yellow-500" : "green-500"): "gray-500"}`,
                        id: "good-strength"
                    }
                }),
                div({
                    attributes: {
                        class: `w-10 mt-2 h-1 bg-${points == 2 ? "green-500" : "gray-500"}`,
                        id: "excellent-strength"
                    }
                })
            ])

        ])
    }

    function updatePasswordStrength() {
        const passwordStrengthDiv = document.getElementById("passwordStrength");
        passwordStrengthDiv.innerHTML = getPasswordStrength().innerHTML;
    }



    const pageTitle = h1({
        attributes: {class: "flex text-white font-semibold text-4xl cursor-pointer select-none"},
        onClick: () => {
            window.location.hash = "#"
        }
    }, "Sessions Web App");
    const navWrapper = div({attributes: {class: "flex flex-row p-10 w-full justify-between"}}, [pageTitle])

    const titleClass = type === "login" ? " mt-5" : " mt-10";

    const title = h1({
        attributes: {
            class: "h-16 mb-5 font-semibold text-5xl bg-clip-text text-transparent bg-gradient-to-br from-blue-500 from-0% via-indigo-400 via-50% to-indigo-200 to-70%" + titleClass
        }
    },type === "login" ? "Sign in." : "Sign up.")

    const userNameInput = div({
        attributes: {
            class: "flex flex-col gap-y-2 justify-start items-start"
        }
    },[
        h1({
            attributes: {
                class: "flex text-white font-semibold text-xl"
            }
        },"Username"),
        input({
            attributes: {
                class: "border text-white bg-black border-white rounded-lg p-2",
                placeholder: "Enter your username",
                id: "usernameInput"
            },
            onChange : (e) => {
                username = e.target.value
            }
        })])

    const passwordInput = div({
        attributes: {
            class: "flex flex-col gap-y-2 justify-start items-start"
        }
    },[
        h1({
        attributes: {
            class: "flex text-white font-semibold text-xl"
        }
    },"Password"),
        input({
        attributes: {
            class: "border text-white bg-black border-white rounded-lg p-2",
            placeholder: "Enter your password",
            id: "passwordInput",
            type: "password"
        },
        onChange : (e) => {
            password = e.target.value
            testPoints()
            updatePasswordStrength()
        }
    })])

    const emailInput = div({
        attributes: {
            class: "flex flex-col gap-y-2 justify-start items-start" + (type === "login" ? " hidden" : "")
        }
    },[
        h1({
            attributes : {
                class: "flex text-white font-semibold text-xl"
            }
        },"Email"),
        input({
            attributes: {
                class: "border text-white bg-black border-white rounded-lg p-2",
                placeholder: "Enter your email",
                type: "email",
                id: "emailInput"
            },
            onChange : (e) => {
                email = e.target.value
            }
        })
    ])

    const switchQuestion = p({
        attributes: {
            class: "text-white"
        }
    }, [
        type === "login" ? "Don't have an account? " : "Already have an account? ",
        span({
            attributes: {
                class: "text-blue-500 cursor-pointer hover:text-blue-700"
            },
            onClick : () => {
                if(type === "login"){
                    window.location.href = "#auth/signup/"
                } else {
                    window.location.href = "#auth/login/"
                }
            }
        }, type === "login" ? "Sign up" : "Sign in")
    ]);

    const submitButton = button({
        attributes: {
            class: "mt-5 bg-gradient-to-br from-blue-700 from-0% via-indigo-600 via-50% to-indigo-300 to-70% text-white text-2xl font-semibold rounded-lg p-2 w-36 hover:bg-gradient-to-br hover:from-blue-900 hover:from-0% hover:via-indigo-800 hover:via-50% hover:to-indigo-500 hover:to-70% hover:transform hover:scale-110 transition transition-transform duration-300 ease-in-out cursor-pointer",
        },
        onClick : () => {
            if(type === "login"){
                if(username.length === 0 || password.length === 0){
                    alert("Please fill in all fields")
                } else {
                    window.location.href = "#auth/login/submit/"
                }
            } else {
                if(username.length === 0 || password.length === 0 || email.length === 0){
                    alert("Please fill in all fields")
                } else {
                    if(!emailRegex.test(email)){
                        alert("Invalid email format")
                    } else if(!passwordRegex.test(password)){
                        alert("Password must contain at least 8 characters and a number")
                    }
                    else {
                        window.location.href = "#auth/signup/submit/"
                    }
                }
            }
        }
    },type === "login" ? "Sign in" : "Sign up")



    const form = div({
        attributes: {
            class: "flex mb-10 flex-col gap-y-5 justify-center items-center"
        }
    },[emailInput,userNameInput,passwordInput,passwordStrength,switchQuestion,submitButton])


    const modal = div({
        attributes: {
            class: "flex mb-40 drop-shadow-2xl flex-col bg-black justify-center items-center text-center h-3/5 w-1/4 rounded-2xl"
        }
    },[title,form])

    return div({
        attributes: {
            class: "flex flex-col justify-between items-center h-screen"
        }
    },[navWrapper,modal])
}


export {
    authView
}