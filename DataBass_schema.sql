DROP DATABASE IF EXISTS databass_db;
CREATE DATABASE databass_db;
USE databass_db;

-- TABLE:genre
CREATE TABLE genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL UNIQUE
);

-- TABLE: users
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- TABLE: artists
CREATE TABLE artists (
    artist_id INT PRIMARY KEY,
    genre_id INT NOT NULL,
    artist_name VARCHAR(150) NOT NULL,
    country VARCHAR(100) NOT NULL DEFAULT 'Unknown',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_artist_name UNIQUE (artist_name),
    CONSTRAINT fk_artist_genre
        FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);
-- TABLE: albums

CREATE TABLE albums (
    album_id INT PRIMARY KEY,
    artist_id INT NOT NULL,
    album_title VARCHAR(200) NOT NULL,
    duration DECIMAL(10,2),
    release_date DATE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_albums_artist
        FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    CONSTRAINT uq_album_artist_title UNIQUE (artist_id, album_title)
);
-- TABLE: songs
CREATE TABLE songs (
    song_id INT PRIMARY KEY,
    album_id INT NOT NULL,
    song_title VARCHAR(250) NOT NULL,
    duration DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_songs_album
        FOREIGN KEY (album_id) REFERENCES albums(album_id),
    CONSTRAINT uq_song_album_title UNIQUE (album_id, song_title),
    CONSTRAINT chk_song_duration CHECK (duration > 0)
);
-- TABLE: playlists
CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    playlist_name VARCHAR(150) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    duration DECIMAL(10,2) NOT NULL DEFAULT 0,
    CONSTRAINT fk_playlists_user
        FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT uq_user_playlist_name UNIQUE (user_id, playlist_name)
);
-- TABLE: existence
CREATE TABLE existence (
    existence_id INT PRIMARY KEY,
    song_id INT NOT NULL,
    playlist_id INT NOT NULL,
    CONSTRAINT fk_existence_song
        FOREIGN KEY (song_id) REFERENCES songs(song_id),
    CONSTRAINT fk_existence_playlist
        FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    CONSTRAINT uq_playlist_song UNIQUE (playlist_id, song_id)
);
-- TABLE: accredation
CREATE TABLE accredation (
    accredation_id INT PRIMARY KEY,
    song_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT fk_accredation_song
        FOREIGN KEY (song_id) REFERENCES songs(song_id),
    CONSTRAINT fk_accredation_artist
        FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    CONSTRAINT uq_song_artist UNIQUE (song_id, artist_id)
);

-- Trigger : checked
DROP TRIGGER IF EXISTS update_playlist_duration_after_insert;
DROP TRIGGER IF EXISTS update_playlist_duration_after_delete;
DROP TRIGGER IF EXISTS update_playlist_duration_after_update;
DELIMITER //
CREATE TRIGGER update_playlist_duration_after_insert
    AFTER INSERT
ON existence
FOR EACH ROW
BEGIN
    DECLARE song_duration DECIMAL(10,2);
    SELECT duration INTO song_duration FROM songs WHERE song_id = NEW.song_id;
    UPDATE playlists
    SET duration = duration + song_duration
    WHERE playlist_id = NEW.playlist_id;
END //

CREATE TRIGGER update_playlist_duration_after_delete
    AFTER DELETE
ON existence
FOR EACH ROW
BEGIN
    DECLARE song_duration DECIMAL(10,2);
    SELECT duration INTO song_duration FROM songs WHERE song_id = OLD.song_id;
    UPDATE playlists
    SET duration = duration - song_duration
    WHERE playlist_id = OLD.playlist_id;
END //

DELIMITER //
CREATE TRIGGER update_playlist_duration_after_update
    AFTER UPDATE ON existence
FOR EACH ROW
BEGIN
    DECLARE old_song_duration DECIMAL(10,2);
    DECLARE new_song_duration DECIMAL(10,2);
    SELECT duration INTO old_song_duration FROM songs WHERE song_id = OLD.song_id;
    SELECT duration INTO new_song_duration FROM songs WHERE song_id = NEW.song_id;
    UPDATE playlists
    SET duration = duration - old_song_duration + new_song_duration
    WHERE playlist_id = NEW.playlist_id;
END //
DELIMITER ;

-- Stored Procedure : add songs to playlist this is necessary to allow users to safely add a song to their
-- playlist without worrying about data integrity. 
DROP PROCEDURE IF EXISTS sp_add_song_to_playlist;

DELIMITER //

CREATE PROCEDURE sp_add_song_to_playlist(
    IN p_existence_id INT,
    IN p_song_id INT,
    IN p_playlist_id INT
)
BEGIN
    -- check song if exists
    IF NOT EXISTS (
        SELECT 1
        FROM songs
        WHERE song_id = p_song_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Song does not exist';

    -- check playlist if exists
    ELSEIF NOT EXISTS (
        SELECT 1
        FROM playlists
        WHERE playlist_id = p_playlist_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Playlist does not exist';

    -- check duplicate if song in same playlist
    ELSEIF EXISTS (
        SELECT 1
        FROM existence
        WHERE song_id = p_song_id
          AND playlist_id = p_playlist_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This song is already in the playlist';

    -- if everything is valid, intert it
    ELSE
        INSERT INTO existence (existence_id, song_id, playlist_id)
        VALUES (p_existence_id, p_song_id, p_playlist_id);
    END IF;
END //

DELIMITER ;

-- Function total song in playlist, this funciton is useful to get the total number of songs in a playlist.
DROP FUNCTION IF EXISTS fn_total_songs_in_playlist;

DELIMITER //

CREATE FUNCTION fn_total_songs_in_playlist(p_playlist_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total_songs INT;

    SELECT COUNT(*)
    INTO total_songs
    FROM existence
    WHERE playlist_id = p_playlist_id;

    RETURN COALESCE(total_songs, 0);
END //

DELIMITER ;