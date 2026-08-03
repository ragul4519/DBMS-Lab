
SQL> Create table Student45(StudentID int PRIMARY KEY, Name varchar(30), Age int);

Table created.

SQL> Insert into Student45 values(1,'Alice', 20);

1 row created.

SQL> Insert into Student45 values(2,'Bob', 22);

1 row created.

SQL> Insert into Student45 values(3,'Charlie', 21);

1 row created.

SQL> Insert into Student45 values(4,'David', 19);

1 row created.

SQL> Create table Courses45 (CourseID int PRIMARY KEY, CourseName varchar(20));

Table created.

SQL> Insert into Courses45 values (101, 'Database Management');

1 row created.

SQL> Insert into Courses45 values (102, 'Algorithms');

1 row created.

SQL> Insert into Courses45 values (103, 'Web Development');

1 row created.

SQL> Create table Enrollments45 (StudentID int REFERENCES Student45(StudentID), CourseID int REFERENCES Courses45(CourseID));

Table created.

SQL> Insert into Enrollments45 values(1,101);

1 row created.

SQL> Insert into Enrollments45 values(1,102);

1 row created.

SQL> Insert into Enrollments45 values(2,102);

1 row created.

SQL> Insert into Enrollments45 values(3,101);

1 row created.

SQL> Insert into Enrollments45 values(3,103);

1 row created.

SQL> SELECT * FROM Student45;

 STUDENTID NAME                                  AGE
---------- ------------------------------ ----------
         1 Alice                                  20
         2 Bob                                    22
         3 Charlie                                21
         4 David                                  19

SQL> SELECT Name, Age FROM Student45 WHERE Age > 20;

NAME                                  AGE
------------------------------ ----------
Bob                                    22
Charlie                                21

SQL> SELECT Name FROM Student45 WHERE StudentID IN (SELECT StudentID FROM Enrollments45 WHERE CourseID = (SELECT CourseID FROM Courses45 WHERE CourseName = 'Database Management'));

NAME
------------------------------
Alice
Charlie

SQL> SELECT CourseID, CourseName FROM Courses45 WHERE CourseID IN ( SELECT CourseID FROM Enrollments45 GROUP BY CourseID HAVING COUNT(*) > 1 );

  COURSEID COURSENAME
---------- --------------------
       101 Database Management
       102 Algorithms

SQL> SELECT AVG(Age) AS AverageAge FROM Student45;

AVERAGEAGE
----------
      20.5

SQL> SELECT Name, Age FROM Student45 WHERE Age > (SELECT AVG(Age) FROM Student45);

NAME                                  AGE
------------------------------ ----------
Bob                                    22
Charlie                                21

