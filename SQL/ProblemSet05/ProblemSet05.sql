-- ProblemSet5., November 28  2017
-- Submission by  visalakshi.annamalai
/* 1.Give the organiser's name of the concert in the Assembly Rooms after the first of Feb, 1997. (1 point possible) */
	select m.m_name as organiser_name from concert c, musician m where concert_venue='assembly rooms' and con_date > 01/02/97 and m.m_no = c.concert_organiser


/*2.Find all the performers who played guitar or violin and were born in England. (1 point possible) */
	select  m.m_name from musician m join performer p on m.m_no=p.perf_is join place pl on pl.place_no= m.born_in where p.instrument in('violin' , 'guitar') and pl.place_country='england'


/*3.List the names of musicians who have conducted concerts in USA together with the towns and dates of these concerts. (1 point possible)*/
	select m.m_name  as musician,pl.place_town,c.con_date from musician m, place pl, concert c where c.concert_in=pl.place_no and m.m_no=c.concert_organiser and pl.place_country='usa' group by m.m_no;


/* 4.How many concerts have featured at least one composition by Andy Jones? List concert date, venue and the composition's title. (1 point possible)*/


/*5.List the different instruments played by the musicians and avg number of musicians who play the instrument. (1 point possible)*/
	select instrument,avg(count) as avg_musicians from (select instrument,count( perf_is) as count from performer group by instrument) group by instrument


/* 6.List the names, dates of birth and the instrument played of living musicians who play a instrument which Theo also plays. (1 point possible)*/
	select m.m_name, m.born, p.instrument from musician m join performer p on m.m_no= p.perf_is and m.died is null and p.instrument in
(select instrument from musician m ,performer p on m_no=perf_is where m_name like 'theo%') ;


/*7.List the name and the number of players for the band whose number of players is greater than the average number of players in each band. (1 point possible)*/
	select p.band_id,b.band_name,count(p.player) as num_of_playersfrom band b join plays_in p ON b.band_no=p.band_idgroup by p.band_id having  num_of_players > (select avg(num_of_players) from (select band_id,count(player) as num_of_players from plays_in group by band_id));


/*8.List the names of musicians who both conduct and compose and live in Britain. (1 point possible)*/
	select distinct(m_name)from musician m join place  on living_in=place_no join has_composed h  on h.cmpr_no=m.m_no  join concert c on c.concert_organiser=m.m_no  where place_country in ('england','scotland','wales')


/*9.Show the least commonly played instrument and the number of musicians who play it. (1 point possible)*/
	select * from (select m.m_name, p.instrument,count(p.perf_is) as num_of_musiciansfrom musician m join performer pon m.m_no=p.perf_isgroup by p.instrument) a where a.num_of_musicians in (select min(num_of_musicians) from (select p.instrument,m.m_name,count(p.perf_is) as num_of_musicians
from musician m join performer pon m.m_no=p.perf_isgroup by p.instrument) );


/*10.List the bands that have played music composed by Sue Little; Give the titles of the composition in each case. (1 point possible)*/
	select * from composer c join musician m on c.comp_no=m.m_no  join has_composed hc on hc.cmpno=c.comp_no join composition c1 on hc.cmpr_no=c.comp_no  where m.m_name='sue little';

/*11.List the name and town of birth of any performer born in the same city as James First.(1 point possible)*/
	select m.m_name,p.place_town from musician m join place p on  m.born_in=p.place_no where p.place_town in (select p.place_town from place p join musician m on m.born_in=p.place_no where m.m_name='james first')

/*12.Create a list showing for EVERY musician born in Britain the number of compositions and the number of instruments played. (1 point possible)*/


/*13.Give the band name, conductor and contact of the bands performing at the most recent concert in the Royal Albert Hall. (1 point possible)*/
	select distinct(b.band_name),c.concert_organiser as conductor,b.band_contact from band b join concert c on c.concert_organiser=b.band_contact where b.band_contact in(select concert_organiser from concert where concert_venue like'royal albert hall' group by concert_organiser having con_date=max(con_date));

/*14.Give a list of musicians associated with Glasgow. Include the name of the musician and the nature of the association - one or more of 'LIVES_IN', 'BORN_IN', 'PERFORMED_IN' AND 'IN_BAND_IN'. (1 point possible)*/

	select * from ((select distinct(m.m_name) ,m.born_in from musician m join place p on p.place_no=m.born_in where place_town='glasgow' )a join (select distinct(m.m_name ),m.living_in from musician m join place p on p.place_no=m.living_in where place_town='glasgow' )b  join ( select band_name as band_in from band b join place p on b.band_home=p.place_no where place_town='glasgow') join (select m.m_name from musician m join performance p on m.m_no=p.performed join place p on p.place_no=p.performed_in where  place_town='glasgow'));

/*15.Jeff Dawn plays in a band with someone who plays in a band with Sue Little. Who is it and what are the bands? (1 point possible)*/




