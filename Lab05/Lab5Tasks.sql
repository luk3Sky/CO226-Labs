USE E15142Lab04;

-- 1(a)
SELECT 
    *
FROM
    MOVIE AS M
WHERE
    M.Director = (SELECT DISTINCT
            Reviewer_Name
        FROM
            REVIEWER
                INNER JOIN
            MOVIE
        WHERE
            MOVIE.Director = REVIEWER.Reviewer_Name);

-- 1(b)
SELECT 
    *
FROM
    MOVIE AS M
WHERE
    M.Director <> (SELECT DISTINCT
            Reviewer_Name
        FROM
            REVIEWER
                INNER JOIN
            MOVIE
        WHERE
            MOVIE.Director = REVIEWER.Reviewer_Name);


-- 2(a)
SELECT 
    *
FROM
    RATING
WHERE
    Reviewer_ID = (SELECT 
            Reviewer_ID
        FROM
            REVIEWER
        WHERE
            REVIEWER.Reviewer_Name LIKE '%Sarah Martinez%');

-- 2(b)
SELECT 
    *
FROM
    RATING
WHERE
    Reviewer_ID <> (SELECT 
            Reviewer_ID
        FROM
            REVIEWER
        WHERE
            REVIEWER.Reviewer_Name LIKE '%Sarah Martinez%');


-- 3(a)
SELECT DISTINCT
    Movie_ID
FROM
    RATING
WHERE
    stars < (SELECT 
            MIN(stars)
        FROM
            RATING
        WHERE
            Movie_ID = 103);

-- 3(b)
SELECT DISTINCT
    Movie_ID
FROM
    RATING
WHERE
    stars <= (SELECT 
            MIN(stars)
        FROM
            RATING
        WHERE
            Movie_ID = 103)
        AND Movie_ID <> 103;

-- 3(c)
SELECT DISTINCT
    Movie_ID
FROM
    RATING
WHERE
    stars IN (SELECT 
            stars
        FROM
            RATING
        WHERE
            (Movie_ID = 103));
    
-- 3(d)
SELECT DISTINCT
    Movie_ID
FROM
    RATING
WHERE
    stars > (SELECT 
            MAX(stars)
        FROM
            RATING
        WHERE
            Movie_ID = 103);

-- 3(e)
SELECT DISTINCT
    Movie_ID
FROM
    RATING
WHERE
    stars >= (SELECT 
            MAX(stars)
        FROM
            RATING
        WHERE
            Movie_ID = 103);

-- 3(f)
SELECT DISTINCT
    Movie_ID
FROM
    RATING
WHERE
    stars NOT IN (SELECT 
            stars
        FROM
            RATING
        WHERE
            (Movie_ID = 103));

-- 4
SELECT DISTINCT
    Reviewer_ID
FROM
    RATING
WHERE
    Movie_ID IN (SELECT 
            Movie_ID
        FROM
            RATING)
        AND stars IN (SELECT 
            stars
        FROM
            RATING)
        AND Rating_Date = '2011-01-12';

-- 5(a)
SELECT 
    Rating_Date
FROM
    RATING
WHERE
    stars = 4 OR stars = 5
ORDER BY Rating_Date;

-- 5(b)
SELECT Rating_Date FROM RATING
	WHERE stars IN (SELECT stars WHERE stars >= 4)
    ORDER BY Rating_Date;
    
-- 6(a)
SELECT 
    Title
FROM
    MOVIE
WHERE
    Movie_ID NOT IN (SELECT 
            Movie_ID
        FROM
            RATING);

-- 6(b)
SELECT 
    Title
FROM
    MOVIE
WHERE
    Movie_ID NOT IN (SELECT 
            RATING.Movie_ID
        FROM
            RATING
        WHERE
            RATING.Movie_ID = MOVIE.Movie_ID);

-- 7(a)
SELECT 
    REVIEWER.Reviewer_Name
FROM
    REVIEWER
        INNER JOIN
    RATING ON REVIEWER.Reviewer_ID = RATING.Reviewer_ID
WHERE
    RATING.Rating_Date IS NULL;

-- 7(b)
SELECT 
    Reviewer_Name
FROM
    REVIEWER
WHERE
    Reviewer_ID IN (SELECT 
            Reviewer_ID
        FROM
            RATING
        WHERE
            Rating_Date IS NULL);
-- 7(c)
SELECT 
    Reviewer_Name
FROM
    REVIEWER
WHERE
    Reviewer_ID = (SELECT DISTINCT
            RATING.Reviewer_ID
        FROM
            RATING, REVIEWER
        WHERE
            Rating_Date IS NULL
            AND REVIEWER.Reviewer_ID = RATING.Reviewer_ID);

-- 8(a)
SELECT 
    MOVIE.Title, MAX(RATING.stars)
FROM
    RATING,
    MOVIE
WHERE
    RATING.Movie_ID = MOVIE.Movie_ID
GROUP BY RATING.Movie_ID
ORDER BY MOVIE.Title;

-- 8(b)
SELECT 
    MOVIE.Title, MIN(RATING.stars)
FROM
    RATING,
    MOVIE
WHERE
    RATING.Movie_ID = MOVIE.Movie_ID
GROUP BY RATING.Movie_ID
ORDER BY MOVIE.Title;

-- 8(c)
SELECT 
    MOVIE.Title, AVG(RATING.stars)
FROM
    RATING,
    MOVIE
WHERE
    RATING.Movie_ID = MOVIE.Movie_ID
GROUP BY RATING.Movie_ID
ORDER BY MOVIE.Title;

-- 8(d)
SELECT 
    MOVIE.Title, SUM(RATING.stars)
FROM
    RATING,
    MOVIE
WHERE
    RATING.Movie_ID = MOVIE.Movie_ID
GROUP BY RATING.Movie_ID
ORDER BY MOVIE.Title;

-- 8(e)
SELECT 
    MOVIE.Title, COUNT(RATING.stars)
FROM
    RATING,
    MOVIE
WHERE
    RATING.Movie_ID = MOVIE.Movie_ID
GROUP BY RATING.Movie_ID
ORDER BY MOVIE.Title;


-- 9(a)
SELECT 
    REVIEWER.Reviewer_Name
FROM
    REVIEWER,
    RATING
WHERE
    RATING.Reviewer_ID = REVIEWER.Reviewer_ID
GROUP BY REVIEWER.Reviewer_Name
HAVING COUNT(REVIEWER.Reviewer_ID) >= 3;

-- 9(b)
SELECT 
    Reviewer_Name
FROM
    REVIEWER
WHERE
    Reviewer_ID IN (SELECT 
            Reviewer_ID
        FROM
            RATING
        GROUP BY Reviewer_ID
        HAVING COUNT(*) >= 3);

-- 9(c)
SELECT 
    Reviewer_Name
FROM
    REVIEWER
WHERE
    Reviewer_ID IN (SELECT 
            Reviewer_ID
        FROM
            RATING
        GROUP BY Reviewer_ID
        HAVING COUNT(*) >= 3);
-- 10
SELECT 
    MOVIE.Movie_ID,
    MOVIE.Title,
    RATING.Reviewer_ID,
    RATING.stars AS Stars
FROM
    MOVIE
        INNER JOIN
    RATING
WHERE
    MOVIE.Movie_ID = RATING.Movie_ID;

-- 11
SELECT 
    MOVIE.Title AS Movie_Title, AVG(RATING.stars) AS AVG_Stars
FROM
    RATING,
    MOVIE
WHERE
    RATING.Movie_ID = MOVIE.Movie_ID
GROUP BY MOVIE.Movie_ID
ORDER BY AVG(RATING.stars) DESC , MOVIE.Title ASC;

-- 12
DELETE RATING FROM RATING
        INNER JOIN
    MOVIE ON MOVIE.Movie_ID = RATING.Movie_ID 
WHERE
    MOVIE.year < 1970 OR MOVIE.year > 2000;

SELECT DISTINCT
    *
FROM
    RATING
        INNER JOIN
    MOVIE ON RATING.Movie_ID = MOVIE.Movie_ID;
    
-- 13
DELETE RATING FROM RATING 
WHERE
    Rating_Date IS NULL;
    
SELECT * FROM RATING;

-- 14
INSERT INTO RATING(Reviewer_ID, Movie_ID, stars)
SELECT Reviewer_ID, Movie_ID, '5' FROM MOVIE CROSS JOIN REVIEWER WHERE Reviewer_Name = 'James Cameron';

SELECT * FROM RATING;

-- 15
UPDATE MOVIE 
SET 
    MOVIE.year = MOVIE.year + 25
WHERE
    MOVIE.Movie_ID IN (SELECT 
            RATING.Movie_ID
        FROM
            RATING
        GROUP BY RATING.Movie_ID
        HAVING AVG(RATING.stars) >= 4);

SELECT 
    *
FROM
    MOVIE;