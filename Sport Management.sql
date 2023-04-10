create database SportsManagement;


CREATE TABLE Sports (
  sport_id INT IDENTITY (1,1) PRIMARY KEY,
  sport_name VARCHAR(255) NOT NULL,
  
);

CREATE TABLE Tournament (
  tournament_id INT IDENTITY (1,1) PRIMARY KEY,
  tournament_name VARCHAR(255) NOT NULL,
);

CREATE TABLE Tournament_Sport (
  id INT IDENTITY (1,1) PRIMARY KEY,
  tournament_id INT,
  sport_id INT,
  FOREIGN KEY (tournament_id) REFERENCES Tournament(tournament_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (sport_id) REFERENCES Sports(sport_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


SELECT t.tournament_name, s.sport_name 
FROM Tournament_Sport ts
JOIN Tournament t ON ts.tournament_id = t.tournament_id
JOIN Sports s ON ts.sport_id = s.sport_id;

CREATE TABLE Scoreboard (
  scoreboard_id INT IDENTITY (1,1) PRIMARY KEY,
  tournament_sport_id INT,
  team1_name varchar(30),
  team2_name varchar(30),
  team1_score INT DEFAULT 0,
  team2_score INT DEFAULT 0, 
  result varchar (30),
  FOREIGN KEY (tournament_sport_id) REFERENCES Tournament_Sport(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
);

  DROP TABLE Scoreboard;


alter table Scoreboard add  Result varchar(30);

INSERT INTO Sports (sport_name) VALUES 
('Football'),
('Basketball');

INSERT INTO Tournament (tournament_name) VALUES 
('Intra-College Football Tournament'),
('Inter-University Basketball Tournament');


INSERT INTO Tournament_Sport (tournament_id, sport_id) VALUES 
(1, 1),
(2, 2);

select * from Sports;
select * from Tournament;
select * from Tournament_Sport;
select * from Scoreboard;
/*
delete from Tournament where tournament_id = 3;
delete from Tournament where tournament_id = 4;
delete from Tournament where tournament_id = 5;
delete from Tournament where tournament_id = 6;
delete from Tournament where tournament_id = 7;
delete from Tournament where tournament_id = 8;
delete from Tournament where tournament_id = 9;
delete from Tournament where tournament_id = 13;
*/


