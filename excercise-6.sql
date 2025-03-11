Create database exp6;
USE exp6;
CREATE TABLE EMPLOYEE1 (
    Emp_no INT PRIMARY KEY,
    E_name VARCHAR(50) NOT NULL,
    E_address VARCHAR(100),
    E_ph_no VARCHAR(15),
    Dept_no INT,
    Dept_name VARCHAR(50),
    Job_id INT,
    Designation VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO EMPLOYEE1 (Emp_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Designation, Salary)
VALUES 
(101, 'Alice Johnson', '123 Main St', '9876543210', 1, 'HR', 201, 'MANAGER', 75000.00),
(102, 'Bob Smith', '456 Elm St', '8765432109', 2, 'IT', 202, 'ENGINEER', 60000.00),
(103, 'Charlie Brown', '789 Oak St', '7654321098', 3, 'Finance', 203, 'MANAGER', 80000.00);

SELECT Emp_no, E_name, Salary
FROM EMPLOYEE1
WHERE Designation = 'MANAGER';

SELECT * FROM EMPLOYEE1 WHERE Salary > ANY (SELECT Salary FROM EMPLOYEE1 WHERE Dept_name = 'IT PROFF');

ALTER TABLE EMPLOYEE1 ADD Joining_Date DATE;
SELECT * FROM EMPLOYEE1 WHERE YEAR(Joining_Date) > 1981 ORDER BY Designation ASC;

SELECT Emp_no, E_name, 
       TIMESTAMPDIFF(YEAR, Joining_Date, CURDATE()) AS Experience, 
       Salary / 30 AS Daily_Salary 
FROM EMPLOYEE1;
SELECT * FROM EMPLOYEE1 WHERE Designation IN ('CLERK');