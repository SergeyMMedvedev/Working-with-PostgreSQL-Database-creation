INSERT INTO genres (id, name)
VALUES
    (1, 'Rock'),
    (2, 'Pop'),
    (3, 'Rap'),
    (4, 'Jazz'),
    (5, 'Metal');
    
INSERT INTO artists (id, name)
VALUES
    (1, 'Skrillex'),
    (2, 'Eminem'),
    (3, 'Metallica'),
    (4, 'Linkin Park'),
    (5, 'Hardwell'),
    (6, '50 Cent'),
    (7, 'Slipknot'),
    (8, 'Green Day');

INSERT INTO genres_and_artists (id, artist_id, genre_id)
VALUES
    (1, 1, 5),
    (2, 2, 3),
    (3, 3, 2),
    (4, 4, 1),
    (5, 5, 5),
    (6, 6, 3),
    (7, 7, 5),
    (8, 8, 1);
   
INSERT INTO albums (id, name, year)
VALUES
    (1, 'Relapse', 2009),
    (2, 'Ride the Lightning', 1984),
    (3, '21st Century Breakdown', 2009),
    (4, 'Dookie', 1994),
    (5, 'Death Magnetic', 2018),
    (6, 'Before I Self Destruct', 2009),
    (7, 'Meteora',2003),
    (8, 'Lowa', 2001);
    
INSERT INTO albums_and_artists (id, album_id, artist_id)
VALUES
    (1, 1, 5),
    (2, 2, 3),
    (3, 3, 2),
    (4, 4, 1),
    (5, 5, 5),
    (6, 6, 3),
    (7, 7, 5),
    (8, 8, 1);   

INSERT INTO songs (id, name, duration, album_id)
VALUES
    (1, 'Misery', '00:04:58', 1),
    (2, 'My Mom', '00:03:15', 3),
    (3, 'Know Your Enemy', '00:05:42', 6),
    (4, 'Coming Clean', '00:04:16', 8),
    (5, 'Ride the Lightning', '00:01:34', 5),
    (6, 'Beautiful', '00:02:53', 3),
    (7, 'Chump', '00:03:48', 8),
    (8, 'Fade to Black', '00:02:19', 5),
    (9, 'Runaway', '00:02:27', 1),
    (10, 'Peacemaker', '00:04:35', 6),
    (11, 'How', '00:03:44', 1),
    (12, 'Turn Your Back', '00:05:33', 4),
    (13, 'Tears Into Wine', '00:04:22', 4),
    (14, 'White Sparrows', '00:04:14', 4),
    (15, 'Womanizer', '00:02:25', 7);

INSERT INTO collections (id, name, year)
VALUES
    (1, 'Col 2009', 2009),
    (2, 'Rapz', 2003),
    (3, '1984', 1984),
    (4, 'Sadly', 2001),
    (5, 'Pop collection', 2000),
    (6, 'For sport', 2018),
    (7, 'Noize', 2000),
    (8, 'Random', 2020);   

INSERT INTO collections_and_songs (id, song_id, collection_id)
VALUES
    (1, 1, 1),
    (2, 2, 1),
    (3, 3, 1),
    (4, 3, 2),
    (5, 11, 3),
    (6, 2, 4),
    (7, 14, 5),
    (8, 8, 6),
    (9, 12, 7),
    (10, 8, 8);   
