-- This query shows each employee's details along with the total salary of their respective department.
SELECT
    EmployeeId,
    FullName,
    Department,
    Salary,
    SUM(Salary) OVER (PARTITION BY Department) AS DepartmentTotalSalary
FROM Employee
ORDER BY Department, Salary DESC;
    
-- This query displays each employee's salary and also the average salary for their department.
SELECT
    EmployeeId,
    FullName,
    Department,
    Salary,
    AVG(Salary) OVER (PARTITION BY Department) AS DepartmentAverageSalary
FROM Employee
ORDER BY Department, Salary DESC;
# Ranking Window Functions
-- ROW_NUMBER()
-- This query assigns a unique rank to each employee within their department, ordered by salary in descending order.
SELECT
    EmployeeId,
    FullName,
    Department,
    Salary,
    ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS RankInDepartment
FROM Employee
ORDER BY Department, RankInDepartment;
-- Rank()    
-- This query ranks all employees by salary. If multiple employees have the same salary, 
-- they share the same rank, and the next rank number is skipped.

SELECT
    EmployeeId,
    FullName,
    Department,
    Salary,
    RANK() OVER (ORDER BY Salary DESC) AS OverallSalaryRank
FROM Employee
ORDER BY OverallSalaryRank, EmployeeId;
    
-- DENSE_RANK()
-- This query ranks all employees by salary. If multiple employees have the same salary, 
-- they share the same rank, but the next rank number is consecutive (no gaps).
SELECT
    EmployeeId,
    FullName,
    Department,
    Salary,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS OverallSalaryDenseRank
FROM Employee
ORDER BY OverallSalaryDenseRank, EmployeeId;

# NTILE(n)
-- This query divides all employees into 4 salary groups (quartiles) based on their salary.
SELECT
    EmployeeId,
    FullName,
    Department,
    Salary,
    NTILE(4) OVER (ORDER BY Salary DESC) AS SalaryQuartile
FROM Employee
ORDER BY SalaryQuartile, Salary DESC;
-- -------------    
# 3. Value Window Functions (Analytic Functions)
-- LAG()
-- This query shows each employee's salary and the salary of the employee who is just "older" (based on ascending Age) 
-- than them in the same department.
SELECT
    EmployeeId,
    FullName,
    Department,
    Age,
    Salary,
    LAG(Salary, 1, 0) OVER (PARTITION BY Department ORDER BY Age ASC) AS PreviousEmployeeSalaryByAge
FROM Employee
ORDER BY Department,Age;
    
# LEAD()
-- This query displays each employee's salary and the salary of the employee who is just "younger" (based on ascending Age) 
-- than them in the same department.
SELECT
    EmployeeId,
    FullName,
    Department,
    Age,
    Salary,
    LEAD(Salary, 1, 0) OVER (PARTITION BY Department ORDER BY Age ASC) AS NextEmployeeSalaryByAge
FROM Employee
ORDER BY Department, Age;
    
# FIRST_VALUE()
-- This query shows each employee's details along with the salary of the youngest employee in their respective department.
SELECT
    EmployeeId,
    FullName,
    Department,
    Age,
    Salary,
    FIRST_VALUE(Salary) OVER (PARTITION BY Department ORDER BY Age ASC
                              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS YoungestEmployeeSalary
FROM Employee
ORDER BY Department, Age;

# LAST_VALUE()
-- This query shows each employee's details along with the salary of the oldest employee in their respective department.
SELECT
    EmployeeId,
    FullName,
    Department,
    Age,
    Salary,
    LAST_VALUE(Salary) OVER (PARTITION BY Department ORDER BY Age ASC
                             ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS OldestEmployeeSalary
FROM Employee
ORDER BY Department, Age;

# NTH_VALUE()
-- This query retrieves the salary of the second oldest employee for each department.
SELECT
    EmployeeId,
    FullName,
    Department,
    Age,
    Salary,
    NTH_VALUE(Salary, 2) OVER (PARTITION BY Department ORDER BY Age DESC
                               ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS SecondOldestEmployeeSalary
FROM Employee
ORDER BY Department, Age DESC;