/* Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers. */

select i.total,c.firstname as cfirst,c.lastname as clast,c.country,e.firstname as agentname from invoice i join customer  c on i.customerid=c.customerid join employee e  on c.supportrepid=e.employeeid;