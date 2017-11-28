 /* Which sales agent made the most in sales in 2009? */
select supportrepid,e.firstname,sum(total) as "total sales"from customer c, invoice i,employee e where c.customerid=i.customerid and e.employeeid=c.supportrepid group by supportrepid ;
