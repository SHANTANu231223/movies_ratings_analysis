-- Query-1
select title, userId, rating_movieId, rating from movies m inner join ratings r on m.movieId=r.rating_movieId order by userId limit 10;

-- Query-2
select movieId, title, round(avg(rating),2) as average_rating from movies m inner join ratings r on m.movieId=r.rating_movieId group by movieId order by average_rating,movieId;

-- Query-3
select count(userId) as total, userId, avg(rating) as average_rating from ratings group by userId order by total limit 10;

-- Query-4
select avg(rating) from movies m inner join ratings r on m.movieId=r.rating_movieId group by genres having avg(rating) > (select avg(rating) as avg_rating from movies inner join ratings on movieId=ratingId where genres like '%Adventure%' group by genres) and genres like '%Adventure%';

-- Query-5
select title, case when rating > 3.5 then "HIT" when rating between 2 and 3.5 then "AVERAGE" ELSE "FLOP" END AS Box_Office_Performce from movies inner join ratings on movieId=ratingId;

-- Query-6
select a.Box_Office_Performance,count(a.Box_Office_Performance) from (select title, case when rating > 3.5 then "HIT" when rating between 2 and 3.5 then "AVERAGE" ELSE "FLOP" END AS Box_Office_Performance from movies inner join ratings on movieId=ratingId) a group by a.Box_Office_Performance;

-- Query-7
select round((timestamp/31536000)+1970) as Year_of_rating from ratings limit 100;

-- Query-8
select count(userId) , a.Year_of_rating from (select userId, round((timestamp/31536000)+1970) as Year_of_rating from ratings) a group by a.Year_of_rating;