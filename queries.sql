USE databass_db;

-- Find out how many songs each artist is accreditted to and rank them
SELECT a.artist_name AS "Artist Name", COUNT(s.song_id) AS "Accredations"
FROM artists a
LEFT JOIN accredation ac ON a.artist_id = ac.artist_id
LEFT JOIN songs s ON s.song_id = ac.song_id
GROUP BY a.artist_id, a.artist_name
ORDER BY COUNT(s.song_id) DESC;

-- Find a user's most listened to genre
SELECT user_id, genre AS "User's Top Genre"
FROM (SELECT p.user_id, gs.genre, COUNT(gs.genre) AS genre_count
    FROM playlists p
    LEFT JOIN existence e ON p.playlist_id = e.playlist_id
    RIGHT JOIN accredation ac ON e.song_id = ac.song_id
    RIGHT JOIN (SELECT a.artist_id, g.genre_name AS genre
        FROM artists a
        JOIN genres g ON a.genre_id = g.genre_id) AS gs ON gs.artist_id = ac.artist_id
    WHERE p.user_id = 1
    GROUP BY p.user_id, gs.genre
) t
ORDER BY genre_count DESC
LIMIT 1;

-- Find the total duration of all playlists for each user and rank them
SELECT user_id, SUM(duration) AS "total playlist time"
FROM playlists 
GROUP BY user_id
ORDER BY SUM(duration) DESC;

-- top 3 artist across all playlists based on songs
SELECT a.artist_name AS "Artist", COUNT(s.song_id) AS "Total Songs"
FROM artists a
JOIN accredation ac ON a.artist_id = ac.artist_id
JOIN songs s ON ac.song_id = s.song_id
JOIN existence e ON s.song_id = e.song_id
GROUP BY a.artist_id, a.artist_name
ORDER BY COUNT(s.song_id) DESC
LIMIT 3;

-- recommend other playlists based on shared genres
WITH playlist_genres AS (
    SELECT p.playlist_id, gs.genre, COUNT(gs.genre) AS genre_count
    FROM playlists p
    JOIN existence e ON p.playlist_id = e.playlist_id
    JOIN accredation ac ON e.song_id = ac.song_id
    JOIN (
        SELECT a.artist_id, g.genre_name AS genre
        FROM artists a
        JOIN genres g ON a.genre_id = g.genre_id
    ) gs ON ac.artist_id = gs.artist_id
    GROUP BY p.playlist_id, gs.genre
)
SELECT p1.playlist_id AS playlist_1,
       p2.playlist_id AS playlist_2,
       COUNT(*) AS shared_genres
FROM playlist_genres p1
JOIN playlist_genres p2 
     ON p1.genre = p2.genre AND p1.playlist_id < p2.playlist_id
GROUP BY p1.playlist_id, p2.playlist_id
ORDER BY shared_genres DESC;

-- Find an artist that exists in more than one playlist and how many playlists they are in.
SELECT a.artist_name, COUNT(DISTINCT e.playlist_id) AS playlist_count
FROM artists a
JOIN accredation ac ON a.artist_id = ac.artist_id
JOIN existence e ON ac.song_id = e.song_id
GROUP BY a.artist_name
ORDER BY playlist_count DESC
LIMIT 1;

-- Find how many playlists each user has created
SELECT CONCAT(u.first_name, ' ', u.last_name) AS "User Name", COUNT(p.playlist_id) AS "Total Playlists"
FROM users u
LEFT JOIN playlists p ON u.user_id = p.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY COUNT(p.playlist_id) DESC;

-- Find the distinct genres that appear in playlists and rank them
SELECT DISTINCT g.genre_name AS "Genre", COUNT(*) AS "Times In Playlists"
FROM genres g
JOIN artists a ON g.genre_id = a.genre_id
JOIN accredation ac ON a.artist_id = ac.artist_id
JOIN existence e ON ac.song_id = e.song_id
GROUP BY g.genre_id, g.genre_name
ORDER BY COUNT(*) DESC;

-- Find songs that are longer than the average song duration
SELECT s.song_title AS "Song Title", s.duration AS "Song Duration", al.album_title AS "Album"
FROM songs s
JOIN albums al ON s.album_id = al.album_id
WHERE s.duration > (
    SELECT AVG(duration)
    FROM songs
)
ORDER BY s.duration DESC;
