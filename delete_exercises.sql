
-- Write SELECT statements for:

-- Albums released after 1991
SELECT name, release_date FROM albums
WHERE release_date > 1991;

-- Albums with the genre 'disco'
SELECT name, genre FROM albums
WHERE genre = 'disco';

-- Albums by 'Whitney Houston' (...or maybe an artist of your choice)
SELECT name, artist FROM albums
WHERE artist LIKE 'Whitney Houston%';



-- DELETEs

DELETE FROM albums
WHERE release_date > 1991;

DELETE FROM albums
WHERE genre = 'disco';

DELETE FROM albums
WHERE artist LIKE 'Whitney Houston%';

