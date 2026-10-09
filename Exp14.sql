CREATE TABLE employeepersonaldetails (id INT PRIMARY KEY, name 
VARCHAR(30) NOT NULL, 
age INT NOT NULL, mobilenumber NUMBER(10) NOT NULL UNIQUE); 
Output: 
Table created. 
INSERT INTO employeepersonaldetails VALUES (1, 'Ajay',    20, 9876543210); 
INSERT INTO employeepersonaldetails VALUES (2, 'Brindha', 20, 9874563210); 
INSERT INTO employeepersonaldetails VALUES (3, 'Kumaran', 20, 9673443210); 
Output: 
3 rows created. 
SELECT * FROM employeepersonaldetails; 
Output: 
ID NAME AGE MOBILE NUMBER 
1 Ajay 20 9876543210 
2 Brindha 20 9874563210 
3 Kumaran 20 9673443210 
 
COMMIT; 
Output: 
Commit complete. 
INSERT INTO employeepersonaldetails VALUES (4, 'Archana', 20, 9876543410); 
Output: 
1 row created. 
SELECT * FROM employeepersonaldetails; 
Output: 
ID NAME AGE MOBILE NUMBER 
1 Ajay 20 9876543210 
2 Brindha 20 9874563210 
3 Kumaran 20 9673443210 
4 Archana 20 9876543410 
 
ROLLBACK; 
Output: 
Rollback complete. 
SELECT * FROM employeepersonaldetails; 
Output: 
ID NAME AGE MOBILE NUMBER 
1 Ajay 20 9876543210 
2 Brindha 20 9874563210 
3 Kumaran 20 9673443210 
 
INSERT INTO employeepersonaldetails VALUES (5, 'Braham', 20, 9878953210); 
Output: 
1 row created. 
SAVEPOINT a; 
Output: 
Savepoint created. 
INSERT INTO employeepersonaldetails VALUES (6, 'Srimathi', 20, 9678953210); 
Output: 
1 row created. 
SAVEPOINT b; 
Output: 
Savepoint created. 
SELECT * FROM employeepersonaldetails; 
Output: 
ID NAME AGE MOBILE NUMBER 
1 Ajay 20 9876543210 
2 Brindha 20 9874563210 
3 Kumaran 20 9673443210 
5 Braham 20 9878953210 
6 Srimathi 20 9678953210 
 
ROLLBACK TO a; 
Output: 
Rollback complete. 
SELECT * FROM employeepersonaldetails; 
Output: 
ID NAME AGE MOBILE NUMBER 
1 Ajay 20 9876543210 
2 Brindha 20 9874563210 
3 Kumaran 20 9673443210 
5 Braham 20 9878953210 
 
COMMIT; 
Output: 
Commit complete. 
CREATE TABLE account (accno INT PRIMARY KEY, cname VARCHAR(20), 
balance NUMBER(10,2)); 
Output: 
Table created. 
INSERT INTO account VALUES (101, 'Ajay', 5000); 
INSERT INTO account VALUES (102, 'Brindha', 3000); 
Output: 
2 rows created. 
COMMIT; 
Output: 
Commit complete. 
UPDATE account SET balance = balance - 1000 WHERE accno = 101; 
Output: 
1 row updated. 
SAVEPOINT debited; 
Output: 
Savepoint created. 
UPDATE account SET balance = balance + 1000 WHERE accno = 102; 
Output: 
1 row updated. 
SELECT * FROM account; 
Output: 
ACCNO CNAME BALANCE 
101 Ajay 4000 
102 Brindha 4000 
 
ROLLBACK TO debited; 
Output: 
Rollback complete. 
SELECT * FROM account; 
Output: 
ACCNO CNAME BALANCE 
101 Ajay 4000 
102 Brindha 3000 
 
ROLLBACK; 
Output: 
Rollback complete. 
SELECT * FROM account; 
Output: 
ACCNO CNAME BALANCE 
101 Ajay 5000 
102 Brindha 3000 
 
CREATE USER student2 IDENTIFIED BY student2pwd; 
Output: 
User created. 
GRANT CREATE SESSION TO student2; 
Output: 
Grant succeeded. 
CONNECT student2/student2pwd 
Output: 
Connected. 
SELECT * FROM system.employeepersonaldetails; 
Output: 
ERROR at line 1: 
ORA-00942: table or view does not exist 
CONNECT system/&&sys_pwd 
Output: 
Connected. 
GRANT SELECT ON employeepersonaldetails TO student2; 
Output: 
Grant succeeded. 
SELECT grantee, table_name, privilege FROM user_tab_privs_made WHERE grantee 
= 'STUDENT2'; 
Output: 
GRANTEE TABLE_NAME PRIVILEGE 
STUDENT2 EMPLOYEEPERSONALDETAILS SELECT 
 
CONNECT student2/student2pwd 
Output: 
Connected. 
SELECT * FROM system.employeepersonaldetails; 
Output: 
ID NAME AGE MOBILE NUMBER 
1 Ajay 20 9876543210 
2 Brindha 20 9874563210 
3 Kumaran 20 9673443210 
5 Braham 20 9878953210 
 
INSERT INTO system.employeepersonaldetails VALUES (7, 'Test', 20, 9000000001); 
Output: 
ERROR at line 1: 
ORA-01031: insufficient privileges 
CONNECT system/&&sys_pwd 
Output: 
Connected. 
GRANT INSERT ON employeepersonaldetails TO student2; 
Output: 
Grant succeeded. 
CONNECT student2/student2pwd 
Output: 
Connected. 
INSERT INTO system.employeepersonaldetails VALUES (7, 'Test', 20, 9000000001); 
Output: 
1 row created. 
ROLLBACK; 
Output: 
Rollback complete. 
CONNECT system/&&sys_pwd 
Output: 
Connected. 
REVOKE INSERT ON employeepersonaldetails FROM student2; 
Output: 
Revoke succeeded. 
REVOKE SELECT ON employeepersonaldetails FROM student2; 
Output: 
Revoke succeeded. 
CONNECT student2/student2pwd 
Output: 
Connected. 
SELECT * FROM system.employeepersonaldetails; 
Output: 
ERROR at line 1: 
ORA-00942: table or view does not exist
