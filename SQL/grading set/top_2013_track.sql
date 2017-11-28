 /* Provide a query that shows the most purchased track of 2013. */
select t.name,count(i.invoicelineid),trackid from invoiceline i,invoice iv,track t where t.trackid=i.trackid and i.invoiceid=iv.invoiceid  and iv.invoicedate like '2013%'  group by t.name having count(i.invoicelineid)>1 order by count(i.invoicelineid) desc ;
