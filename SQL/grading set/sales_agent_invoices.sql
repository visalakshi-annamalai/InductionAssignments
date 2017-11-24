/* Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name */

select invoiceid,invoicedate,e.firstname,e.lastname from invoice i join customer  c on i.customerid=c.customerid join employee e  on c.supportrepid=e.employeeid ;