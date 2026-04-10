USE databass_db;

START TRANSACTION;

SELECT playlist_id, playlist_name, duration
FROM playlists
WHERE playlist_id = 172000;

CALL sp_add_song_to_playlist(999999, 221, 172000);

SELECT playlist_id, playlist_name, duration
FROM playlists
WHERE playlist_id = 172000;

SELECT fn_total_songs_in_playlist(172000) AS total_songs_after_insert;

SET @new_existence_id = 999999;

UPDATE existence
SET song_id = 225
WHERE existence_id = @new_existence_id;

SELECT playlist_id, playlist_name, duration
FROM playlists
WHERE playlist_id = 172000;

DELETE FROM existence
WHERE existence_id = @new_existence_id;

SELECT playlist_id, playlist_name, duration
FROM playlists
WHERE playlist_id = 172000;

ROLLBACK;