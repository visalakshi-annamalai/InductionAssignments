 /* Provide a query that shows total sales made by each sales agent. */
select max (sales),e.firstname from (select supportrepid,e.firstname,sum(total) as  sales from customer c, invoice i,employee e where c.customerid=i.customerid and e.employeeid=c.supportrepid group by supportrepid);
