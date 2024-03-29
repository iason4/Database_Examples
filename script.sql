

CREATE TABLE games(
GAME_ID INTEGER,
HOME_TEAM_ID INTEGER,
VISITOR_TEAM_ID INTEGER,
SEASON INTEGER,
HOME_TEAM_WINS INTEGER,
PRIMARY KEY (GAME_ID)
);

CREATE TABLE teams(
TEAM_ID INTEGER,
NICKNAME TEXT,
YEARFOUNDED INTEGER,
CITY TEXT,
PRIMARY KEY (TEAM_ID)
);

CREATE TABLE players(
PLAYER_ID INTEGER,
PLAYER_NAME TEXT,
TEAM_ID INTEGER,
SEASON INTEGER,
FOREIGN KEY (TEAM_ID) REFERENCES teams (TEAM_ID),
PRIMARY KEY (PLAYER_ID)
);


CREATE TABLE games_detail(
GAME_ID INTEGER,
TEAM_ID INTEGER,
PLAYER_ID INTEGER,
MIN1 REAL,
PTS REAL,
REB REAL,
AST REAL,
STL REAL,
BLK REAL,
FOREIGN KEY (GAME_ID) REFERENCES games (GAME_ID),
FOREIGN KEY (TEAM_ID) REFERENCES teams (TEAM_ID),
FOREIGN KEY (PLAYER_ID) REFERENCES players (PLAYER_ID),
PRIMARY KEY (GAME_ID,TEAM_ID,PLAYER_ID)
);


--LOAD DATA LOCAL INFILE "games.csv" INTO TABLE games FIELDS TERMINATED BY "," ENCLOSED BY '\"' LINES TERMINATED BY "\n";
--LOAD DATA LOCAL INFILE "teams.csv" INTO TABLE teams FIELDS TERMINATED BY "," ENCLOSED BY '\"' LINES TERMINATED BY "\n";
--LOAD DATA LOCAL INFILE "players.csv" INTO TABLE players FIELDS TERMINATED BY "," ENCLOSED BY '\"' LINES TERMINATED BY "\n";
--LOAD DATA LOCAL INFILE "games_details.csv" INTO TABLE games_detail FIELDS TERMINATED BY "," ENCLOSED BY '\"' LINES TERMINATED BY "\n";


SELECT PLAYER_NAME,COUNT(DISTINCT GAME_ID)
FROM games_detail INNER JOIN players ON (players.PLAYER_ID = games_detail.PLAYER_ID)
WHERE PTS>=10 AND REB>=10 AND AST>=10
GROUP BY PLAYER_NAME
ORDER BY COUNT(DISTINCT GAME_ID) DESC
LIMIT 1;



SELECT teams.NICKNAME, games_detail.GAME_ID, SUM(games_detail.PTS)
FROM teams INNER JOIN games_detail ON (teams.TEAM_ID = games_detail.TEAM_ID)
GROUP BY games_detail.GAME_ID
ORDER BY SUM(games_detail.PTS) DESC
LIMIT 1;

SELECT w.NICKNAME,win.WINS/lose.LOSES from
(SELECT NICKNAME,COUNT(GAME_ID) AS WINS 
FROM  games JOIN teams ON (teams.TEAM_ID = games.HOME_TEAM_ID)
WHERE HOME_TEAM_WINS = 1
GROUP BY HOME_TEAM_ID) AS win INNER JOIN
(SELECT NICKNAME,COUNT(GAME_ID) AS LOSES 
FROM  games JOIN teams ON (teams.TEAM_ID = games.HOME_TEAM_ID)
WHERE HOME_TEAM_WINS = 0
GROUP BY HOME_TEAM_ID) AS lose ON (w.NICKNAME=l.NICKNAME);


SELECT games_detail.PLAYER_ID,PLAYER_NAME,SUM(PTS)
FROM players INNER JOIN games_detail ON players.PLAYER_ID = games_detail.PLAYER_ID
GROUP BY(games_detail.PLAYER_ID)
HAVING SUM(MIN)>80
ORDER BY SUM(PTS) DESC
LIMIT 1;












