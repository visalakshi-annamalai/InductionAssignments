/* ProblemSet2 Table Set-up */

Create table Location (locationid number(10)  primary key,
 name varchar2(30), 
sunlight float(10),
 water float(10)); 


Create table Gardener (gardenerid number(10) primary key,
 name varchar2(30),
 age number(10)); 


Create table Plant (plantid number(10)  primary key, 
name varchar2(30), 
sunlight float(10),
 water float(10),
 weight float(10));
 

Create table planted (plantFK number(10),
 gardenerFK number(10),
 locationFK number(10),
 date1 varchar2(15),
 seeds number(10),
 foreign key(plantFK) references plant(plantid),
 foreign key(gardenerFK) references gardener(gardenerid), 
foreign key(locationFK) references location(locationid)); 


Create table picked (plantFK number(10),
 gardenerFK number(10),
 locationFK number(10),
 date1 varchar2(15),
 amount number(10),
 weight float(10),
 foreign key(plantFK) references plant(plantid),
 foreign key(gardenerFK) references gardener(gardenerid), 
foreign key(locationFK) references location(locationid)); 
