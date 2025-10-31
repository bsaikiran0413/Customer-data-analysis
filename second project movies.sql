-- Task 1 Can you get all data about movies? 
select * from movies;

-- Task 2 How do you get all data about directors?
select * from directors;

-- Task 3 Check how many movies are present in IMDB.
SELECT COUNT(*) AS total_movies
FROM movies;

-- Task 4 Find these 3 directors: James Cameron ; Luc Besson ; John Woo
SELECT * FROM directors
WHERE name IN ('James Cameron', 'Luc Besson', 'John Woo');


-- Task 5 Find all directors with name starting with S.
select * from directors where name like 's%';

-- Task 6 Count female directors.
select count(*) as female_directors 
from directors
where gender = 'female';

-- Task 7 Find the name of the 10th first women directors?
select name from directors where gender ='female'
order by name asc limit 1 offset 9;

-- Task 8 What are the 3 most popular movies?
select title popularity from movies 
order by popularity desc limit 3;

-- Task 9 What are the 3 most bankable movies?
select title,revenue from movies 
order by revenue desc limit 3;

-- Task 10 What is the most awarded average vote since the January 1st, 2000?
select title, vote_average from movies
where release_date>=2000
order by vote_average desc limit 1;

-- Task 11 Which movies were director by Brenda Chapman?
select title from movies 
join directors on director_id = director_id 
where name ='Brenda Chapman';

-- Task 12 Which director made the most movies?
select d.name, count(*) as movie_count from directors d 
join movies on d.id= director_id 
group by d.name 
order by movie_count desc limit 1;

-- Task 13 Which director is the most bankable?
select name ,SUM(revenue) as Total_revenue from directors d 
join movies on d.id = director_id
group by name 
order by Total_revenue desc limit 1;