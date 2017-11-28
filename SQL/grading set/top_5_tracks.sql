
/* Provide a query that shows the top 5 most purchased tracks over all. */

select t.name,count(i.invoicelineid),trackid from invoiceline i,track t where t.trackid=i.trackid group by t.name having count(i.invoicelineid)>1 order by count(i.invoicelineid) desc  limit 5;