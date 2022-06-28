
--UC-1
CREATE  DATABASE PAYROLL;

--UC-2
CREATE TABLE employee_payroll
(
id INT NOT NULL IDENTITY(1,1),
name VARCHAR(150) NOT NULL,
salary FLOAT NOT NULL,
start DATE NOT NULL,
PRIMARY KEY (id)
);

--UC-3
insert into employee_payroll (name, salary, start) VALUES
( 'Amit', 100000.00, '2022-01-12' ),
( 'jitu', 200000.00, '2022-02-13' ),
( 'nitu', 300000.00, '2022-03-14' );

--UC-4
select * from employee_payroll;

--UC-5
select salary from employee_payroll WHERE name = 'Amit';

select * from employee_payroll where start BETWEEN CAST('2022-01-01' AS DATE) AND GETDATE();


--UC-6

ALTER TABLE employee_payroll add gender CHAR(1);

UPDATE employee_payroll set gender = 'F' WHERE id ='3';
UPDATE employee_payroll set gender = 'M' WHERE id ='1' or id ='2' ;

SELECT id, name, gender, salary, start FROM employee_payroll;

--UC-7
SELECT gender, SUM(salary) AS Salary_Sum FROM employee_payroll GROUP BY gender;
SELECT gender, AVG(salary) AS Avg_Sal FROM employee_payroll GROUP BY gender;
SELECT gender, MIN(salary) AS Min_Sal FROM employee_payroll GROUP BY gender;
SELECT gender, MAX(salary) Max_Sal FROM employee_payroll GROUP BY gender;
SELECT gender, COUNT(gender) as GenderCount FROM employee_payroll GROUP BY gender;


--UC-8

ALTER TABLE employee_payroll ADD phone_no VARCHAR(50);
 
ALTER TABLE employee_payroll ADD address VARCHAR(50);

ALTER TABLE employee_payroll ADD department VARCHAR(50) NOT NULL DEFAULT '0';

ALTER TABLE employee_payroll ADD CONSTRAINT taskdesc_default DEFAULT 'TBD' FOR address; ----//taskdesc_default is Constraint Name 


--UC-9
EXEC sp_RENAME 'employee_payroll.salary' , 'basic_pay'; 

ALTER TABLE employee_payroll ADD deductions float NOT NULL DEFAULT '';
ALTER TABLE employee_payroll ADD taxable_pay float NOT NULL DEFAULT '';
ALTER TABLE employee_payroll ADD tax float NOT NULL DEFAULT '';
ALTER TABLE employee_payroll ADD net_pay float NOT NULL DEFAULT '';

SELECT id, name, gender,phone_no, address, basic_pay, department, deductions, taxable_pay, tax, net_pay, start FROM employee_payroll;


--UC-10

UPDATE employee_payroll SET department = 'sales' WHERE name = 'nitu'; 

INSERT INTO employee_payroll
(name , basic_pay, start, gender, phone_no, address, department, deductions, taxable_pay, tax, net_pay) VALUES 
('nitu', 300000, '2022-03-14', 'F', '9998887770', '33/9 ayodhya nagar', 'sales', 200000, 100000, 500000, 1500000);

UPDATE employee_payroll SET department = 'Marketing' WHERE id = '8';

--UC-11     creating multiple tables to implement ER Diagram

--// EMPLOYEE table 
---DROP TABLE EMPLOYEE;----

CREATE TABLE EMPLOYEE
(id INT IDENTITY(1,1) PRIMARY KEY(id),
name VARCHAR(50),
phone_no VARCHAR(30),
address VARCHAR(250));


--//EmployeeDetails table
---DROP TABLE EmployeeDetails-----

CREATE TABLE EmployeeDetails(
id INT IDENTITY(1,1) PRIMARY KEY(ID),
Emp_Name VARCHAR(1),
gender CHAR(1),
Payroll_ID int not null Foreign key References employee_PayRoll(id),
ADDRESS VARCHAR(300));


--//Department table
CREATE TABLE Department(Dept_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,DeptName VARCHAR(50) NOT NULL);


--//Employee_Department table
CREATE TABLE Employee_Department(
Emp_id int NOT NULL Foreign key references EmployeeDetails(ID),
Dept_id int NOT NULL Foreign key references Department(Dept_id) 
);


select * from EMPLOYEE;
select * from EmployeeDetails;
select * from Department;
select * from Employee_Department;


--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

