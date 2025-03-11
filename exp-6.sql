use Ranjith;

CREATE TABLE Employee12 (
    EMPNO INT PRIMARY KEY,
    EMP_NAME VARCHAR(15),
    DEPT VARCHAR(15),
    Salary DECIMAL(10,2),
    DOB DATE, 
    Branch VARCHAR(15)
);

INSERT INTO Employee12 (EMPNO, EMP_NAME, DEPT, Salary, DOB, Branch) VALUES 
(101, 'Amit', 'Production', 45000, '2000-03-12', 'Bangalore'),
(102, 'Amit', 'HR', 70000, '2002-07-03', 'Bangalore'),
(103, 'Sunita', 'Management', 120000, '2001-01-11', 'Mysore'),
(105, 'Sunita', 'IT', 67000, '2001-08-01', 'Mysore'),
(106, 'Mahesh', 'Civil', 145000, '2003-09-20', 'Bangalore');

SELECT * FROM Employee12;

select avg(salary) from Employee12;

select count(*) from Employee12;
select count(DISTINCT emp_name) from Employee12;

select empno,salary from Employee12;

select EMP_NAME,SUM(SALARY),COUNT(*)
FROM Employee12 GROUP BY(EMP_NAME);

SELECT EMP_NAME, SUM(SALARY) 
FROM Employee12 GROUP BY(EMP_NAME) 
 HAVING SUM(SALARY)>120000;

select emp_name from Employee12 order by emp_name desc; 




SELECT CURRENT_DATE ;

SELECT EXTRACT(YEAR FROM NOW());

SELECT EXTRACT(DAY FROM CURDATE());
SELECT EXTRACT(DAY FROM NOW());



Select ascii('a') from dual;
Select ascii('A') from dual;
Select ascii('Z') from dual;

SELECT UPPER('bldeasb arts and kcp science college');

SELECT LOWER('WELCOME TO DBMSLAB');

SELECT REPLACE('HELLO', 'H', 'K');

SELECT REPLACE('COMPUTER', 'C', 'K');

SELECT REPLACE('HELLO', 'L', 'A');

SELECT TRIM(BOTH 'A' FROM 'ANACONDA');

SELECT SUBSTRING('ANACONDA' FROM 2); 

SELECT SUBSTRING('ANIL' FROM 2);

SELECT LEFT('ANITA', LENGTH('ANITA') - 1);

-- math functions

CREATE TABLE Student1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    admission_no VARCHAR(45) NOT NULL UNIQUE,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    age INT,
    city VARCHAR(25) NOT NULL
);

CREATE TABLE Fee (
    admission_no VARCHAR(45) NOT NULL,
    course VARCHAR(45) NOT NULL,
    amount_paid INT
    
);

INSERT INTO Student1 (admission_no, first_name, last_name, age, city)
VALUES (3354,'Luisa', 'Evans', 13, 'Texas'),
(2135, 'Paul', 'Ward', 15, 'Alaska'),
(4321, 'Peter', 'Bennett', 14, 'California'),
(4213,'Carlos', 'Patterson', 17, 'New York'),
(5112, 'Rose', 'Huges', 16, 'Florida'),
(6113, 'Marielia', 'Simmons', 15, 'Arizona'),
(7555,'Antonio', 'Butler', 14, 'New York'),
(8345, 'Diego', 'Cox', 13, 'California');

INSERT INTO Fee (admission_no, course, amount_paid) VALUES (3354,'Java', 20000),
(7555, 'Android', 22000),
(4321, 'Python', 18000),	
(8345,'SQL', 15000),
(5112, 'Machine Learning', 30000);

-- join commands
SELECT Student1.admission_no, Student1.first_name, Student1.last_name, Fee.course, Fee.amount_paid
FROM Student1 INNER JOIN Fee ON Student1.admission_no = Fee.admission_no;

SELECT Student1.admission_no, Student1.first_name, Student1.last_name, Fee.course, Fee.amount_paid
FROM Student1 LEFT OUTER JOIN Fee ON Student1.admission_no = Fee.admission_no;

SELECT Student1.admission_no, Student1.first_name, Student1.last_name, Fee.course, Fee.amount_paid
FROM Student1 RIGHT OUTER JOIN Fee ON Student1.admission_no = Fee.admission_no;

SELECT Student1.admission_no, Student1.first_name, Student1.last_name, Fee.course, Fee.amount_paid
FROM Student1
LEFT JOIN Fee ON Student1.admission_no = Fee.admission_no
UNION
SELECT Student1.admission_no, Student1.first_name, Student1.last_name, Fee.course, Fee.amount_paid
FROM Student1
RIGHT JOIN Fee ON Student1.admission_no = Fee.admission_no;


