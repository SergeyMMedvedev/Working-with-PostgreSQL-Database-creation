CREATE TABLE genres (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE collections (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    year INTEGER NOT NULL CHECK 
    (year > 1900 and year < 4000)
);
CREATE TABLE artists (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE albums (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NULL UNIQUE,
    year INTEGER NOT NULL CHECK 
    (year > 1900 and year < 4000)
);
CREATE TABLE songs (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    duration TIME NOT NULL, 
    album_id INTEGER NULL REFERENCES albums(id)
);
CREATE TABLE genres_and_artists (
    id SERIAL NOT NULL PRIMARY KEY,
    artist_id INTEGER NOT NULL REFERENCES artists(id),
    genre_id INTEGER NOT NULL REFERENCES genres(id)
);
CREATE TABLE albums_and_artists (
    id SERIAL NOT NULL PRIMARY KEY,
    album_id INTEGER NOT NULL REFERENCES albums(id),
    artist_id INTEGER NOT NULL REFERENCES artists(id)
);
CREATE TABLE collections_and_songs (
    id SERIAL NOT NULL PRIMARY KEY,
    song_id INTEGER NOT NULL REFERENCES songs(id),
    collection_id INTEGER NOT NULL REFERENCES collections(id)
);







