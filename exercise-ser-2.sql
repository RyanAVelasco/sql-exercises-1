/*
Unlike the previous question set, the TABLE is provided, but in respect of
practising, I'll be creating it myself and then answering the questions.

https://stackhowto.com/mysql-practice-exercises-with-solutions-part-1/

Employee Table
+-------------+------------+-----------+----------+--------------+-------------+
| Employee_id | First_name | Last_name |  Salary  | Joining_date | Departement |
+-------------+------------+-----------+----------+--------------+-------------+
|     1       |     Bob    |   Kinto   | 1000000  |  2019-01-20  |   Finance   |
|     2       |    Jerry   |  Kansxo   | 6000000  |  2019-01-15  |     IT      |
|     3       |    Philip  |   Jose    | 8900000  |  2019-02-05  |   Banking   |
|     4       |    John    |  Abraham  | 2000000  |  2019-02-25  |  Insurance  |
|     5       |   Michael  |  Mathew   | 2200000  |  2019-02-28  |   Finance   |
|     6       |    Alex    |  chreketo | 4000000  |  2019-05-10  |     IT      |
|     7       |    Yohan   |   Soso    | 1230000  |  2019-06-20  |   Banking   |
+-------------+------------+-----------+----------+--------------+-------------+

Reward Table
+-----------------+-------------+--------+
| Employee_ref_id | date_reward | amount |
+-----------------+-------------+--------+
|         1       | 2019-05-11  |  1000  | 
|         2       | 2019-02-15  |  5000  |
|         3       | 2019-04-22  |  2000  |
|         1       | 2019-06-20  |  8000  |
+-----------------+-------------+--------+
*/

-- Score 90.99%

DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS reward;

-- First, I'll create the employee table
CREATE TABLE IF NOT EXISTS employee (
    Employee_id INT PRIMARY KEY,
    First_name VARCHAR(100) NOT NULL,
    Last_name VARCHAR(100) NOT NULL,
    Salary INT NOT NULL,
    Joining_date DATE NOT NULL,
    Departement VARCHAR(50) NOT NULL
);

-- Next, I'll create the reward table
CREATE TABLE IF NOT EXISTS reward (
    Employee_ref_id INT PRIMARY KEY,
    date_reward DATE NOT NULL,
    amount INT NOT NULL
);

-- Populate employee TABLE
INSERT INTO employee VALUES (1, "Bob", "Kinto", 1000000, "2019-01-20", "Finance");
INSERT INTO employee VALUES (2, "Jerry", "Kansxo", 6000000, "2019-01-15", "IT");
INSERT INTO employee VALUES (3, "Philip", "Jose", 8900000, "2019-02-05", "Banking");
INSERT INTO employee VALUES (4, "John", "Abraham", 2000000, "2019-02-25", "Insurance");
INSERT INTO employee VALUES (5, "Michael", "Mathew", 2200000, "2019-02-28", "Finance");
INSERT INTO employee VALUES (6, "Alex", "Chreketo", 4000000, "2019-05-10", "IT");
INSERT INTO employee VALUES (7, "Yohan", "Soso", 1230000, "2019-06-20", "Banking");

-- Populate employee reward
INSERT INTO reward VALUES(1, "2019-05-11", 1000);
INSERT INTO reward VALUES(2, "2019-02-15", 5000);
INSERT INTO reward VALUES(3, "2019-04-22", 2000);
INSERT INTO reward VALUES(4, "2019-06-20", 8000);

-- 1. Get all employee.
-- Note: I'm assuming they're asking for all entries since Q2 asks for names. 

SELECT * FROM employee;

-- 2. Display the first name and last name of all employees

SELECT First_name, Last_name FROM employee;

-- 3. Display all the values of the "First_Name" column using the alias 
-- "Employee Name"

SELECT First_name AS "Employee Name" FROM employee; 

-- 4. Get all “Last_Name” in lowercase. 
-- Added a step. But now know that I don't need to UPDATE.
UPDATE employee SET Last_name=LOWER(Last_name);
SELECT * FROM employee;

-- 5. Get all “Last_Name” in uppercase.
-- Added a step. But now know that I don't need to UPDATE.
UPDATE employee SET Last_name=UPPER(Last_name);
SELECT * FROM employee;

-- 6. Get unique “DEPARTMENT”.

SELECT DISTINCT Departement FROM employee; 

-- 7. Get the first 4 characters of “FIRST_NAME” column.
SELECT SUBSTRING(First_name, 1, 4) FROM employee;

-- 8. Get the position of the letter ‘h’ in ‘John’.
-- This is the only question that I'm unsure of how to answer.
-- Even searching online didn't net me any answers.
-- So, the answer here is incorrect.
SELECT SUBSTRING_INDEX(First_name, "h", "") FROM employee WHERE First_name = "John";

-- 9. Get all values from the “FIRST_NAME” column after removing white space on 
-- the right.
-- I added entries since the present first names had no whitespaces.

SELECT * FROM employee; -- Before right trim
INSERT INTO employee VALUES(8, "I'll be right trim  ", "right trim", 120, "2022-07-01", "FAKER");
SELECT RTRIM(First_name) FROM employee; -- After right trim 

-- 10. Get all values from the “FIRST_NAME” column after removing white space 
-- on the left.
-- I added entries since the present first names had no whitespaces.

SELECT * FROM employee; -- Before left trim
INSERT INTO employee VALUES(9, "            I'll be left trim", "left trim", 120, "2022-07-01", "FAKER");
SELECT LTRIM(First_name) FROM employee; -- After left trim 

-- 10.1. Get all values from the “FIRST_NAME” column after removing white space 
-- from left and right side.
-- I added entries since the present first names had no whitespaces.

SELECT * FROM employee; -- Before full trim
INSERT INTO employee VALUES(10, "            I'll be full trim  ", "full trim", 120, "2022-07-01", "FAKER");
SELECT TRIM(First_name) FROM employee; -- After full trim 

-- 11. Write the syntax to create the “employee” table.
/* 
Seems I've already done this back the beginning.
I used NOT NULL for col 2-6 since I believe that if someone is an
employee then these would never be missing.
Also, I didn't know about DEFAULT getdate(), that'll definitely be handy.
*/
