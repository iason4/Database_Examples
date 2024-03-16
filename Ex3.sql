.open Ex3.db
PRAGMA foreign_keys = ON;

CREATE TABLE Winery(
Brand VARCHAR,
Adress VARCHAR,
PRIMARY KEY (Brand)
);

CREATE TABLE Winery_Owner(
Brand VARCHAR,
Owner VARCHAR,
PRIMARY KEY (Brand,Owner),
FOREIGN KEY(Brand) REFERENCES Winery(Brand)
on delete cascade
on update cascade
);

CREATE TABLE Vineyard(
Brand VARCHAR,
Place VARCHAR,
ID INT,
Type_Grape VARCHAR,
Acre INT,
PRIMARY KEY (Brand,Place,ID),
FOREIGN KEY(Brand) REFERENCES Winery(Brand)
on delete cascade
on update cascade
);

CREATE TABLE Grapes(
Year INT,
Quantity INT,
PRIMARY KEY (Year)
);

CREATE TABLE Produce(
Brand VARCHAR,
Place VARCHAR,
ID INT,
Year INT,
Start_Date VARCHAR,
End_Date VARCHAR,
PRIMARY KEY (Brand,Place,ID,Year),
FOREIGN KEY(Brand,Place,ID) REFERENCES Vineyard(Brand,Place,ID)
on delete cascade
on update cascade
FOREIGN KEY(Year) REFERENCES Grapes(Year)
on delete cascade
on update cascade
);

INSERT INTO Winery VALUES('Piccolo Mondo','Italy');
INSERT INTO Winery VALUES('Kyr Gianni','Greece');
INSERT INTO Winery VALUES('Alfa','Greece');

INSERT INTO Winery_Owner VALUES('Piccolo Mondo','Mario');
INSERT INTO Winery_Owner VALUES('Kyr Gianni','John');
INSERT INTO Winery_Owner VALUES('Alfa','George');

INSERT INTO Vineyard VALUES('Piccolo Mondo','Milano',15000,'Red',15044640);
INSERT INTO Vineyard VALUES('Kyr Gianni','Macedonia',13050,'Roze',350640);
INSERT INTO Vineyard VALUES('Alfa','Amuntaio',19120,'Roze',450540);

INSERT INTO Grapes VALUES(2019,16500);
INSERT INTO Grapes VALUES(2021,4800);
INSERT INTO Grapes VALUES(2022,8600);

INSERT INTO Produce VALUES('Piccolo Mondo','Milano',15000,2019,'2019-08-25','2019-09-15');
INSERT INTO Produce VALUES('Kyr Gianni','Macedonia',13050,2021,'2021-08-29','2019-09-20');
INSERT INTO Produce VALUES('Alfa','Amuntaio',19120,2022,'2022-08-30','2019-09-20');

--DELETE FROM Vineyard WHERE Place = 'Amuntaio';

--UPDATE Winery SET Brand = 'Biblia Xora' WHERE Brand = 'Alfa';
































