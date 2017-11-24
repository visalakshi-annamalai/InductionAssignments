/* Provide a query that includes the purchased track name AND artist name with each invoice line item. */

select t.name as track ,a.name as artist from track t,album al, artist a,invoiceline i where t.albumid=al.albumid and al.artistid=a.artistid and t.trackid=i.trackid;