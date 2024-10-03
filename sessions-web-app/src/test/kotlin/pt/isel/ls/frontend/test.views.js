import {div} from "../../../../../../../static-content/spa/lib/Library.js";
import {sessionsView} from "../../../../../../../static-content/spa/view/sessionsViews.js";
import {homeViews} from "../../../../../../../static-content/spa/view/homeViews.js";
import {playerViews} from "../../../../../../../static-content/spa/view/playerViews.js";

describe('Frontend View Tests', function () {

    it('createSessionView should return a div element with two children', function (){
        const ownerId = 1
        const games = [
            {
                id: 1,
                name: "game1",
                developer: "developer1",
                genres: ["FPS", "Action", "Strategy"]
            },
            {
                id: 2,
                name: "game2",
                developer: "developer2",
                genres: ["RPG", "Strategy"]
            },
            {
                id: 3,
                name: "game3",
                developer: "developer3",
                genres: ["Adventure"]
            }
        ]
        const view = sessionsView.createSessionView(ownerId, games);
        view.tagName.should.be.equal("DIV");
        view.children.length.should.be.equal(2);
    });

    it('getHomeView should return a div with two children, and its second child should have 5 children', function () {
        const mainDiv = div()
        const currentPlayer = {
            id: 1,
            name: "Test",
            email: "email@email.com"
        }
        const homeView = homeViews.getHomeView(mainDiv, currentPlayer)
        homeView.tagName.should.be.equal("DIV");
        homeView.children.length.should.be.equal(2);
        homeView.children[1].children.length.should.be.equal(6);
    })

    it('getSessionSearchView should return a div with two children', function () {
        const games = [
            {
                id: 1,
                name: "Test",
                description: "Test"
            }
        ]
        const sessionSearchView = sessionsView.getSessionSearchView(games);
        sessionSearchView.tagName.should.be.equal("DIV");
        sessionSearchView.children.length.should.be.equal(2);
    })

    it('playerSearchView should return a div with two children', function () {
        const playerSearchView = playerViews.playerSearchView();
        playerSearchView.tagName.should.be.equal("DIV");
        playerSearchView.children.length.should.be.equal(2);
    })

});