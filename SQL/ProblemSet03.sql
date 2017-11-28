-- ProblemSet3., November 28  2017
-- Submission by  visalakshi.annamalai

/* 1.Find the titles of all movies directed by Steven Spielberg. */
				
	select title from movie where director='Steven Spielberg';

/* 2.Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order. */
				
	select year from movie m join ratings r on m.mID=r.mID where stars>=5 order by year;

/* 3.Find the titles of all movies that have no ratings.  */
				
	select title from movie where mID not in (select mID from ratings);

/* 4.Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date. */ 

	select name from reviewer r join ratings r1 on r.rID=r1.rID where ratingDate is null;

/* 5.Write a query to return the ratings data in a more readable format: reviewer name, movie title, stars, and ratingDate. Also, sort the data, first by reviewer name, then by movie title, and lastly by number of stars. */ 

	select name,title,stars,ratingDate from reviewer r join ratings r1 on r.rID=r1.rID join movie m on m.mID=r1.mID order by name,title,stars;

/* 6.For all cases where the same reviewer rated the same movie twice and gave it a higher rating the second time, return the reviewer's name and the title of the movie. */ 

	select name , title from reviewer r join (select * from ratings r join ratings r1 on r.mID=r1.mID  and  r.rID=r1.rID where r.stars<r1.stars and r.ratingDate < r1.ratingDate) c on c.rID=r.rID join movie m on m.mID=c.mID;

/* 7.For each movie that has at least one rating, find the highest number of stars that movie received. Return the movie title and number of stars. */

	select max(stars),title from ratings r join movie m on r.mID=m.mID group by r.mID;

/* 8.For each movie, return the title and the 'rating spread', that is, the difference between highest and lowest ratings given to that movie. Sort by rating spread from highest to lowest, then by movie title. */ 

	select title,(max(stars)-min(stars) )as "rating spread" from ratings r join movie m on m.mID=r.mID group by r.mID;

/* 9.Find the difference between the average rating of movies released before 1980 and the average rating of movies released after 1980. (Make sure to calculate the average rating for each movie, then the average of those averages for movies before 1980 and movies after. Don't just calculate the overall average rating before and after 1980.)  */

/* 10.Find the names of all reviewers who rated Gone with the Wind. */ 

	select name from ratings r join movie m on m.mID=r.mID join reviewer r on r1.rID=r.rID where title='Gone with Wind';

/* 11.For any rating where the reviewer is the same as the director of the movie, return the reviewer name, movie title, and number of stars. */ 

	select distinct name, title, stars from Reviewer, Movie, Rating where Reviewer.rID = Rating.rID  and Rating.mID = Movie.mID and name = director; 
    			
/* 12.Return all reviewer names and movie names together in a single list, alphabetized. (Sorting by the first name of the reviewer and first word in the title is fine; no need for special processing on last names or removing "The".)  */

	select name,title from movie m join ratings r on m.mID=r.mID join reviewer r1 on  r1.rID=r.rID order by name,title;

/* 13.Find the titles of all movies not reviewed by Chris Jackson.  */

	select title from movie m join ratings r on m.mID=r.mID join reviewer r1 on  r1.rID=r.rID where name not in(select name from reviewer where name='ChrisJackson');

/* 14.For all pairs of reviewers such that both reviewers gave a rating to the same movie, return the names of both reviewers. Eliminate duplicates, don't pair reviewers with themselves, and include each pair only once. For each pair, return the names in the pair in alphabetical order.  */

select a.title,r.name from reviewer r join (select m.title,n.rid from movie m join  (select mid,rid from ratings group by mid,rid) n where m.mid=n.mid) a where r.rid=a.rid order by a.title,r.name; 

/* 15.For each rating that is the lowest (fewest stars) currently in the database, return the reviewer name, movie title, and number of stars.  */

	select name, title, stars from Reviewer, Movie, Ratings where stars = ( select min(stars) from Ratings) and Reviewer.rID = Ratings.rID  ; 

/* 16.List movie titles and average ratings, from highest-rated to lowest-rated. If two or more movies have the same average rating, list them in alphabetical order.  */
 
	select title, rate from Movie m, ( select mID, avg(stars) as rate from ratings group by mID ) AvgRating where m.mID = AvgRating.mID order by stars DESC, title; 

/* 17.Find the names of all reviewers who have contributed three or more ratings. (As an extra challenge, try writing the query without HAVING or without COUNT.)  */

	select name from reviewer r join (select rID, count(stars)  from ratings group by rID ) r1 on r.rID =r1.rID and r1.count(stars) >= 3; 

/* 18.Some directors directed more than one movie. For all such directors, return the titles of all movies directed by them, along with the director name. Sort by director name, then movie title. (As an extra challenge, try writing the query both with and without COUNT.)  */

	select M1.title, M1.director from Movie M1, Movie M2 where M1.director = M2.director and M1.title <> M2.title order by M1.director, M1.title ; 


/* 19.Find the movie(s) with the highest average rating. Return the movie title(s) and average rating. (Hint: This query is more difficult to write in SQLite than other systems; you might think of it as finding the highest average rating and then choosing the movie(s) with that average rating.)  */

	select m.title ,c1.average from movie m join (select mid,avg(stars) as average from ratings group by mID having avg(stars)= (select max(average) from(select mid,avg(stars) as average from ratings group by mID) c)) c1  where m.mID=c1.mID; 


/* 20.Find the movie(s) with the lowest average rating. Return the movie title(s) and average rating. (Hint: This query may be more difficult to write in SQLite than other systems; you might think of it as finding the lowest average rating and then choosing the movie(s) with that average rating.)  */

	select m.title,c1.average from movie m join (select mID,avg(stars) as average from ratings group by mID having avg(stars)= (select min(average)from (select mid,avg(stars) as average from ratings group by mid) c))  c1 where m.mID=s.mID; 


/* 21.For each director, return the director's name together with the title(s) of the movie(s) they directed that received the highest rating among all of their movies, and the value of that rating. Ignore movies whose director is NULL. */

	select title, max(stars) , director from movie m, ratings r where m.mID = r.mID and director is not NULL group by director; 
































































