-- SQL Learning 
-- datatypes 
-- operators 
-- syntax 
-- DDL - CREATE, DROP, ALTER 
-- DML - INSERT, UPDATE, DELETE 
-- DQL / DRL - SELECT

-- PostgreSQL, Oracle, MySQL, SQL Server, DB2, MariaDB, H2, Derby... 

-- Database 
-- DBMS 
-- RDBMS 

-- OOP 
-- Entity - class 
-- features - fields 
-- functions - methods 

-- ER Model 
-- Entity - table  
-- features - columns 
-- instance - row / record 

-- Employee - works in - Department 

-- SELECT ? FROM ? WHERE ? 

-- RDBMS, PK, FK, Entity, Relationship

-- creating table without constraints
-- CREATE TABLE dep(did INT, dname VARCHAR(10), city varchar(10));
-- creating table WITH constraints
CREATE TABLE dep(did INT CONSTRAINT dep_pk PRIMARY KEY, dname VARCHAR(10), city varchar(10));

SELECT * FROM dep; 

CREATE TABLE emp(
	eid INT CONSTRAINT emp_pk PRIMARY KEY, 
	ename VARCHAR(10), 
	salary DECIMAL, 
	did INT CONSTRAINT emp_dep_fk REFERENCES dep(did));

SELECT * FROM emp; 

INSERT INTO dep (did, dname, city) VALUES (10, 'HR', 'Hyderabad');
INSERT INTO dep (did, dname, city) VALUES (20, 'Admin', 'Chennai');
INSERT INTO dep (did, dname, city) VALUES (30, 'Sales', 'Pune');
INSERT INTO dep (did, dname, city) VALUES (40, 'Mgmnt', 'Bengaluru');

INSERT INTO emp (eid, ename, salary, did) VALUES (101, 'Sonu', 50000, 10);
INSERT INTO emp (eid, ename, salary, did) VALUES (102, 'Monu', 60000, 20);
INSERT INTO emp (eid, ename, salary, did) VALUES (103, 'Tonu', 55000, 20);
INSERT INTO emp (eid, ename, salary, did) VALUES (104, 'Gonu', 65000, 30);
INSERT INTO emp (eid, ename, salary, did) VALUES (105, 'Ponu', 40000, null);

SELECT * FROM emp; 
SELECT * FROM dep; 

-- error 
-- INSERT INTO emp (eid, ename, salary, did) VALUES (106, 'Ponu', 40000, 50);
-- INSERT INTO emp (eid, ename, salary, did) VALUES (101, 'Ponu', 40000, 10);
-- INSERT INTO emp (eid, ename, salary, did) VALUES (null, 'Ponu', 40000, 50);

-- In which city does Sonu work? 
-- not workable 
-- SELECT ename, city FROM emp, dep WHERE ename = 'Sonu'; 

-- JOINS - fetch data from mutiple tables 

-- SELECT ename, city 
-- FROM emp
-- JOIN dep 
-- ON emp.did = dep.did
-- WHERE ename = 'Sonu'; 

SELECT e.ename, d.city 
FROM emp e
JOIN dep d
ON e.did = d.did
WHERE e.ename = 'Sonu'; 

SELECT * FROM emp;
SELECT * FROM dep;

-- types of join - 
-- 1. inner join - only matching records 
-- outer joins 
-- 2. left outer join -  matching records from both tables and non-matching records from left table  
-- 3. right outer join -  matching records from both tables and non-matching records from right table  
-- 4. full outer join -  matching and non-mathcing records from both tables 

-- 2. left outer join -
SELECT * 
FROM emp e
LEFT JOIN dep d
ON e.did = d.did;

-- 3. right outer join -
SELECT * 
FROM emp e
RIGHT JOIN dep d
ON e.did = d.did;

-- 4. full outer join -
SELECT * 
FROM emp e
FULL JOIN dep d
ON e.did = d.did;

-- finding max salary

-- can't get name
select max(salary) from emp;

-- subquery 
SELECT ename, salary FROM emp WHERE salary = 
(SELECT max(salary) FROM emp);