/* Provide a query that shows the # of invoices per country. HINT: GROUP BY */

select count(*),billingcountry from invoice group by billingcountry;