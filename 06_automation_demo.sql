USE databass_db;

START TRANSACTION;
-- check how many songs we have first
SELECT fn_total_songs_in_playlist(172000) AS total_songs_before_insert;

-- showcase our adding song from to playlist procedure
SELECT playlist_id, playlist_name, duration
FROM playlists
WHERE playlist_id = 172000;

SET @new_existence_id = 999999;

CALL sp_add_song_to_playlist(@new_existence_id, 221, 172000);

SELECT playlist_id, playlist_name, duration
FROM playlists
WHERE playlist_id = 172000;

-- show it worked
SELECT fn_total_songs_in_playlist(172000) AS total_songs_after_insert;

-- show triggers work
UPDATE existence
SET song_id = 225
WHERE existence_id = @new_existence_id;

SELECT playlist_id, playlist_name, duration
FROM playlists
WHERE playlist_id = 172000;

-- insert trigger
INSERT INTO existence VALUES (8888,300,172000);

SELECT playlist_id, playlist_name, duration
FROM playlists
WHERE playlist_id = 172000;

-- delete trigger
DELETE FROM existence
WHERE existence_id = 8888;

SELECT playlist_id, playlist_name, duration
FROM playlists
WHERE playlist_id = 172000;

-- show the other procedure works
SELECT * 
FROM songs
WHERE album_id=120;

SELECT *
FROM accreditation
WHERE artist_id=91;

CALL add_song_full(120,'What You Need',3.17,91);

SELECT * 
FROM songs
WHERE album_id=120;

SELECT *
FROM accreditation
WHERE artist_id=91;
ROLLBACK;