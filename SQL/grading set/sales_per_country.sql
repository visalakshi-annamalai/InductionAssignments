 /* Provide a query that shows the total sales per country. */
select sum(total),billingcountry from invoice group by billingcountry;
