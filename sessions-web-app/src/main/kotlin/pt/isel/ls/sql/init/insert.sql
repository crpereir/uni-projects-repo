BEGIN;

insert into player (name, email, token) values
    ('player1', 'player1@example.pt', 'player1_token'),
    ('player2', 'player2@example.pt', 'player2_token'),
    ('player3', 'player3@example.pt', 'player3_token'),
    ('player4', 'player4@example.pt', 'player4_token'),
    ('player5', 'player5@example.pt', 'player5_token'),
    ('player6', 'player6@example.pt', 'player6_token'),
    ('player7', 'player7@example.pt', 'player7_token'),
    ('player8', 'player8@example.pt', 'player8_token'),
    ('player9', 'player9@example.pt', 'player9_token'),
    ('player_test', 'playerTest@example.pt', 'test_token');

insert into player_pass (token, password) values
    ('player1_token', '$2a$13$69WF75WMWC26m5V7FlCJNej.X12AqAIFv6iH3LsU0Eyqjm1JIbhXu'),
    ('player2_token', '$2a$13$TOW3lskxoZqSDlnUp9RVXudGICosUkQYVAOhcon4uod2KfZZEuMzO'),
    ('player3_token', '$2a$13$70bXwe/KfLys01BN7v6Aq.CF5/CIeY.Wh202Ea3elvNN7kn3qQ.Jy'),
    ('player4_token', '$2a$13$xg/qrXsP2dPNPOCg6QUSquMsZRuC1fNcM9XvE4DpgxG6adsXy4cgO'),
    ('player5_token', '$2a$13$mpW0pW3PLjr7NAsBoYWK6eJZEI5o1q40wJACdX.Dqj1apoXCzFGV.'),
    ('player6_token', '$2a$13$YNkjIGUYLTnxS6R5w5/F7egJP7mS8cGL82pEDTcul97Q74SxS5Qja'),
    ('player7_token', '$2a$13$UQHdhzXtIHkOoi8MdpiZbeZhzi4dnlp5n16rbg/UkIkPdJ3rfmd.q'),
    ('player8_token', '$2a$13$B0rDZVR0YEZYBFhfivP44.phXbvYz9XmZzMtzpu62jZPLmxsiXnLS'),
    ('player9_token', '$2a$13$MwgiD4xnSkLqAfmYXl52ZulCgD895dh8R26NWs4U73SAYA2vUBoTu');


insert into game (name, developer) values
    ('game1', 'developer1'),
    ('game2', 'developer2'),
    ('game3', 'developer3'),
    ('game4', 'developer4'),
    ('game5', 'developer5');

insert into game_genre (id, genre) values
    (1, 'FPS'),
    (1, 'Action'),
    (1, 'Strategy'),
    (2, 'RPG'),
    (2, 'Strategy'),
    (3, 'Adventure'),
    (4, 'Action'),
    (5, 'Strategy'),
    (5, 'Turn-Based');

insert into session (numberOfPlayers, game, date,owner) values
    (4, 1, '2022-12-01',1),
    (3, 2, '2022-12-02',2),
    (5, 3, '2022-12-03',4);

insert into session_player (sessionId, playerId) values
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (2, 1),
    (2, 2),
    (2, 3),
    (3, 1),
    (3, 2),
    (3, 3),
    (3, 4),
    (3, 5);

COMMIT;