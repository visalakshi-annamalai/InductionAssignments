/* ProblemSet1 Data Set-up */

/* Set-up for hotel Table */

insert into hotel values('H111','Empire Hotel','New York');
insert into hotel values('H235','Park Place','New York');
insert into hotel values('H432','Brownstone Hotel','Toronto');
insert into hotel values('H498','James Plaza','Toronto');
insert into hotel values('H193','Devon Hotel','Boston');
insert into hotel values('H437','Clarimont Hotel','Boston');

/* Set-up for room Table */

insert into room values(313,'H111','S',145.00);
insert into room values(412,'H111','N',145.00);
insert into room values(1267,'H235','N',175.00);
insert into room values(1289,'H235','N',195.00);
insert into room values(876,'H432','S',124.00);
insert into room values(898,'H432','S',124.00);
insert into room values(345,'H498','N',160.00);
insert into room values(467,'H498','N',180.00);
insert into room values(1001,'H193','S',150.00);
insert into room values(1201,'H193','N',175.00);
insert into room values(257,'H437','N',140.00);
insert into room values(223,'H437','N',155.00);

/* Set-up for guest Table */

insert into guest values('G256','Adam Wayne','Pittsburgh');
insert into guest values('G367','Tara Cummings','Baltimore');
insert into guest values('G879','Vanessa Parry','Pittsburgh');
insert into guest values('G230','Tom Hancock','Philadelphia');
insert into guest values('G467','Robert Swift','Atlanta');
insert into guest values('G190','Edward Cane','Baltimore');

/* Set-up for booking Table */

insert into booking values('H111','G256','10-AUG-99','15-AUG-99',412);
insert into booking values('H111','G367','18-AUG-99','21-AUG-99',412);
insert into booking values('H235','G879','05-SEP-99','12-SEP-99',1267);
insert into booking values('H498','G230','15-SEP-99','18-SEP-99',467);
insert into booking values('H498','G256','30-NOV-99','02-DEC-99',345);
insert into booking values('H498','G467','03-NOV-99','05-NOV-99',345);
insert into booking values('H193','G190','15-NOV-99','19-NOV-99',1001);
insert into booking values('H193','G367','12-SEP-99','14-SEP-99',1001);
insert into booking values('H193','G367','01-OCT-99','06-OCT-99',1201);
insert into booking values('H437','G190','04-OCT-99','06-OCT-99',223);
insert into booking values('H437','G879','14-SEP-99','17-SEP-99',223);
