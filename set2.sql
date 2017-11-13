1. Write a valid SQL statement that calculates the total weight of all corn cobs that were picked from the garden:  

	select sum(weight) from picked where plantFK in(select plantid from plant where name='corn'); 

2. For some reason Erin has change his location for picking the tomato to North. Write the corresponding query.

	update picked set locationFK=1 where gardenerFK=3 and plantFK=3;  

3. Insert a new column 'Exper' of type Number (30) to the 'gardener' table which stores  Experience of the of person. How will you modify this to varchar2(30). 
 
	alter table gardener add column(Eper int(30));
	alter table gardener modify column(Eper varchar(30));

4. Write a query to find the plant name which required seeds less than 20 which plant on 14-APR  

	select p.name from planted pl join plant p on pl.plantFK=p.plantid where substring(date1,1,6)='14-APR';

5. List the amount of sunlight and water to all plants with names that start with letter  'c' or letter 'r'. 

	select sum(sunlight) , sum(water) from plant where name like 'c%' or name like  'r%'; 

6.Write a valid SQL statement that displays the plant name and  the total amount of seed required for each plant that were plant in the garden. The output should be in descending order of plant name.  

	select P.name,sum(seeds) from planted pl join plant p on p.plantid=pl.plantFK group by plantFK order by name desc;

7. Write a valid SQL statement that calculates the average number of items produced per seed planted for each plant type:( (Average number of items = total amount picked / total seeds planted.)  

	select p.name,(pc.amount/pt.seeds)as "Avg" from plant p inner join planted pt on p.plantid=pt.plantfk join picked pc on pt.plantfk=pc.plantfk; 

 
8. Write a valid SQL statement that would produce a result set like the following:  

	select g.name,p.name,pi.date1,pi.amount from gardener g inner join picked pi on g.gardenerid=pi.gardenerfk  join plant p on p.plantid=pi.plantfk 
	where (g.name='Tim' and (p.name='Carrot' or p.name='Radish')) order by pi.amount;
 
       name |  name  |    date    | amount  
       ------+--------+------------+--------  
       Tim  | Radish | 2012-07-16 |     23  
       Tim  | Carrot | 2012-08-18 |     28  

	select g.name,p.name,pi.date1,pi.amount from gardener g inner join picked pi on g.gardenerid=pi.gardenerfk  join plant p on p.plantid=pi.plantfk 
	where (g.name='Tim' and (p.name='Carrot' or p.name='Radish')) order by pi.amount;


 
9.Find out persons who picked from the same location as he/she planted.  

	select distinct(name) from gardener g inner join planted pl on g.gardenerid=pl.gardenerfk inner join picked pi on g.gardenerid=pi.gardenerfk 
	where pi.locationfk=pl.locationfk; 

10. Create a view that lists all the plant names picked from all locations except ’West’ in the month of August. 
 
	create view plant_list as select name from plant where name not in (select pl.name from picked p join plant pl on pl.plantid=p.plantFK where locationFK=2 and substring(date1,4,3)!='AUG');
