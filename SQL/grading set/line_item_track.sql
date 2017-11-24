/* Provide a query that includes the purchased track name with each invoice line item. */

select t.name from track t join invoiceline i on t.trackid=i.trackid;