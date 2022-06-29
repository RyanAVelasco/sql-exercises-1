/* 
MySQL exercises from W3 Resouce
MySQL Exercises, Practice, Solution:
https://w3resource.com/mysql-exercises/

Exercises on Data Manipulation Language (DML) & 
Data Definition Language (DDL)
MySQL Create Table statement [20 Exercises]
https://www.w3resource.com/mysql-exercises/create-table-exercises/

Note: I'm finding that the questions are worded 
in a way that makes it hard to interpret. Also, 
when clicking the solution, the question being
asked changes and makes sense. QA definitely 
was needed in this set.
*/

/*
1. Write a SQL statement to create a simple table 
countries including columns country_id,
country_name and region_id.

Solution:
CREATE TABLE countries( 
    COUNTRY_ID varchar(2),
    COUNTRY_NAME varchar(40),
    REGION_ID decimal(10,0)
);
*/

CREATE TABLE IF NOT EXISTS countries(
    country_id VARCHAR(3), 
    country_name VARCHAR(56), 
    region_id INT(3),
    PRIMARY KEY(country_id)
    -- https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv
);

/*
2. Write a SQL statement to create a simple table 
countries including columns country_id,country_name 
and region_id which is already exists. 
Note: I don't know what this question is asking.. so..
I'll interpret it as if the table doesn't exist

Note: My solution will be the same as Q1.

Solution:
CREATE TABLE IF NOT EXISTS countries ( 
    COUNTRY_ID varchar(2),
    COUNTRY_NAME varchar(40),
    REGION_ID decimal(10,0)
);
*/

CREATE TABLE IF NOT EXISTS countries(
    country_id VARCHAR(3), 
    country_name VARCHAR(56), 
    region_id INT(3),
    PRIMARY KEY(country_id)
    -- https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv
);

/*
3. Write a SQL statement to create the structure of 
a table dup_countries similar (LIKE) to countries.

Solution:
CREATE TABLE IF NOT EXISTS dup_countries
LIKE countries;
*/

CREATE TABLE IF NOT EXISTS dup_countries
LIKE countries;

/*
4. Write a SQL statement to create a duplicate copy 
of countries table including structure and data by 
name dup_countries. 
*/

CREATE TABLE IF NOT EXISTS dup_countries
LIKE countries
AS SELECT * FROM countries;

/*
5. Write a SQL statement to create a table 
countries set a constraint [NOT] NULL. 

Note: I'm assuming countries TABLE will be have the
same columns as in previous questions.

Solution:
CREATE TABLE IF NOT EXISTS countries ( 
    COUNTRY_ID varchar(2) NOT NULL,
    COUNTRY_NAME varchar(40) NOT NULL,
    REGION_ID decimal(10,0) NOT NULL
);
*/

CREATE TABLE IF NOT EXISTS countries(
    country_id VARCHAR(3) NOT NULL,
    country_name VARCHAR(56) NOT NULL,
    region_id INT(3) NOT NULL,
    PRIMARY KEY(country_id)
    -- https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv
);

/*
6. Write a SQL statement to create a table named 
jobs including columns job_id, job_title, 
min_salary, max_salary and check whether the 
max_salary amount exceeding the upper limit 25000. 

Note: Realized after creating the TABLE that
salaries can contain cents. Also, I don't 
understsand why MIN_SALARY isn't allowed to be
NULL. Isn't there a minimium standard for
salaries considering that there are minimum wages
in effect: https://www.dol.gov/agencies/whd/flsa
so $7.25 * 40 * 52 = $15,080 <-- salary?

Solution:
CREATE TABLE IF NOT EXISTS jobs ( 
    JOB_ID varchar(10) NOT NULL , 
    JOB_TITLE varchar(35) NOT NULL, 
    MIN_SALARY decimal(6,0), 
    MAX_SALARY decimal(6,0) 
    CHECK(MAX_SALARY<=25000)
);
*/

CREATE TABLE IF NOT EXISTS jobs(
    job_id INT PRIMARY KEY,
    job_title VARCHAR(50) NOT NULL,
    min_salary INT NOT NULL,
    max_salary INT,
    CHECK(max_salary <= 25000) -- FYI This is low.
);

/*
7. Write a SQL statement to create a table named 
countries including columns country_id, 
country_name and region_id and make sure that no 
countries except Italy, India and China will be 
entered in the table. 

Note: This one took me awhile to complete because
I forgot that you can use IN to indicate a list of
values. I kept writing variations of
CHECK country_id 'ITA', 'IND', 'CHN'.
I also created constraints for country_name and
region_id since those could be used to indicate
countries other than the ones required.

Solution:
CREATE TABLE IF NOT EXISTS countries ( 
    COUNTRY_ID varchar(2),
    COUNTRY_NAME varchar(40)
    CHECK(COUNTRY_NAME IN('Italy','India','China')) ,
    REGION_ID decimal(10,0)
);
*/

CREATE TABLE IF NOT EXISTS countries(
    country_id VARCHAR(3) PRIMARY KEY,
    country_name VARCHAR(56) NOT NULL,
    region_id INT(3) NOT NULL,
    CHECK(country_id IN ('ITA', 'IND', 'CHN')),
    CHECK(country_name IN ('Italy', 'India', 'China')),
    CHECK(region_id IN (150, 142))
    -- https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv
    -- Note: India and China share the same region id (region id)
);

/*
8. Write a SQL statement to create a table named 
job_histry including columns employee_id, 
start_date, end_date, job_id and department_id 
and make sure that the value against column 
end_date will be entered at the time of 
insertion to the format like '--/--/----'. 
*/

CREATE TABLE IF NOT EXISTS job_history(
    employee_id INT PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NULL,
    job_id INT NOT NULL,
    department_id INT NOT NULL
);

INSERT INTO job_history VALUES(102, "1962-12-31", "2006-05-09", 666, 234);
SELECT * FROM job_history;

/*
9. Write a SQL statement to create a table named 
countries including columns country_id,
country_name and region_id and make sure that no 
duplicate data against column country_id will be 
allowed at the time of insertion. 
*/

/*
10. Write a SQL statement to create a table named 
jobs including columns job_id, job_title, 
min_salary and max_salary, and make sure that, 
the default value for job_title is blank and 
min_salary is 8000 and max_salary is NULL will 
be entered automatically at the time of insertion 
if no value assigned for the specified columns. 
*/

/*
11. Write a SQL statement to create a table named 
countries including columns country_id, 
country_name and region_id and make sure that the 
country_id column will be a key field which will 
not contain any duplicate data at the time of 
insertion. 
*/

/*
12. Write a SQL statement to create a table 
countries including columns country_id, 
country_name and region_id and make sure that 
the column country_id will be unique and store 
an auto incremented value. 
*/

/*
13. Write a SQL statement to create a table 
countries including columns country_id, 
country_name and region_id and make sure that 
the combination of columns country_id and 
region_id will be unique. 
*/

/*
14. Write a SQL statement to create a table 
job_history including columns employee_id, 
start_date, end_date, job_id and department_id 
and make sure that, the employee_id column does 
not contain any duplicate value at the time of 
insertion and the foreign key column job_id 
contain only those values which are exists in 
the jobs table.

Here is the structure of the table jobs;

+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
*/

/*
15. Write a SQL statement to create a table 
employees including columns employee_id, 
first_name, last_name, email, phone_number 
hire_date, job_id, salary, commission, 
manager_id and department_id and make sure that, 
the employee_id column does not contain any 
duplicate value at the time of insertion and 
the foreign key columns combined by 
department_id and manager_id columns contain 
only those unique combination values, which 
combinations are exists in the departments table.

Assume the structure of departments table below.

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
| MANAGER_ID      | decimal(6,0) | NO   | PRI | 0       |       |
| LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
*/

/*
16. Write a SQL statement to create a table 
employees including columns employee_id, 
first_name, last_name, email, phone_number, 
hire_date, job_id, salary, commission, 
manager_id and department_id and make sure that, 
the employee_id column does not contain any 
duplicate value at the time of insertion, and 
the foreign key column department_id, reference 
by the column department_id of departments 
table, can contain only those values which are 
exists in the departments table and another 
foreign key column job_id, referenced by the 
column job_id of jobs table, can contain only 
those values which are exists in the jobs table. 
The InnoDB Engine have been used to create the 
tables.

"A foreign key constraint is not required merely 
to join two tables. For storage engines other 
than InnoDB, it is possible when defining a 
column to use a REFERENCES tbl_name(col_name) 
clause, which has no actual effect, and serves 
only as a memo or comment to you that the 
column which you are currently defining is 
intended to refer to a column in another table." 
- Reference dev.mysql.com

Assume that the structure of two tables 
departments and jobs.

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
| MANAGER_ID      | decimal(6,0) | YES  |     | NULL    |       |

| LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+


+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
*/

/*
17. Write a SQL statement to create a table 
employees including columns employee_id, 
first_name, last_name, job_id, salary and make 
sure that, the employee_id column does not 
contain any duplicate value at the time of 
insertion, and the foreign key column job_id, 
referenced by the column job_id of jobs table, 
can contain only those values which are exists 
in the jobs table. The InnoDB Engine have been 
used to create the tables. The specialty of the 
statement is that, The ON UPDATE CASCADE action 
allows you to perform cross-table update and ON 
DELETE RESTRICT action reject the deletion. The 
default action is ON DELETE RESTRICT.

Assume that the structure of the table jobs and 
InnoDB Engine have been used to create the table 
jobs.

CREATE TABLE IF NOT EXISTS jobs ( 
JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT 8000, 
MAX_SALARY decimal(6,0) DEFAULT NULL
)ENGINE=InnoDB;


+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | int(11)      | NO   | PRI | NULL    |       |
| JOB_TITLE  | varchar(35)  | NO   |     |         |       |
| MIN_SALARY | decimal(6,0) | YES  |     | 8000    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
*/

/*
18. Write a SQL statement to create a table 
employees including columns employee_id, 
first_name, last_name, job_id, salary and make 
sure that, the employee_id column does not 
contain any duplicate value at the time of 
insertion, and the foreign key column job_id, 
referenced by the column job_id of jobs table, 
can contain only those values which are exists 
in the jobs table. The InnoDB Engine have been 
used to create the tables. The specialty of the 
statement is that, The ON DELETE CASCADE that 
lets you allow to delete records in the 
employees(child) table that refer to a record 
in the jobs(parent) table when the record in 
the parent table is deleted and the ON UPDATE 
RESTRICT actions reject any updates.

Assume that the structure of the table jobs and 
InnoDB Engine have been used to create the table 
jobs.

CREATE TABLE IF NOT EXISTS jobs ( 
JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT 8000, 
MAX_SALARY decimal(6,0) DEFAULT NULL
)ENGINE=InnoDB;


+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | int(11)      | NO   | PRI | NULL    |       |
| JOB_TITLE  | varchar(35)  | NO   |     |         |       |
| MIN_SALARY | decimal(6,0) | YES  |     | 8000    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
*/

/*
19. Write a SQL statement to create a table 
employees including columns employee_id, 
first_name, last_name, job_id, salary and 
make sure that, the employee_id column does 
not contain any duplicate value at the time of 
insertion, and the foreign key column job_id, 
referenced by the column job_id of jobs table, 
can contain only those values which are exists 
in the jobs table. The InnoDB Engine have been 
used to create the tables. The specialty of the 
statement is that, The ON DELETE SET NULL action 
will set the foreign key column values in the 
child table(employees) to NULL when the record 
in the parent table(jobs) is deleted, with a 
condition that the foreign key column in the 
child table must accept NULL values and the 
ON UPDATE SET NULL action resets the values in 
the rows in the child table(employees) to NULL 
values when the rows in the parent table(jobs) 
are updated.

Assume that the structure of two table jobs and 
InnoDB Engine have been used to create the table 
jobs.

CREATE TABLE IF NOT EXISTS jobs ( 
JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT 8000, 
MAX_SALARY decimal(6,0) DEFAULT NULL
)ENGINE=InnoDB;


+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | int(11)      | NO   | PRI | NULL    |       |
| JOB_TITLE  | varchar(35)  | NO   |     |         |       |
| MIN_SALARY | decimal(6,0) | YES  |     | 8000    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
*/

/*
20. Write a SQL statement to create a table 
employees including columns employee_id, 
first_name, last_name, job_id, salary and make 
sure that, the employee_id column does not 
contain any duplicate value at the time of 
insertion, and the foreign key column job_id, 
referenced by the column job_id of jobs table, 
can contain only those values which are exists in 
the jobs table. The InnoDB Engine have been used 
to create the tables. The specialty of the 
statement is that, The ON DELETE NO ACTION and 
the ON UPDATE NO ACTION actions will reject the 
deletion and any updates.

Assume that the structure of two table jobs and 
InnoDB Engine have been used to create the table 
jobs.

CREATE TABLE IF NOT EXISTS jobs ( 
JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT 8000, 
MAX_SALARY decimal(6,0) DEFAULT NULL
)ENGINE=InnoDB;


+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | int(11)      | NO   | PRI | NULL    |       |
| JOB_TITLE  | varchar(35)  | NO   |     |         |       |
| MIN_SALARY | decimal(6,0) | YES  |     | 8000    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
*/