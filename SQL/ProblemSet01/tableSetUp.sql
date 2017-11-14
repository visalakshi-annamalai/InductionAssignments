
/* ProblemSet1 Table Set-up */

create table hotel(hotel_no varchar2(10),
name varchar2(20),
city varchar2(15),
primary key(hotel_no));

create table room(room_no number(10),
hotel_no varchar2(10),
type varchar2(5),
price number(10),
primary key(room_no,hotel_no),
foreign key(hotel_no) references hotel(hotel_no));

create table guest(guest_no varchar2(10),
name varchar2(20),
city varchar2(15) ,
primary key(guest_no));

create table booking(hotel_no varchar2(10),
guest_no varchar2(10),
date_from varchar2(15),
date_to varchar2(15),
room_no number(10),
foreign key(hotel_no) references hotel(hotel_no),
foreign key(guest_no) references guest(guest_no));

