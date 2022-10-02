CREATE TABLE genres (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NULL
);
CREATE TABLE collections (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    year INTEGER NOT NULL
);
CREATE TABLE artists (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NULL
);
CREATE TABLE albums (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NULL,
    year INTEGER NULL
);
CREATE TABLE songs (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NULL,
    duration INTEGER NOT NULL, 
    album_id INTEGER NULL REFERENCES albums(id)
);
CREATE TABLE genres_and_artists (
    id SERIAL NOT NULL PRIMARY KEY,
    artist_id INTEGER NULL REFERENCES artists(id),
    genre_id INTEGER NULL REFERENCES genres(id)
);
CREATE TABLE albums_and_artists (
    id SERIAL NOT NULL PRIMARY KEY,
    album_id INTEGER NULL REFERENCES albums(id),
    artist_id INTEGER NULL REFERENCES artists(id)
);
CREATE TABLE collections_and_songs (
    id SERIAL NOT NULL PRIMARY KEY,
    song_id INTEGER NULL REFERENCES songs(id),
    collection_id INTEGER NULL REFERENCES collections(id)
);







