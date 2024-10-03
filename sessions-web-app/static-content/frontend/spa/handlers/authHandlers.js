

import * as authViewModel from "../viewmodel/authViewModel.js";
import {views} from "../view/View.js";
import * as authViews from "../view/authViews.js";

async function loginPage(mainContent){
    const html = authViews.authView("login");
    views.loadView(html, mainContent);
}

async function signupPage(mainContent){
    const html = authViews.authView("signup");
    views.loadView(html, mainContent);
}

async function login(){
    const username = document.getElementById("usernameInput").value;
    const password = document.getElementById("passwordInput").value;
    const res = await (await authViewModel.login(username,password)).json();
    if(res.error){
        window.location.hash = "#auth/login/";
        alert("Failed to Sign in, please try again. Error message: " + res.error);
    }
    const token = res.token;
    console.log(token)
    const id_res = await (await authViewModel.getIdByToken(token)).json();
    const id = id_res.id;
    if(token.length === 0){
        alert("Invalid username or password");
        window.location.hash = "#auth/login/";
    } else {
        sessionStorage.setItem("token",token);
        window.location.hash = "home/" + id;
    }

}

async function signupSubmit() {
const username = document.getElementById("usernameInput").value;
    const password = document.getElementById("passwordInput").value;
    const email = document.getElementById("emailInput").value;
    const res = await (await authViewModel.signup(email,username,password)).json();
    if(res.error){
        window.location.hash = "#auth/signup/";
        alert("Failed to Sign up, please try again. Error message: " + res.error);
    }
    const token = res.token;
    const id_res = await (await authViewModel.getIdByToken(token)).json();
    const id = id_res.id;
    if(token.length === 0){
        alert("Invalid username or password");
        window.location.hash = "#auth/signup/";
    } else {
        sessionStorage.setItem("token",token);
        window.location.hash = "home/" + id;
    }
}

export const authHandlers = {
    loginPage,
    signupPage,
    login,
    signupSubmit
}