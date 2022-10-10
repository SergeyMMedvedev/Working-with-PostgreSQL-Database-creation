-- название и год выхода альбомов, вышедших в 2018 году; --
SELECT name, year FROM albums
WHERE year = 2018;


-- название и продолжительность самого длительного трека; --
SELECT name, duration FROM songs
ORDER BY duration DESC
LIMIT 1;

-- название треков, продолжительность которых не менее 3,5 минуты; --
SELECT name FROM songs
WHERE duration > '00:03:30';


-- названия сборников, вышедших в период с 2018 по 2020 год включительно; --
SELECT name FROM collections
WHERE year BETWEEN 2018 AND 2020;

-- исполнители, чье имя состоит из 1 слова; --
SELECT name FROM artists
WHERE name NOT LIKE '% %';


-- название треков, которые содержат слово "мой"/"my". --
SELECT name FROM songs
WHERE name LIKE'%my%' OR name LIKE '%мой%';

-- Продвинутая выборка данных --

-- 1. количество исполнителей в каждом жанре;
SELECT g."name", count(*) FROM artists a 
JOIN genres_and_artists gaa ON a.id = gaa.artist_id 
JOIN genres g ON g.id = gaa.genre_id 
GROUP BY g."name" 

-- 2. количество треков, вошедших в альбомы 2019-2020 годов;
SELECT count(*) AS "2019-2020 traks count" FROM songs s 
JOIN albums a ON s.album_id = a.id 
WHERE a."year" BETWEEN 2019 AND 2020

-- 3 средняя продолжительность треков по каждому альбому;
SELECT a."name" AS "album name", AVG(s.duration) AS "avg duration" FROM songs s 
JOIN albums a ON a.id = s.album_id 
GROUP BY a."name" 

-- 4. все исполнители, которые не выпустили альбомы в 2020 году;
SELECT a.name AS "artist name", albums."year" AS "album year" FROM artists a 
JOIN albums_and_artists aaa ON a.id = aaa.artist_id 
JOIN albums ON albums.id = aaa.album_id 
WHERE albums."year" != 2020

-- 5. названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT c.name AS "collection name" FROM collections c 
JOIN collections_and_songs cas ON cas.collection_id = c.id 
JOIN songs s ON s.id = cas.song_id
JOIN albums a ON a.id = s.album_id 
JOIN albums_and_artists aaa ON aaa.album_id = a.id 
JOIN artists a2 ON a2.id = aaa.artist_id 
WHERE a2.name = 'Hardwell'

-- 6. название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT a.name AS "album anme", count(g."name") AS "genres count" FROM albums a 
JOIN albums_and_artists aaa ON aaa.album_id = a.id 
JOIN artists a2 ON a2.id = aaa.artist_id 
JOIN genres_and_artists gaa ON gaa.artist_id = a2.id 
JOIN genres g ON g.id = gaa.genre_id 
GROUP BY a.name
HAVING count(g."name") > 1

-- 7. наименование треков, которые не входят в сборники;
SELECT s.name AS "song name" FROM songs s 
LEFT JOIN collections_and_songs cas ON cas.song_id = s.id
WHERE cas.song_id IS NULL 

-- 8. исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT a.name, s.duration FROM artists a 
JOIN albums_and_artists aaa ON aaa.artist_id = a.id 
JOIN songs s ON s.album_id = aaa.album_id 
WHERE s.duration = (SELECT MIN(s2.duration) FROM songs s2)

-- 9. название альбомов, содержащих наименьшее количество треков.
SELECT a.name, count(s."name") AS "songs count" FROM albums a 
JOIN songs s ON s.album_id = a.id
GROUP BY a.name
HAVING count(s."name") = (
	SELECT count(s."name") AS "songs count" FROM albums a2
	JOIN songs s ON s.album_id = a2.id
	GROUP BY a2.name
	ORDER BY "songs count"
	LIMIT 1
)