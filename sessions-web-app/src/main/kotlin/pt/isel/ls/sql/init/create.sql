BEGIN;

drop table if exists game_genre cascade;
drop table if exists game cascade;
drop table if exists session_player cascade;
drop table if exists session cascade;
drop table if exists player cascade;

CREATE TABLE PLAYER(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    token VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE PLAYER_PASS(
    token VARCHAR(100) PRIMARY KEY,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE GAME(
    id        SERIAL PRIMARY KEY,
    name      VARCHAR(100) NOT NULL,
    developer VARCHAR(100) NOT NULL
);

CREATE TABLE GAME_GENRE(
    id    INT,
    genre VARCHAR(100) NOT NULL CHECK (genre in (
         'RPG',
         'Adventure',
         'Shooter',
         'Turn-Based',
         'Action',
         'FPS',
         'Strategy'
    )),
    FOREIGN KEY (id) REFERENCES GAME (id)
);

CREATE TABLE SESSION(
                        id SERIAL PRIMARY KEY,
                        numberOfPlayers INT NOT NULL CHECK (numberOfPlayers > 0),
                        game INT NOT NULL,
                        date DATE NOT NULL,
                        state varchar(100) NOT NULL default 'open',
                        owner INT NOT NULL,
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