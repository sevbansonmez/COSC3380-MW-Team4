CREATE TABLE SONG (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(20) NOT NULL,
    user_id INT NOT NULL,
    album_id INT,
    file_path VARCHAR(200),
    length_seconds INT NOT NULL,
    uploaded DATETIME DEFAULT CURRENT_TIMESTAMP,
    size INT NOT NULL,
    rating FLOAT NOT NULL DEFAULT(3.0),
    PRIMARY KEY (id)
);

CREATE TABLE USER (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE ALBUM (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(20) NOT NULL,
    user_id INT NOT NULL,
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE PLAYLIST (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(20) NOT NULL,
    user_id INT NOT NULL,
    song_count INT NOT NULL DEFAULT(0),
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE TAG (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE RATING (
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    rating INT NOT NULL
);

CREATE TABLE STREAM (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    date_streamed DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE ALBUM_TAG (
    album_id INT NOT NULL,
    tag_id INT NOT NULL
);

CREATE TABLE SONG_TAG (
    song_id INT NOT NULL,
    tag_id INT NOT NULL
);

CREATE TABLE SONG_PLAYLIST (
    playlist_id INT NOT NULL,
    song_id INT NOT NULL
);

ALTER TABLE SONG
ADD FOREIGN KEY (user_id) REFERENCES USER(id),
ADD FOREIGN KEY (album_id) REFERENCES ALBUM(id);

ALTER TABLE ALBUM
ADD FOREIGN KEY (user_id) REFERENCES USER(id);

ALTER TABLE PLAYLIST
ADD FOREIGN KEY (user_id) REFERENCES USER(id);

ALTER TABLE RATING
ADD FOREIGN KEY (user_id) REFERENCES USER(id),
ADD FOREIGN KEY (song_id) REFERENCES SONG(id),
ADD PRIMARY KEY (user_id, song_id);

ALTER TABLE STREAM
ADD FOREIGN KEY (user_id) REFERENCES USER(id),
ADD FOREIGN KEY (song_id) REFERENCES SONG(id);

ALTER TABLE ALBUM_TAG
ADD FOREIGN KEY (album_id) REFERENCES ALBUM(id),
ADD FOREIGN KEY (tag_id) REFERENCES TAG(id),
ADD PRIMARY KEY (album_id, tag_id);

ALTER TABLE SONG_TAG
ADD FOREIGN KEY (song_id) REFERENCES ALBUM(id),
ADD FOREIGN KEY (tag_id) REFERENCES TAG(id),
ADD PRIMARY KEY (song_id, tag_id);

ALTER TABLE SONG_PLAYLIST
ADD FOREIGN KEY (song_id) REFERENCES SONG(id),
ADD FOREIGN KEY (playlist_id) REFERENCES PLAYLIST(id),
ADD PRIMARY KEY (song_id, playlist_id);


ALTER TABLE SONG
ADD COLUMN rating FLOAT NOT NULL;