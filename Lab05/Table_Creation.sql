CREATE DATABASE E15142Lab04;
USE E15142Lab04;
CREATE TABLE MOVIE (
    Movie_ID INTEGER NOT NULL AUTO_INCREMENT,
    Title VARCHAR(50) NOT NULL,
    Year INTEGER(4) NOT NULL,
    Director VARCHAR(50),
    PRIMARY KEY(Movie_ID)
);

ALTER TABLE MOVIE AUTO_INCREMENT = 101;

INSERT INTO MOVIE(Title, Year, Director) VALUES("Gone with the Wind", 1939, "Victor Fleming");
INSERT INTO MOVIE(Title, Year, Director) VALUES("Star Wars", 1977, "George Lucas");
INSERT INTO MOVIE(Title, Year, Director) VALUES("The Sound of Music", 1965, "Robert Wise");
INSERT INTO MOVIE(Title, Year, Director) VALUES("E.T.", 1982, "Steven Speilberg");
INSERT INTO MOVIE(Title, Year, Director) VALUES("Titanic", 1997, "James Cameron");
INSERT INTO MOVIE(Title, Year) VALUES("Snow White", 1937);
INSERT INTO MOVIE(Title, Year, Director) VALUES("Avatar", 2009, "James Cameron");
INSERT INTO MOVIE(Title, Year, Director) VALUES("Raiders of the Lost Ark", 1981, "Steven Speilberg");

CREATE TABLE REVIEWER (
    Reviewer_ID INTEGER NOT NULL AUTO_INCREMENT,
    Reviewer_Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (Reviewer_ID)
);

ALTER TABLE REVIEWER AUTO_INCREMENT = 201;

INSERT INTO REVIEWER(Reviewer_Name) VALUES("Sarah Martinez");
INSERT INTO REVIEWER(Reviewer_Name) VALUES("Daniel Lewis");
INSERT INTO REVIEWER(Reviewer_Name) VALUES("Brittany Harris");
INSERT INTO REVIEWER(Reviewer_Name) VALUES("Mike Anderson");
INSERT INTO REVIEWER(Reviewer_Name) VALUES("Chris Jackson");
INSERT INTO REVIEWER(Reviewer_Name) VALUES("Elizabeth Thomas");
INSERT INTO REVIEWER(Reviewer_Name) VALUES("James Cameron");
INSERT INTO REVIEWER(Reviewer_Name) VALUES("Ashley White");

CREATE TABLE RATING(
    Reviewer_ID INTEGER,
    Movie_ID INTEGER,	
    Stars SMALLINT NOT NULL,
    Rating_Date DATE,
    FOREIGN KEY (Movie_ID) REFERENCES MOVIE(Movie_ID)
    ON DELETE CASCADE
);

INSERT INTO RATING(Reviewer_ID, Movie_ID, Stars, Rating_Date) VALUES(201, 101, 2, "2011-01-22");
INSERT INTO RATING(Reviewer_ID, Movie_ID, Stars, Rating_Date) VALUES(201, 101, 4, "2011-01-27");
INSERT INTO RATING(Reviewer_ID, Movie_ID, Stars) VALUES(202, 106, 4);
INSERT INTO RATING(Reviewer_ID, Movie_ID, Stars, Rating_Date) VALUES(203, 103, 2, "2011-01-20");
INSERT INTO RATING(Reviewer_ID, Movie_ID, Stars, Rating_Date) VALUES(203, 108, 4, "2011-01-12");
INSERT INTO RATING(Reviewer_ID, Movie_ID, Stars, Rating_Date) VALUES(203, 108, 2, "2011-01-30");
INSERT INTO RATING(Reviewer_ID, Movie_ID, Stars, Rating_Date) VALUES(204, 101, 3, "2011-01-09");
INSERT INTO RATING(Reviewer_ID, Movie_ID, Stars, Rating_Date) VALUES(205, 103, 3, "2011-01-27");
INSERT INTO RATING(Reviewer_ID, Movie_ID, Stars, Rating_Date) VALUES(205, 104, 2, "2011-01-22");
INSERT INTO RATING(Reviewer_ID, Movie_ID, Stars) VALUES(205, 108, 4);
INSERT INTO RATING(Reviewer_ID, Movie_ID, Stars, Rating_Date) VALUES(206, 107, 3, "2011-01-15");
INSERT INTO RATING(Reviewer_ID, Movie_ID, Stars, Rating_Date) VALUES(206, 106, 5, "2011-01-19");
INSERT INTO RATING(Reviewer_ID, Movie_ID, Stars, Rating_Date) VALUES(207, 107, 5, "2011-01-20");
INSERT INTO RATING(Reviewer_ID, Movie_ID, Stars, Rating_Date) VALUES(208, 104, 3, "2011-01-02");