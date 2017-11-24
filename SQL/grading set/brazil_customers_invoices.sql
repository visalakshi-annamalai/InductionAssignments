/* Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.*/

select firstname,lastname,invoiceid,invoicedate,billingcountry from invoice i join customer c where c.country='Brazil';