CREATE DATABASE E15142Lab04;
USE E15142Lab04;
CREATE TABLE MOVIE (
    movie_id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    year INTEGER(4) NOT NULL,
    director VARCHAR(50),
    PRIMARY KEY(movie_id)
);

ALTER TABLE MOVIE AUTO_INCREMENT = 101;

INSERT INTO MOVIE(title, year, director) VALUES("Gone with the Wind", 1939, "Victor Fleming");
INSERT INTO MOVIE(title, year, director) VALUES("Star Wars", 1977, "George Lucas");
INSERT INTO MOVIE(title, year, director) VALUES("The Sound of Music", 1965, "Robert Wise");
INSERT INTO MOVIE(title, year, director) VALUES("E.T.", 1982, "Steven Speilberg");
INSERT INTO MOVIE(title, year, director) VALUES("Titanic", 1997, "James Cameron");
INSERT INTO MOVIE(title, year) VALUES("Snow White", 1937);
INSERT INTO MOVIE(title, year, director) VALUES("Avatar", 2009, "James Cameron");
INSERT INTO MOVIE(title, year, director) VALUES("Raiders of the Lost Ark", 1981, "Steven Speilberg");

CREATE TABLE REVIEWER(
    reviewer_id INTEGER NOT NULL AUTO_INCREMENT,
    reviewer_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(reviewer_id)
);

ALTER TABLE REVIEWER AUTO_INCREMENT = 201;

INSERT INTO REVIEWER(reviewer_name) VALUES("Sarah Martinez");
INSERT INTO REVIEWER(reviewer_name) VALUES("Daniel Lewis");
INSERT INTO REVIEWER(reviewer_name) VALUES("Brittany Harris");
INSERT INTO REVIEWER(reviewer_name) VALUES("Mike Anderson");
INSERT INTO REVIEWER(reviewer_name) VALUES("Chris Jackson");
INSERT INTO REVIEWER(reviewer_name) VALUES("Elizabeth Thomas");
INSERT INTO REVIEWER(reviewer_name) VALUES("James Cameron");
INSERT INTO REVIEWER(reviewer_name) VALUES("Ashley White");

CREATE TABLE RATING(
    reviewer_id INTEGER,
    movie_id INTEGER,
    stars SMALLINT NOT NULL,
    rating_date DATE
);

ALTER TABLE RATING
ADD FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id);

INSERT INTO RATING(reviewer_id, movie_id, stars, rating_date) VALUES(201, 101, 2, "2011-01-22");
INSERT INTO RATING(reviewer_id, movie_id, stars, rating_date) VALUES(201, 101, 4, "2011-01-27");
INSERT INTO RATING(reviewer_id, movie_id, stars) VALUES(202, 106, 4);
INSERT INTO RATING(reviewer_id, movie_id, stars, rating_date) VALUES(203, 103, 2, "2011-01-20");
INSERT INTO RATING(reviewer_id, movie_id, stars, rating_date) VALUES(203, 108, 4, "2011-01-12");
INSERT INTO RATING(reviewer_id, movie_id, stars, rating_date) VALUES(203, 108, 2, "2011-01-30");
INSERT INTO RATING(reviewer_id, movie_id, stars, rating_date) VALUES(204, 101, 3, "2011-01-09");
INSERT INTO RATING(reviewer_id, movie_id, stars, rating_date) VALUES(205, 103, 3, "2011-01-27");
INSERT INTO RATING(reviewer_id, movie_id, stars, rating_date) VALUES(205, 104, 2, "2011-01-22");
INSERT INTO RATING(reviewer_id, movie_id, stars) VALUES(205, 108, 4);
INSERT INTO RATING(reviewer_id, movie_id, stars, rating_date) VALUES(206, 107, 3, "2011-01-15");
INSERT INTO RATING(reviewer_id, movie_id, stars, rating_date) VALUES(206, 106, 5, "2011-01-19");
INSERT INTO RATING(reviewer_id, movie_id, stars, rating_date) VALUES(207, 107, 5, "2011-01-20");
INSERT INTO RATING(reviewer_id, movie_id, stars, rating_date) VALUES(208, 104, 3, "2011-01-02");

-- 1
SELECT * FROM movie;

-- 2
SELECT *
  FROM MOVIE
 WHERE director = "James Cameron";

-- 3
SELECT *
  FROM MOVIE
 WHERE director = "James Cameron" AND year >= 2000;

-- 4
SELECT stars
  FROM RATING;

-- 5
SELECT DISTINCT stars
  FROM RATING;

-- 6
SELECT movie_id, director
  FROM MOVIE;

-- 7
SELECT movie_id, title, year
  FROM MOVIE
 WHERE director = "Steven Spielberg";

-- 8
SELECT *
  FROM MOVIE
  CROSS JOIN RATING;

-- 9
SELECT MOVIE.movie_id, MOVIE.title
  FROM MOVIE
  CROSS JOIN (select movie_id, reviewer_id, stars from RATING) new_table;
  
-- 10
SELECT MOVIE.movie_id, title, reviewer_id, stars
  FROM MOVIE
  INNER JOIN RATING
  WHERE MOVIE.movie_id = RATING.movie_id;

  -- 11
SELECT MOVIE.movie_id, title, reviewer_id, stars
  FROM MOVIE
  INNER JOIN RATING
  WHERE MOVIE.movie_id = RATING.movie_id AND stars <= 3
  ORDER BY movie_id;

  -- 12
SELECT MOVIE.movie_id, title, reviewer_id, stars
  FROM MOVIE
  INNER JOIN RATING
  WHERE MOVIE.movie_id = RATING.movie_id AND stars <= 4 AND stars >= 2
  ORDER BY movie_id;
  
  -- 13
SELECT reviewer_id, MOVIE.movie_id
  FROM MOVIE
  INNER JOIN RATING
  WHERE MOVIE.movie_id = RATING.movie_id
  ORDER BY reviewer_id;

-- 14
SELECT MOVIE.movie_id, MOVIE.movie_id
  FROM MOVIE
  INNER JOIN RATING
  WHERE MOVIE.movie_id = RATING.movie_id
  ORDER BY reviewer_id;
  
-- 15
SELECT MOVIE.movie_id, MOVIE.title, RATING.reviewer_id, reviewer_name, stars
  FROM MOVIE, RATING
  INNER JOIN REVIEWER
  WHERE MOVIE.movie_id = RATING.movie_id AND RATING.reviewer_id = REVIEWER.reviewer_id
  ORDER BY movie_id;
  
-- 16
SELECT MOVIE.movie_id, MOVIE.title, RATING.reviewer_id, reviewer_name, stars
  FROM MOVIE, RATING
  INNER JOIN REVIEWER
  WHERE MOVIE.movie_id = RATING.movie_id AND RATING.reviewer_id = REVIEWER.reviewer_id AND stars = 5
  ORDER BY movie_id;
  
-- 17
SELECT 
    MOVIE.title, reviewer_name, stars
FROM
    MOVIE,
    RATING
        INNER JOIN
    REVIEWER
WHERE
    MOVIE.movie_id = RATING.movie_id
        AND RATING.reviewer_id = REVIEWER.reviewer_id
        AND rating_date IS NULL
ORDER BY MOVIE.movie_id;

-- 18
SELECT 
    director
FROM
    MOVIE
        INNER JOIN
    REVIEWER
WHERE
    MOVIE.movie_id = RATING.movie_id
        AND RATING.reviewer_id = REVIEWER.reviewer_id
        AND director IS NOT NULL
UNION
SELECT 
    reviewer_name
FROM
    RATING
        INNER JOIN
    REVIEWER
WHERE
    MOVIE.movie_id = RATING.movie_id
        AND RATING.reviewer_id = REVIEWER.reviewer_id
        AND director IS NOT NULL;