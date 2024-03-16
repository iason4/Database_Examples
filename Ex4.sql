.open Ex4.db
PRAGMA foreign_keys = ON;

CREATE TABLE Player(
Player_Name VARCHAR,
Birth_Date VARCHAR,
Country VARCHAR,
PRIMARY KEY (Player_Name)
);

CREATE TABLE Game(
Game_Name VARCHAR,
Description VARCHAR,
Review INT,
PRIMARY KEY (Game_Name)
);

CREATE TABLE Plays(
Player_Name VARCHAR,
Game_Name VARCHAR,
Play_Date VARCHAR,
Duration VARCHAR,
Player_level INT,
Points INT,
PRIMARY KEY (Player_Name,Game_Name),
FOREIGN KEY(Player_Name) REFERENCES Player(Player_Name)
on delete cascade
FOREIGN KEY(Game_Name) REFERENCES Game(Game_Name)
);

CREATE TABLE Subscription(
Player_Name VARCHAR,
Game_Name VARCHAR,
Sub_Date VARCHAR,
Sub_Duration INT,
Price INT,
PRIMARY KEY (Player_Name,Game_Name),
FOREIGN KEY(Player_Name) REFERENCES Player(Player_Name)
on delete cascade
FOREIGN KEY(Game_Name) REFERENCES Game(Game_Name)
);


CREATE TABLE Pays(
Player_Name VARCHAR,
PRIMARY KEY (Player_Name),
FOREIGN KEY(Player_Name) REFERENCES Player(Player_Name)
on delete cascade
);

CREATE TABLE Has(
Game_Name VARCHAR,
PRIMARY KEY (Game_Name),
FOREIGN KEY(Game_Name) REFERENCES Game(Game_Name)
on delete cascade
);

INSERT INTO Player VALUES('George','2001-09-26','Greece');
INSERT INTO Player VALUES('Jason','2001-01-11','Greece');
INSERT INTO Player VALUES('Nikoleta','2001-03-26','Greece');
INSERT INTO Player VALUES('Dora','2001-02-28','Greece');

INSERT INTO Game VALUES('LOL','RPG',3);
INSERT INTO Game VALUES('ZELDA','RPG',5);
INSERT INTO Game VALUES('R6','FPS',5);

INSERT INTO Plays VALUES('George','R6','2023-11-12','8PM to 10PM',63,3000);
INSERT INTO Plays VALUES('Jason','ZELDA','2023-10-20','6PM to 9PM',64,3001);
INSERT INTO Plays VALUES('Nikoleta','LOL','2022-12-12','8AM to 5PM',30,1900);
INSERT INTO Plays VALUES('Dora','LOL','2008-02-05','8AM to 8PM',30,15900);

INSERT INTO Subscription VALUES('George','R6','2023-10-20',30,12);
INSERT INTO Subscription VALUES('Jason','ZELDA','2019-12-18',30,50);
INSERT INTO Subscription VALUES('Nikoleta','LOL','2022-08-01',60,200);
INSERT INTO Subscription VALUES('Dora','LOL','2009-05-15',90,1500);

INSERT INTO Pays VALUES('George');
INSERT INTO Pays VALUES('Jason');
INSERT INTO Pays VALUES('Nikoleta');
INSERT INTO Pays VALUES('Dora');

INSERT INTO Has VALUES('LOL');
INSERT INTO Has VALUES('ZELDA');
INSERT INTO Has VALUES('R6');

--DELETE FROM Player WHERE Player_Name = 'George';

















