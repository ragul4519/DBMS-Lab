CREATE KEYSPACE library WITH REPLICATION = { 'class': 'SimpleStrategy', 
'replication_factor': 3 }; 
Output: 
Keyspace created. 
USE library; 
Output: 
Context switched to library. 
CREATE TABLE authors ( 
    AuthorID int PRIMARY KEY, 
    FirstName text, 
    LastName text 
); 
Output: 
Table created. 
INSERT INTO authors (AuthorID, FirstName, LastName) VALUES (1, 'George', 
'Orwell'); 
INSERT INTO authors (AuthorID, FirstName, LastName) VALUES (2, 'Aldous', 
'Huxley'); 
INSERT INTO authors (AuthorID, FirstName, LastName) VALUES (3, 'J.K.', 
'Rowling'); 
Output: 
3 rows inserted. 
SELECT * FROM authors; 
Output: 
authorid firstname lastname 
1 George Orwell 
2 Aldous Huxley 
3 J.K. Rowling 
 
UPDATE authors SET LastName = 'Smith' WHERE AuthorID = 1; 
SELECT * FROM authors WHERE AuthorID = 1; 
 
Output: 
authorid firstname lastname 
1 George Smith 
 
 
DELETE FROM authors WHERE AuthorID = 1; 
 
SELECT * FROM authors WHERE AuthorID = 1; 
Output: 
(Empty result set) 
 
 
 
 
