DELIMITER $$

CREATE PROCEDURE add_song_full(
    IN p_album INT,
    IN p_title VARCHAR(255),
    IN p_duration DECIMAL(5,2),
    IN p_artist_id INT
)
BEGIN
    DECLARE new_song_id INT;
    DECLARE new_accredation_id INT;

    SELECT IFNULL(MAX(song_id), 0) + 1 INTO new_song_id FROM songs;

    INSERT INTO songs (song_id, album, title, duration)
    VALUES (new_song_id, p_album, p_title, p_duration);

    SELECT IFNULL(MAX(accredation_id), 0) + 1 INTO new_accredation_id FROM accredation;

    INSERT INTO accredation (accredation_id, song_id, artist_id)
    VALUES (new_accredation_id, new_song_id, p_artist_id);

    SELECT new_song_id AS created_song_id;
END $$

DELIMITER ;