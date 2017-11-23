/* 1.Find the names of all students who are friends with someone named Gabriel. */

				select distinct name from Highschooler where ID in (select ID1 from Friend where ID2 in (select ID from Highschooler where name="Gabriel")); 


/* 2.For every student who likes someone 2 or more grades younger than themselves, return that student's name and grade, and the name and grade of the student they like. */
 
				select distinct sName, sGrade, lName, lGrade from (select h1.name as sName, h1.grade sGrade, h2.name as lName, h2.grade as lGrade, h1.grade-h2.grade as gradeDiff  from Highschooler h1, Likes, Highschooler h2 where h1.ID=ID1 and h2.ID=ID2) where gradeDiff>1; 


/* 3.For every pair of students who both like each other, return the name and grade of both students. Include each pair only once, with the two names in alphabetical order. */




/* 4.Find all students who do not appear in the Likes table (as a student who likes or is liked) and return their names and grades. Sort by grade, then by name within each grade. */

				select name,grade from Highschooler where ID not in (select ID1 from Likes union select ID2 from Likes) order by grade, name; 


/* 5.For every situation where student A likes student B, but we have no information about whom B likes (that is, B does not appear as an ID1 in the Likes table), return A and B's names and grades. */

				select distinct H1.name, H1.grade, H2.name, H2.grade from Highschooler H1, Likes, Highschooler H2 where H1.ID = Likes.ID1 and Likes.ID2 = H2.ID and H2.ID not in (select ID1 from Likes); 


/* 6.Find names and grades of students who only have friends in the same grade. Return the result sorted by grade, then by name within each grade.*/

				select name, grade from Highschooler where ID not in ( select ID1 from Highschooler H1, Friend, Highschooler H2 where H1.ID = Friend.ID1 and Friend.ID2 = H2.ID and H1.grade <> H2.grade) order by grade, name; 


/* 7.For each student A who likes a student B where the two are not friends, find if they have a friend C in common (who can introduce them!). For all such trios, return the name and grade of A, B, and C. */



/* 8.Find the difference between the number of students in the school and the number of different first names. */

				select st.sNum-nm.nNum from  (select count(*) as sNum from Highschooler) as st, (select count(distinct name) as nNum from Highschooler) as nm; 


/* 9.Find the name and grade of all students who are liked by more than one other student. */

				select name, grade  from (select ID2, count(ID2) as numLiked from Likes group by ID2), Highschooler where numLiked>1 and ID2=ID; 


/* 10.For every situation where student A likes student B, but student B likes a different student C, return the names and grades of A, B, and C. */

				select H1.name, H1.grade, H2.name, H2.grade, H3.name, H3.grade from Likes L1, Likes L2, Highschooler H1, Highschooler H2, Highschooler H3 where L1.ID2 = L2.ID1 and L2.ID2 <> L1.ID1 and L1.ID1 = H1.ID and L1.ID2 = H2.ID and L2.ID2 = H3.ID;  


/* 11.Find those students for whom all of their friends are in different grades from themselves. Return the students' names and grades. */




/* 12.What is the average number of friends per student? (Your result should be just one number.) */

				select avg(count) from (select count(ID2) as count from Friend group by ID1) as FriendCount; 


/* 13.Find the number of students who are either friends with Cassandra or are friends of friends of Cassandra. Do not count Cassandra, even though technically she is a friend of a friend. */

				select count(distinct F1.ID2) + count(distinct F2.ID2) from Friend F1, Friend F2, Highschooler where Highschooler.name = 'Cassandra' and Highschooler.ID = F1.ID1  and F2.ID1 = F1.ID2 and F2.ID1 <> Highschooler.ID and F2.ID2 <> Highschooler.ID; 


/* 14.Find the name and grade of the student(s) with the greatest number of friends. */


 
 