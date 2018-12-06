CHAR(n) -- n length character
CLOB()  -- large text

FOREIGN KEY (FKEY) REFERENCES EMP(DTABLEPKEY) 
ON DELETE set default
ON UPDATE cascade 

-- CREATE DATABASE E15142;
USE e15142;
CREATE TABLE MOVIE (
    movie_id INTEGER AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    year INTEGER(4) NOT NULL,
    director VARCHAR(50),
    PRIMARY KEY(movie_id)
);

CREATE TABLE REVIEWER(
    reviewer_id INTEGER ,
    reviewer_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(reviewer_name)
);

CREATE TABLE RATING(
    reviewer_id INTEGER,
    movie_id INTEGER,
    stars SMALLINT(5) NOT NULL,
    PRIMARY KEY(reviewer_id),
    FOREIGN KEY movie_id REFERENCES MOVIE(movie_id)
);
