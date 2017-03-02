#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE TICTACTOE;
EOSQL

psql -v ON_ERROR_STOP=1 -d tictactoe -U "$POSTGRES_USER" <<-EOSQL
    DROP SCHEMA IF EXISTS TICTACTOE CASCADE;CREATE SCHEMA TICTACTOE;GRANT ALL ON SCHEMA TICTACTOE TO postgres;
    CREATE TABLE TICTACTOE.T_USERS ( id SERIAL NOT NULL PRIMARY KEY, login VARCHAR(18) NOT NULL,PASSWORD VARCHAR(18) NOT NULL, TOKEN VARCHAR(18), end_date TIMESTAMP WITH TIME ZONE);
    INSERT INTO TICTACTOE.T_USERS (login, password, token ) VALUES ('jsoto', 'jsoto', 'jsoto'), ('rparent', 'rparent', 'rparent'), ('ach', 'ach', 'ach');
    CREATE TABLE TICTACTOE.T_GAMES ( id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(18) NOT NULL, arcade BOOLEAN NOT NULL, size BIGINT, winner BIGINT, status VARCHAR(18) );
    INSERT INTO TICTACTOE.T_GAMES (name, arcade, size, status ) VALUES ('game_1', 'false', 3, 'open'), ('game_2', 'false', 5, 'open'), ('game_3', 'false', 4, 'open');
    CREATE TABLE TICTACTOE.T_GAME_USERS ( id SERIAL NOT NULL PRIMARY KEY, game_id BIGINT NOT NULL, user_id BIGINT NOT NULL, order_id BIGINT NOT NULL );
    INSERT INTO TICTACTOE.T_GAME_USERS (game_id, user_id, order_id ) VALUES (1, 1, 1), (1, 3, 2), (2, 2, 1), (2, 3, 2), (3, 1, 1), (3, 2, 2);
    CREATE TABLE TICTACTOE.T_GAME_DETAILS ( id SERIAL NOT NULL PRIMARY KEY, game_id BIGINT NOT NULL, user_id BIGINT NOT NULL, row_id BIGINT NOT NULL, column_id BIGINT NOT NULL );
    INSERT INTO TICTACTOE.T_GAME_DETAILS (game_id, user_id, row_id, column_id ) VALUES (1, 1, 1, 1), (1, 1, 2, 2), (1, 2, 3, 3), (1, 2, 2, 3), (1, 1, 1, 2)
EOSQL