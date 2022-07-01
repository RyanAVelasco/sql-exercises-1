/* 
This carries the solutions to exercise-ser-2.sql
https://stackhowto.com/mysql-practice-exercises-with-solutions-part-1/
*/

-- 1.
SELECT * FROM employee;

-- 2.
SELECT First_name, Last_name FROM employee;

-- 3. 
SELECT First_name AS "Employee Name" FROM employee;

-- 4.
SELECT LOWER(Last_name) FROM employee;

-- 5.
SELECT UPPER(Last_name) FROM employee;

-- 6.
SELECT DISTINCT Departement FROM employee;

-- 7.
SELECT SUBSTRING(First_name,1,4) FROM employee;

-- 8.
SELECT LOCATE('h',First_name) FROM employee where First_name='John';

-- 9.
SELECT RTRIM(First_name) FROM employee;

-- 10. 
SELECT LTRIM(First_name) FROM employee;

-- 10.1 I made this one up.

-- 11

CREATE TABLE Employee(
  employee_id int NOT NULL,
  First_name varchar(50) NULL,
  Last_name varchar(50) NULL,
  salary decimal(18, 0) NULL,
  joining_date datetime2(7) default getdate(),
  departement varchar(50) NULL
);