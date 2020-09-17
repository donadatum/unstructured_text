use HelpTickets

--This set of queries is run on a column of unstructured text 'request'
--to sort the text by key word in a new column 'category' 

SELECT *
FROM tickets;

--To add a column to the database 

ALTER table_name
ADD category varchar(24);

--To find and select words in the text

SELECT *
FROM dbo.tickets
WHERE request like '%login%'
OR request like '%logon%';

--- To sort records into a column named category based on words identified in the SELECT statements use

 UPDATE dbo.tickets
 SET category = 'login issue'
 where request LIKE '%login%'
 OR request LIKE '%logon%'
 OR request LIKE 'log%';

--To continue sorting, and only sort those records with a NULL value in category add 'AND category is NULL'

 SELECT * 
 FROM dbo.tickets
 WHERE request LIKE '%email%' 
 OR request LIKE '%e-mail%' 
 OR request LIKE'mail'
 AND category is NULL;

--To place any records where the text cannot be sorted into a unsorted category

UPDATE dbo.tickets
SET category = 'unsorted'
WHERE category is NULL;


--To keep track of your categories and the number of records in them use

 SELECT category, COUNT(category)
 FROM dbo.tickets
 GROUP BY (Category)
 ORDER BY COUNT(category)DESC;
 


 

