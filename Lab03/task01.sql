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


CREATE TABLE REVIEWER(
    reviewer_id INTEGER NOT NULL AUTO_INCREMENT,
    reviewer_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(reviewer_id)
);

ALTER TABLE MOVIE AUTO_INCREMENT = 201;

INSERT INTO REVIEWER(reviewer_name) VALUES("Sarah Martinez");
INSERT INTO REVIEWER(reviewer_name) VALUES("Daniel Lewis");
INSERT INTO REVIEWER(reviewer_name) VALUES("Brittany Harris");

CREATE TABLE RATING(
    reviewer_id INTEGER,
    movie_id INTEGER,
    stars SMALLINT NOT NULL,
    PRIMARY KEY(reviewer_id)
);

ALTER TABLE RATING
ADD FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id);