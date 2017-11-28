-- BonusSet., November 28  2017
-- Submission by  visalakshi.annamalai
/* 1.List all the actors who acted in at least one film in 2nd half of the 19th century and in at least one film in the 1st half of the 20th century */
	select distinct fname,lname  from movie m1,movie m2,person p,castt c1,castt c2 where m1.id=c1.mid and c1.pid=p.id and m1.year between 1850 and 1900 and m2.id=c2.mid and c2.pid=p.id and m2.year between 1901 and 1950;

/* 2.List all the directors who directed a film in a leap year */
	select fname,lname,year from directors d,movie_director md,movie m where d.id=md.did and md.mid=m.id and (year%400=0 or year%4=0 and year%100<>0);

/*  3.List all the movies that have the same year as the movie 'Shrek (2001)', but a better rank. (Note: bigger value of rank implies a better rank) */
	select name from movie where year in (select year from movie where name like 'Shrek (2001)');

/* 4.List first name and last name of all the actors who played in the movie 'Officer 444 (1926)' */
	select fname ,lname from person p,movie m ,castt c where m.id=c.mid and c.pid=p.id and name like 'Officer%';

/* 5.List all directors in descending order of the number of films they directed */
	select fname,lname, count(mid) from movie_director m,directors d where m.did=d.id group by did order by count(mid) desc ;

/* 6.Find the film(s) with the largest cast. */
select m.name,count(*) from movie m , castt c where c.mid=m.id  group by m.id,m.name having count(*)>= (select count(*) from castt group by mid);

/* Find the film(s) with the smallest cast.
In both the above cases, also return the size of the cast.
Find all the actors who acted in films by at least 10 distinct directors (i.e. actors who worked with at least 10 distinct directors).
Find all actors who acted only in films before 1960.
Find the films with more women actors than men.
For every pair of male and female actors that appear together in some film, find the total number of films in which they appear together. Sort the answers in decreasing order of the total number of films.
For every actor, list the films he/she appeared in their debut year. Sort the results by last name of the actor.
The Bacon number of an actor is the length of the shortest path between the actor and Kevin Bacon in the "co-acting" graph. That is, Kevin Bacon has Bacon number 0; all actors who acted in the same film as KB have Bacon number 1; all actors who acted in the same film as some actor with Bacon number 1 have Bacon number 2, etc. Return all actors whose Bacon number is 2.
Suppose you write a single SELECT-FROM-WHERE SQL query that returns all actors who have finite Bacon numbers. How big is the query?
A decade is a sequence of 10 consecutive years. For example 1965, 1966, ..., 1974 is a decade, and so is 1967, 1968, ..., 1976. Find the decade with the largest number of films.
Rank the actors based on their popularity, and compute a list of all actors in descending order of their popularity ranks. You need to come up with your own metric for computing the popularity ranking.
This may include information such as the number of movies that an actor has acted in; the 'popularity' of these movies' directors (where the directors' popularity is the number of movies they have directed), etc.
Be creative in how you choose your criteria of computing the actors' popularity. For this answer, in addition to the query, also turn in the criteria you used to rank the actors. */



