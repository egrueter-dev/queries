-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.

SELECT movies.rating, movies.title
FROM movies
ORDER BY movies.rating
LIMIT 50;

-- YOUR QUERY HERE

-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.

-- YOUR QUERY HERE

SELECT movies.title
FROM movies
WHERE movies.rating IS NULL;

-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.

-- YOUR QUERY HERE

SELECT movies.title
FROM movies
WHERE movies.synopsis LIKE '%thrilling%';

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

-- YOUR QUERY HERE

SELECT movies.title, movies.year, movies.rating, genres.id
FROM movies
JOIN genres
ON genres.id = movies.genre_id
WHERE movies.year BETWEEN 1980 AND 1989
AND genres.name = 'Science Fiction & Fantasy'
ORDER BY movies.rating DESC;

-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).

-- YOUR QUERY HERE

SELECT actors.name, movies.title, movies.year, cast_members.character
FROM movies
JOIN cast_members
ON cast_members.movie_id = movies.id
JOIN actors
ON cast_members.actor_id = actors.id
WHERE cast_members.character LIKE '%James Bond%'
ORDER BY movies.year;

-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

-- YOUR QUERY HERE

SELECT movies.title, movies.year, genres.name, actors.name
FROM cast_members
JOIN movies
  ON movies.id = cast_members.movie_id
JOIN actors
  ON cast_members.actor_id = actors.id
JOIN genres
  ON movies.genre_id = genres.id
WHERE actors.name LIKE 'Julianne Moore%';

-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

-- YOUR QUERY HERE

SELECT movies.title, movies.year, studios.name
FROM movies
JOIN genres
ON genres.id = movies.genre_id
JOIN studios
ON movies.studio_id = studios.id
WHERE genres.name LIKE 'Horror'
ORDER BY movies.year
LIMIT 5;
