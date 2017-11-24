/* Provide a query showing Customers (just their full names, customer ID and country) who are not in the US. */

select CustomerId, firstname,lastname ,country from customer where Country<>'USA';