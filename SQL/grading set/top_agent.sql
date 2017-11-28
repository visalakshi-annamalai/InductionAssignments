
/* Hint: Use the MAX function on a subquery.
 Which sales agent made the most in sales over all? */
select max (sales)as "max sales in sep",e.firstname from (select supportrepid,e.firstname,sum(total) as "sales"from customer c, invoice i,employee e where c.customerid=i.customerid and e.employeeid=c.supportrepid and i.invoicedate like '2009%' group by supportrepid );
