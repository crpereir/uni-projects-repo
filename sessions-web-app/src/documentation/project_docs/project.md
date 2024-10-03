# Introduction

This document contains, in full detail, all aspects of development for Phase 1 and 2 of the LS Sessions API project.

The rest of this document will contain details about:

The backend:
- [The Database](the-database)
- [Backend Software Organization](backend-software-organization)


The frontend:
- [The Element Library](the-element-library)
- [Frontend Software Organization](frontend-software-organization)


Project considerations:
- [Critical Evaluation](critical-evaluation)

Each topic will cover it's own sub-topics associated with it.


# The Database

### The Conceptual Model

The following diagram showcases how our application handles data storage:

![DBFactory.png](https://cdn.jsdelivr.net/gh/CardosoDev04/cdn-test/DBFactory.png)


As we can see from the image above, we implemented both a PostgreSQL database and a Mock database. The PostgreSQL database is used for actual data the application stores and manages (final implementation of the application) and the MockDB is used mainly for testing purposes, having all it's data stored in memory and erased once the server process stops.

#### The DBFactory interface

In order to make this implementation seamless and not have to change the codebase each time we wish to alternate between the two models, we've implemented an interface named DBFactory.

This interface contains the declaration of all common methods between the DB and MockDB classes. Leaving the implementation of those methods to the respective classes.

This way, any time we wish to use say the MockDB , we just create an instance of it and use the same method names on the API handler calls.


#### The MockDB class

Our MockDB class, as mentioned before, implements the DBFactory methods using memory storage.

The class data it self is structured like so:
```Kotlin
class MockDB: DBFactory {
val sessions: mutableListOf<Session>
val games = mutableListOf<Game>
val players = mutableListOf<Player>
}
```
Each method then makes changes to these data structures according to each method's needs.

#### The DB class

Now this class is the most complicated database class we implemented. It serves as a direct connection to our PostgreSQL Database and all of it's methods follow the same structure:

- 1. Create a connection to the PostgreSQL database using JBDC
- 2. Follow the method logic and make changes / fetch data using SQL queries.
- 3. Return necessary data to be sent back to the handlers.

The actual DB class, similar to the MockDB class, contains the implementation of all the DBFactory methods.

## The ER Diagram

The following image showcases the PostgreSQL database Entity-Relationship model that we are using:

![ER_Diagram(1).png](https://cdn.jsdelivr.net/gh/CardosoDev04/cdn-test/ER_DIAGRAM.png)

We have to highlight that both the genre N-N association and the SESSION_PLAYER N-N association when translated to PostgreSQL were made into separate tables:
- A game_genre table
- And a session_player table


## The physical model

The physical scheme of the database, translated from that ER model presented earlier can be seen by these initialization scripts present in the project's pt.isel.ls.sql.init package:

Player scheme:
```SQL
BEGIN;

CREATE TABLE PLAYER(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    token VARCHAR(100) NOT NULL UNIQUE
);

COMMIT;
```
Game (And associated tables) scheme:
```SQL
BEGIN;

CREATE TABLE GAME(
    id        SERIAL PRIMARY KEY,
    name      VARCHAR(100) NOT NULL,
    developer VARCHAR(100) NOT NULL
);

CREATE TABLE GAME_GENRE(
    id    INT,
    genre VARCHAR(100) NOT NULL,
    FOREIGN KEY (id) REFERENCES GAME (id)
);

COMMIT;
```

Session (And associated tables) scheme:
```SQL
BEGIN;

DROP TABLE IF EXISTS SESSION_PLAYER;
DROP TABLE IF EXISTS SESSION;

CREATE TABLE SESSION(
                        id SERIAL PRIMARY KEY,
                        numberOfPlayers INT NOT NULL CHECK (numberOfPlayers > 0),
                        game INT NOT NULL,
                        date DATE NOT NULL,
                        FOREIGN KEY (game) REFERENCES GAME (id)
);

CREATE TABLE SESSION_PLAYER(
                               sessionId INT,
                               playerId INT,
                               PRIMARY KEY (sessionId, playerId),
                               FOREIGN KEY (sessionId) REFERENCES SESSION (id),
                               FOREIGN KEY (playerId) REFERENCES PLAYER (id)
);

COMMIT;
```



# Backend Software Organization

This next diagram shows how our application is structured:

![Application Structure.png](https://cdn.jsdelivr.net/gh/CardosoDev04/cdn-test/BACKEND_ORGANIZATION.png)


### The Open-API Spec
The Open-API YAML specification for our SessionsAPI can be found [here](..%2FAPI%2Fapi-documentation.yaml).

To highlight, we have to say that all fetch / get operations ,that return a dataset given a specific query are done so via specifying the needed parameters via  query string, all fetch / get operations that return only one piece of information (i.e Get Session Details) are done so by specifying the needed resource via path parameters.

This is also true for an additional functionality we've added (because we thought it was right to do so), the Delete Session route. In this case, the session to be deleted is also passed through path parameters.

### Request Handling

Let's go step-by-step on how a request get's handled from entry-point to client.

The request is done via HTTP and get's recieved by our server module who's code you can see [here](..%2F..%2Fmain%2Fkotlin%2Fpt%2Fisel%2Fls%2Fserver%2FsessionsServer.kt).

The server then logs the request in the server console and check's which route is compatible with it's set of predefined routes passed to it by the API module who's code you can see [here](..%2F..%2Fmain%2Fkotlin%2Fpt%2Fisel%2Fls%2Fapi%2FsessionsWebApi.kt).

Upon choosing the right set of routes, the API module than forwards the specific route taken to it's respective handler, present in the handlers API sub-module. This sub-module contains 3 files pertaining to the definition of each part of the application's route handlers.

The 3 parts of the application are:
- Player
- Game
- Sessions

For each handler defined in these files, there's code that first verifies the validity of the request, things like: Are all parameters valid? Are all required parameters included?...etc...

### Authentication

The server checks if the request has a valid token, by comparing the bearer token passed in the request header to the tokens stored in the database. If the token is not valid, the server will return a 401 Unauthorized error. Otherwise, the server will continue to process the request.

For this purpose, we implemented an authentication service, that calls the database method to check if the token is valid. We decided to implement this service in a separate class, to avoid direct contact between the handlers and the database, and also to make the code more organized.

## The domain classes

### Player
The Player.kt file contains two classes:
- Player data class

The first class will structure Player objects in our application.
It will contain all the information a Player needs to have according to our project requirements.
It will also contain data checks to verify the validity of player data in regards to business rules.

```Kotlin
data class Player(val id: Int, val name: String, val email: String, val token: String) {
    init {
        require(name.isNotEmpty()) { "Player name must not be empty" }
        require(email.isNotEmpty()) { "Player email must not be empty" }
        require(token.isNotEmpty()) { "Player token must not be empty" }
    }
}
```

### Game

The Game.kt file contains two classes: 
- Game data class

The game data class is the class that structures Game objects used in our application, it contains all pertinent information a Game needs to have according to the project requirements and also inside data checks to verify the validity of game data in regard to business rules.

Below, we can see the Game data class:
```Kotlin
data class Game(val id: Int, val name: String, val developer: String, val genres: Set<String>) {
    init {
        require(id > 0) { "Game id must be greater than 0" }
        require(name.isNotEmpty()) { "Game name must not be empty" }
        require(developer.isNotEmpty()) { "Game developer must not be empty" }
        require(genres.isNotEmpty()) { "Game genres must not be empty" }
    }
}
```

As we can see, the Game class has a similar structure to the Player and Session class, and does not allow for empty fields, to maintain data integrity.


### Session

The Session.kt file contains two classes:
- Session data class

The session data class is the class that structures Session objects using in our application, it contains all info a Session needs to have given by the project requirements and also inside data checks to once again verify the validity of session data in regards to business rules.

Here we can see the Session data class:
```Kotlin
data class Session (val id: Int, val numberOfPlayers: Int, val date: String, val game: Game, val players: List<Player>){
    init {
        require(numberOfPlayers > 0) { "Number of players must be greater than 0" }
        require(date.matches(Regex("\\d{4}-\\d{2}-\\d{2}"))) { "Date must be in the format YYYY-MM-DD" }
        require(players.size <= numberOfPlayers) { "Number of players must be greater than or equal to the number of players" }
        require(players.distinctBy { it.id }.size == players.size) { "Players must have unique IDs" }
        require(players.distinctBy { it.email }.size == players.size) { "Players must have unique emails" }
    }
}
```

### Continuing the forwarding...

We've implemented Domain Handler classes containing all handlers for each part of the application, these classes contain a DB object that defaults to a real DB but can be set as a MockDB for testing purposes.

Here's an example of a handler class:
```Kotlin
class PlayerHandler(private val db: DBFactory) {
    // ... Handler methods
}
```

After being called by the route handler, the domain handler methods call their respective database method pertaining to the respective route and perform data manipulation.


### The DB Module Data Getting and Handling

After being passed data onto by the Handler module, the database module will then, in its respective method, will then open a self-closing connection to the database using dataSource.connection.use {} through JBDC, and get all the required information from the physical database to complete the logic it needs.

The return data is then transformed into a DTO (Data Transfer Object), defined in the pt.isel.ls.domain.dtos package and passed back the way it came all the way to be presented by the server to the client.

This is where the only actual issue with our way of thinking arose.

We're told by the teacher that DTO's should only be created at the API level in order to showcase data to the client. In our project, we're creating them at an internal level and passing it through to the client the way back the request was forwarded in.

In this case, it's not too big of an issue and it's something we'll talk about more in [Critical Evaluation](critical-evaluation) but it will be fixed in upcoming phases.

### Connection Management

As mentioned before, all connections done to the DB are self-closing so we don't need to worry about closing connections manually since after they've been established and data has been retrieved they will close automatically.

All update queries are done using transactions, and are started and commited.

If a given transaction aborts or rolls back it will close the connection automatically.

### Error Handling

As mentioned earlier, error handling and data checking is done all throughout our application, in the Handler and Manager classes via try/catch block and require method's respectively to check all data and catch any exceptions without crashing the application on "error".

Specific exception messages are thrown so that they can be displayed by the logger and to the client in a formatted easy to understand way.


# The Element Library

The element library refers to the library developed by our group in order to facilitate the development and use of frontend components.

This library allows us to instantiate html components in Javascript without interacting with the DOM directly.

It's a simple library meant to mimic other libraries like React or Vue, but with a much simpler and more limited scope.

There are two files pertaining to the element library:
- Element.js
- Library.js

### Element.js

This file contains a single const export that is an array of the element names.
It's used by the Library.js file to create the elements.

### Library.js
The Library.js file contains the main logic of the library.

It has a function called initializeCreateElement that iterates through all the element names provided by Element.js and creates a function for each one of them.

This function is then exported and can be used to create elements in the frontend.

The example below demonstrates these exported functions with the creation of a div element:

```javascript
div({
    attributes: {
        class: "mt-10 text-white font-semibold"
    },
    onClick : () => {alert("a")},
    onChange : (e) => {alert(e)}
},"Hello World!")
```

Analyzing the above presented example we see it divided in parts:
- An optional object containing the attributes, onClick and onChange functions.
- An object or array containing the children of an element.

The onClick function receives no parameters and adds a click event listener to the element and executes a callback function when this event happens.

The onChange function receives an event (change event for example in an input) and executes a callback function that can (or not) use this event to alter behaviour.

This way we can get around the use of the DOM and create elements in a more organized and efficient way.

We can also easily make elements interactive and dynamic by using the onClick and onChange functions.

This is a step up (Phase 4) to the previous phases since now we can optionally include the first object and children, minimizing the boilerplate we have to write.


# Frontend Software Organization

The following diagram shows how our frontend application is structured:
![Frontend Structure.png](https://cdn.jsdelivr.net/gh/CardosoDev04/cdn-test/Frontend%20Structure.png)

Our application is a frontend web application and makes use of the View/ViewModel pattern making the client-side code more organized and easier to test and maintain.

This pattern also allows the client-side rendering to be separate from the business logic and data fetching.

## Index.js
Index.js is the main entry point of the frontend application from the client-side.

It's responsible for two tasks:
- Create the frontend routes using the Router module.
- Call the respective handler for each route passing it the URI data.

## Router
The Router class and module is responsible for creating a Map between URI routes and their respective handlers.
It serves as the intermediary between the index.js and the handlers.

## Handlers
The handlers are the main entry point for the frontend application to interact with the backend.

They are responsible for taking data inputed from index.js (taken from the browser URI and or cookies if applicable) and first calling the ViewModel to retrieve data to then call View to render the client-side page.

After the page is returned by the View module, handlers will then again call unto the same module to use the loadView() function which replaces the content in the mainDiv of the application index.html with the html generated for that page.

## ViewModel

ViewModel.js is an intermediary module between the handlers and the view and serves the purpose of fetching data through our API and passing it to the handlers so that they can construct the view using the View module.

This makes it so that ViewModel by nature, is asynchronous, different from the view itself.

## View

Our View module is split into five different files:
- gameViews.js
- playerViews.js
- sessionViews.js
- homeViews.js
- View.js

Each file contains the views for the respective entity, and the View.js file contains the main logic for rendering the views.
These views are created using the Element library we developed and are created at the Handler-level to be rendered by the client-side html

## Authentication
In this project, authentication is handled using tokens. A player's token is stored in the session storage of the browser under a storage key named 'token'.

When a user signs in or up, the server generates a *unique* token for that user and sends it back to the client. 

This token is then stored in the session storage of the browser. For each subsequent request, the client sends the token generated for his/her account in the authorization header of the request. 

On the server side, the token is validated. If the token is valid, the request is processed, otherwise, if the token is not valid or not present, the server responds with an error, and
the client is redirected to the login page.

Here is a diagram showcasing the Authentication flow of our application:
![Authentication.png](https://cdn.jsdelivr.net/gh/CardosoDev04/cdn-test/Authentication.png)


When a user signs up (creates an account) his/her password is stored securely in the database using the BCrypt hashing function with 13 rounds. This is a cryptographically secure and irreversible function that allows the passwords to be securely stored in the DB.

In case of a sign in, the password credentials inputted by the user get compared with those present in the database to confirm account identity. There are error messages for all types of user mistakes.

If a user wishes to sign out of the application he/her can do so explicitly using the "Sign Out" button on the top right of the User Home / Dashboard.

By pressing this button, the user triggers two actions:
- The removal of the "token" object from the session storage container
- Navigation to the landing page

## Testing

We've implemented a testing suite for the frontend application using Mocha and Chai.
There are tests for the element library and the view module and they can be run by acessing the index.html file in the test folder pertaining to the frontend SPA.



# Critical Evaluation

In this phase, we've managed to consolidate all of our work developed in previous phases of the project and deploy a robust and clean-looking web application.
We've hit all marks regarding the requirements and in our opinion have good code quality and structure.

