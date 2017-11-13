
1. List full details of all hotels.

	select h.hotel_no,h.name,h.city,r.room_no,r.type,r.price from hotel h join room r on r.hotel_no=h.hotel_no;

2. List full details of all hotels in New York.
	
	select h.hotel_no,h.name,h.city,r.type,r.room_no,r.price from hotel h join room r on r.hotel_no=h.hotel_no and h.city='New York';

3. List the names and cities of all guests, ordered according to their cities.

	select name,city from guest order by city;

4. List all details for non-smoking rooms in ascending order of price.

	select h.hotel_no,h.name,h.city,r.price,r.room_no from hotel h join room r on r.hotel_no=h.hotel_no where r.type='N' order by price;

5. List the number of hotels there are.

	select count(*) as "Number Of Hotels" from hotel;

6. List the cities in which guests live. Each city should be listed only once.

	select distinct(city) from guest;

7. List the average price of a room.

	select avg(price) as "Average Price Of a Room" from room;

8. List hotel names, their room numbers, and the type of that room.

	select h.name,r.room_no,r.type from hotel h join room r on r.hotel_no=h.hotel_no;

9. List the hotel names, booking dates, and room numbers for all hotels in New York.

	select h.name,b.date_from,b.date_to,b.room_no from hotel h join booking b on h.hotel_no=b.hotel_no and city='New York';

10.  What is the number of bookings that started in the month of September?

	select count(*) from booking where substring(date_from,4,3)='SEP';

11.  List the names and cities of guests who began a stay in New York in August.

	select g.name,g.city from guest g join booking b on g.guest_no=b.guest_no join hotel h on h.hotel_no=b.hotel_no where substring(date_from,4,3)='AUG' and h.city='New York';

12.  List the hotel names and room numbers of any hotel rooms that have not been booked.

	select h.name,r.room_no from room r join hotel h on h.hotel_no=r.hotel_no where room_no not in (select room_no from booking);

13.  List the hotel name and city of the hotel with the highest priced room.

	select h.name,h.city from hotel h join room r on  h.hotel_no=r.hotel_no where price in (select max(price) from room);

14.  List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Boston hotel.

	select name ,city ,room_no ,price from hotel h join room r on r.hotel_no=h.hotel_no where price < (select min(price) from room r join hotel h on h.hotel_no=r.hotel_no where city='Boston');

15.  List the average price of a room grouped by city.

	select city, avg(price) from room r join hotel h on h.hotel_no=r.hotel_no group by city;

