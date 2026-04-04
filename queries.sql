USE databass_db;

-- Find out how many songs each artist is accreditted to and rank them
SELECT a.name AS "Artist Name", COUNT(s.song_id) AS "Accredations"
FROM artists a
LEFT JOIN accredation ac ON a.artist_id = ac.artist_id
LEFT JOIN songs s ON s.song_id = ac.song_id
GROUP BY a.artist_id, a.name
ORDER BY COUNT(s.song_id) DESC;

-- Find a user's most listened to genre
SELECT user_id, genre
FROM (SELECT p.user_id, gs.genre, COUNT(gs.genre) AS genre_count
    FROM playlists p
    LEFT JOIN existence e ON p.playlist_id = e.playlist_id
    RIGHT JOIN accredation ac ON e.song_id = ac.song_id
    RIGHT JOIN (SELECT a.artist_id, g.name AS genre
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