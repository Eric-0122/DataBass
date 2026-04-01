DROP DATABASE IF EXISTS databass_db;
CREATE DATABASE databass_db;
USE databass_db;

--TABLE:genre
CREATE TABLE genre (
    genre_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    artist_id INT NOT NULL,
    CONSTRAINT fk_genre_artist
        FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
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
    name VARCHAR(150) NOT NULL,
    country VARCHAR(100) NOT NULL DEFAULT 'Unknown',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_artist_name UNIQUE (name)
);
-- TABLE: albums

CREATE TABLE albums (
    album_id INT PRIMARY KEY,
    artist_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    duration DECIMAL(10,2),
    release_date DATE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_albums_artist
        FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    CONSTRAINT uq_album_artist_title UNIQUE (artist_id, title)
);
-- TABLE: songs
CREATE TABLE songs (
    song_id INT PRIMARY KEY,
    album_id INT NOT NULL,
    title VARCHAR(250) NOT NULL,
    duration DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_songs_album
        FOREIGN KEY (album_id) REFERENCES albums(album_id),
    CONSTRAINT uq_song_album_title UNIQUE (album_id, title),
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

-- these triggers need to be check bc copiolit autofilled them
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
DELIMITER ;

DELIMITER //
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
DELIMITER ;

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
