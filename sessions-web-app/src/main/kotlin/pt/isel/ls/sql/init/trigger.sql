CREATE OR REPLACE FUNCTION update_session_state()
    RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.sessionId IS NOT NULL) THEN
        UPDATE session
        SET state = CASE
                        WHEN (SELECT COUNT(*) FROM session_player WHERE sessionId = NEW.sessionId) >= (SELECT numberOfPlayers FROM session WHERE id = NEW.sessionId) OR
                             (SELECT date FROM session WHERE id = NEW.sessionId) < CURRENT_DATE THEN 'closed'
                        ELSE 'open'
            END
        WHERE id = NEW.sessionId;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER session_state_trigger
    AFTER INSERT OR DELETE ON session_player
    FOR EACH ROW EXECUTE PROCEDURE update_session_state();


CREATE OR REPLACE FUNCTION player_already_exists() RETURNS TRIGGER AS $$
DECLARE c CURSOR FOR SELECT name, email, token FROM player;
        r RECORD;
BEGIN
    FOR r IN c LOOP
        IF r.name = NEW.name THEN
            RAISE EXCEPTION 'Player already exists';
        ELSIF r.email = NEW.email THEN
            RAISE EXCEPTION 'Email already exists';
        ELSIF r.token = NEW.token THEN
            RAISE EXCEPTION 'Token already exists';
        END IF;
    END LOOP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER check_player_name_trigger
BEFORE INSERT ON player
FOR EACH ROW EXECUTE FUNCTION player_already_exists();

CREATE OR REPLACE FUNCTION check_game_constraints() RETURNS TRIGGER AS $$
DECLARE c CURSOR FOR SELECT * FROM game;
        r RECORD;
BEGIN
    FOR r in c LOOP
        IF r.id = NEW.id THEN
            RAISE EXCEPTION 'Invalid game id';
        ELSIF r.name = NEW.name THEN
            RAISE EXCEPTION 'Game name already exists';
        END IF;
    END LOOP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER check_game_constraints_trigger
BEFORE INSERT ON game
FOR EACH ROW EXECUTE FUNCTION check_game_constraints();