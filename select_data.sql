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