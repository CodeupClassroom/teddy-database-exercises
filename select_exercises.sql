-- The name of all albums by Pink Floyd.
SELECT 'The name of all albums by Pink Floyd' AS 'Exercise 1';

SELECT name FROM albums
WHERE artist = 'Pink Floyd';





-- The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT 'The year Sgt. Pepper''s Lonely Hearts Club Band was released' AS 'Exercise 2';

SELECT release_date FROM albums
WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';

-- The genre for Nevermind

SELECT 'The genre for Nevermind' AS 'Exercise 3';
SELECT genre FROM albums
WHERE name = 'Nevermind';


-- Which albums were released in the 1990s
SELECT 'Which albums were released in the 1990s' AS 'Exercise 4';

SELECT * FROM albums
WHERE release_date BETWEEN 1990 AND 1999;




-- Which albums had less than 20 million certified sales
SELECT 'Which albums had less than 20 million certified sales' AS 'Exercise 5';

SELECT * FROM albums
WHERE sales < 20\G


-- All the albums in the rock genre. Is this all the rock albums in the table?
SELECT 'All the albums in the rock genre. Is this all the rock albums in the table?' AS 'Exercise 6';

SELECT * FROM albums
WHERE genre = 'rock'\G

-- Using LIKE keyword
SELECT name, genre FROM albums
WHERE genre LIKE '%rock%';