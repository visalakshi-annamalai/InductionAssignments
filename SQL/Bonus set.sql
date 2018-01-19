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

/* 7.Find the film(s) with the smallest cast. */
	
	select mid, name, num from movie a,(select mid, count(*) as num from castt b group by mid) mm where num = ( select min (num) from (select mid, count(*) as num from castt group by mid ) mn )and a.id = mm.mid;

/* 8.Find all the actors who acted in films by at least 10 distinct directors (i.e. actors who worked with at least 10 distinct directors).
(i.e. actors who worked with at least 10 distinct directors).*/
	
	select a.id, a.fname, a.lname from person as a where 10 >= 
(select count(distinct md.did) from movie as m, castt as c, movie_directors as md where c.mid = m.id and md.mid = m.id and c.pid = a.id);

/* 9.Find all actors who acted only in films before 1960.*/

	select a.id, a.fname, a.lname ,max(year)from person a, castt c, movie m where a.id = c.pid and c.mid = m.idgroup by a.id having max(m.year) < 1960;



