-- ProblemSet1., November 14  2017
-- Submission by  visalakshi.annamalai

/*List full details of all hotels */
 
	select h.hotel_no,h.name,h.city,r.room_no,r.type,r.price from hotel h join room r on r.hotel_no=h.hotel_no; 

 
/* List full details of all hotels in New York */
	 
	select h.hotel_no,h.name,h.city,r.type,r.room_no,r.price from hotel h join room r on r.hotel_no=h.hotel_no and h.city='New York'; 

 
/* List the names and cities of all guests, ordered according to their cities */
 
 	select name,city from guest order by city; 

 
 /*List all details for non-smoking rooms in ascending order of price*/ 
 
 	select h.hotel_no,h.name,h.city,r.price,r.room_no from hotel h join room r on r.hotel_no=h.hotel_no where r.type='N' order by price; 
 
 
/* List the number of hotels there are. */
 
 	select count(*) as "Number Of Hotels" from hotel;  

 
 /* List the cities in which guests live. Each city should be listed only once */
 
 	select distinct(city) from guest; 
 
 
/* List the average price of a room */ 
 
 	select avg(price) as "Average Price Of a Room" from room; 
 
 
 /* List hotel names, their room numbers, and the type of that room */ 
 
 	select h.name,r.room_no,r.type from hotel h join room r on r.hotel_no=h.hotel_no; 
 
 
 /*List the hotel names, booking dates, and room numbers for all hotels in New York */ 
 
 	select h.name,b.date_from,b.date_to,b.room_no from hotel h join booking b on h.hotel_no=b.hotel_no and city='New York'; 
 
 
 /*  What is the number of bookings that started in the month of September */
 
 	select count(*) from booking where substr(date_from,4,3)='SEP'; 
 
 
/*  List the names and cities of guests who began a stay in New York in August */ 
 
 	select g.name,g.city from guest g join booking b on g.guest_no=b.guest_no join hotel h on h.hotel_no=b.hotel_no where substr(date_from,4,3)='AUG' and h.city='New York'; 
 
 /* List the hotel names and room numbers of any hotel rooms that have not been booked */ 
 
 	select h.name,r.room_no from room r join hotel h on h.hotel_no=r.hotel_no where room_no not in (select room_no from booking); 
 
 
 /* List the hotel name and city of the hotel with the highest priced room */
 
 	select h.name,h.city from hotel h join room r on  h.hotel_no=r.hotel_no where price in (select max(price) from room); 
 
 
 /*  List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Boston hotel */ 
 
 	select name ,city ,room_no ,price from hotel h join room r on r.hotel_no=h.hotel_no where price < (select min(price) from room r join hotel h on h.hotel_no=r.hotel_no where city='Boston'); 
 
 
 /*  List the average price of a room grouped by city */ 
 
 	select city, avg(price) from room r join hotel h on h.hotel_no=r.hotel_no group by city; 
 
 
