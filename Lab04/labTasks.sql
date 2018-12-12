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

CREATE TABLE REVIEWER(
    Reviewer_ID INTEGER NOT NULL AUTO_INCREMENT,
    Reviewer_Name VARCHAR(50) NOT NULL,
    PRIMARY KEY(Reviewer_ID)
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
    Rating_Date DATE
);

ALTER TABLE RATING
ADD FOREIGN KEY (Movie_ID) REFERENCES MOVIE(Movie_ID);

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

-- 1
SELECT * FROM movie;

-- 2
SELECT *
  FROM MOVIE
 WHERE Director = "James Cameron";

-- 3
SELECT *
  FROM MOVIE
 WHERE Director = "James Cameron" AND Year >= 2000;

-- 4
SELECT Stars
  FROM RATING;

-- 5
SELECT DISTINCT Stars
  FROM RATING;

-- 6
SELECT Movie_ID, Director
  FROM MOVIE;

-- 7
SELECT Movie_ID, Title, Year
  FROM MOVIE
 WHERE Director = "Steven Spielberg";

-- 8
SELECT *
  FROM MOVIE
  CROSS JOIN RATING;

-- 9
SELECT MOVIE.Movie_ID, MOVIE.Title
  FROM MOVIE
  CROSS JOIN (select Movie_ID, Reviewer_ID, Stars from RATING) new_table;
  
-- 10
SELECT MOVIE.Movie_ID, Title, Reviewer_ID, Stars
  FROM MOVIE
  INNER JOIN RATING
  WHERE MOVIE.Movie_ID = RATING.Movie_ID;

  -- 11
SELECT MOVIE.Movie_ID, Title, Reviewer_ID, Stars
  FROM MOVIE
  INNER JOIN RATING
  WHERE MOVIE.Movie_ID = RATING.Movie_ID AND Stars <= 3;

  -- 12
SELECT MOVIE.Movie_ID, Title, Reviewer_ID, Stars
  FROM MOVIE
  INNER JOIN RATING
  WHERE MOVIE.Movie_ID = RATING.Movie_ID AND Stars <= 4 AND Stars >= 2;
  
  -- 13
SELECT Reviewer_ID, MOVIE.Movie_ID
  FROM MOVIE
  INNER JOIN RATING
  WHERE MOVIE.Movie_ID = RATING.Movie_ID;

-- 14
SELECT MOVIE.Movie_ID, MOVIE.Movie_ID
  FROM MOVIE
  INNER JOIN RATING
  WHERE MOVIE.Movie_ID = RATING.Movie_ID;
  
-- 15
SELECT MOVIE.Movie_ID, MOVIE.Title, RATING.Reviewer_ID, Reviewer_Name, Stars
  FROM MOVIE, RATING
  INNER JOIN REVIEWER
  WHERE MOVIE.Movie_ID = RATING.Movie_ID AND RATING.Reviewer_ID = REVIEWER.Reviewer_ID;
  
-- 16
SELECT MOVIE.Movie_ID, MOVIE.Title, RATING.Reviewer_ID, Reviewer_Name, Stars
  FROM MOVIE, RATING
  INNER JOIN REVIEWER
  WHERE MOVIE.Movie_ID = RATING.Movie_ID AND RATING.Reviewer_ID = REVIEWER.Reviewer_ID AND Stars = 5;
  
-- 17
SELECT 
    MOVIE.Title, Reviewer_Name, Stars
FROM
    MOVIE,
    RATING
        INNER JOIN
    REVIEWER
WHERE
    MOVIE.Movie_ID = RATING.Movie_ID
        AND RATING.Reviewer_ID = REVIEWER.Reviewer_ID
        AND Rating_Date IS NULL;

-- 18
SELECT 
    MOVIE.Director
FROM
    MOVIE
WHERE
Director IS NOT NULL
UNION
SELECT 
    REVIEWER.Reviewer_Name
FROM
    RATING, MOVIE
        INNER JOIN
    REVIEWER
WHERE
    MOVIE.Movie_ID = RATING.Movie_ID
        AND RATING.Reviewer_ID = REVIEWER.Reviewer_ID;


-- 19
SELECT 
    Reviewer_ID, Reviewer_Name
FROM
    REVIEWER
WHERE
    Reviewer_Name LIKE "%Martinez%";

-- 20
SELECT 
    RATING.Reviewer_ID, Reviewer_Name, Movie_ID, Stars, Rating_Date
FROM
    RATING, REVIEWER
WHERE
	REVIEWER.Reviewer_ID = RATING.Reviewer_ID
    AND substring(Rating_Date, 9, 2) < '10';

-- 21
SELECT 
    RATING.Reviewer_ID, Reviewer_Name, Movie_ID, Stars, Rating_Date
FROM
    RATING, REVIEWER
WHERE
	REVIEWER.Reviewer_ID = RATING.Reviewer_ID
    AND dayofmonth(Rating_Date) < '10';

-- 22
UPDATE REVIEWER , RATING
SET 
    Stars = CONCAT(Stars + 1)
WHERE
    REVIEWER.Reviewer_Name = 'Brittany Harris'
        AND REVIEWER.Reviewer_ID = RATING.Reviewer_ID;

SELECT * FROM RATING;

-- 23
SELECT 
    MOVIE.Title, Reviewer_Name, Stars
FROM
    MOVIE, RATING, REVIEWER
WHERE
	REVIEWER.Reviewer_ID = RATING.Reviewer_ID AND
    MOVIE.Movie_ID = RATING.Movie_ID
ORDER BY
    MOVIE.Title ASC;

-- 24
SELECT 
    MOVIE.Title, Rating_Date, Stars
FROM
    MOVIE, RATING
WHERE
    MOVIE.Movie_ID = RATING.Movie_ID
ORDER BY
    MOVIE.Title ASC, Stars DESC, Rating_Date DESC;

-- 25
SELECT 
    MOVIE.Title, MOVIE.Year, MOVIE.Director
FROM
    MOVIE, REVIEWER
WHERE
    MOVIE.Director = REVIEWER.Reviewer_Name;