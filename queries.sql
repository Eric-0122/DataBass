USE databass_db;

-- Find out how many songs each artist is accreditted to and rank them
SELECT a.artist_name AS "Artist Name", COUNT(s.song_id) AS "Accredations"
FROM artists a
LEFT JOIN accredation ac ON a.artist_id = ac.artist_id
LEFT JOIN songs s ON s.song_id = ac.song_id
GROUP BY a.artist_id, a.artist_name
ORDER BY COUNT(s.song_id) DESC;

-- Find a user's most listened to genre
SELECT user_id, genre
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
--top 3 artist across playlist based on songs
SELECT a.name AS "Artist", COUNT(s.song_id) AS "Total Songs"
FROM artists a
JOIN accredation ac ON a.artist_id = ac.artist_id
JOIN songs s ON ac.song_id = s.song_id
JOIN existence e ON s.song_id = e.song_id
GROUP BY a.artist_id, a.name
ORDER BY COUNT(s.song_id) DESC
LIMIT 3;
--recommendation to other playlist
SELECT DISTINCT e1.playlist_id AS playlist_1,
                e2.playlist_id AS playlist_2
FROM existence e1
JOIN existence e2 
     ON e1.song_id = e2.song_id
WHERE e1.playlist_id <> e2.playlist_id;
--artist that exist in more than one playlist
SELECT a.name, COUNT(DISTINCT e.playlist_id) AS playlist_count
FROM artists a
JOIN accredation ac ON a.artist_id = ac.artist_id
JOIN existence e ON ac.song_id = e.song_id
GROUP BY a.name
ORDER BY playlist_count DESC
LIMIT 1;
