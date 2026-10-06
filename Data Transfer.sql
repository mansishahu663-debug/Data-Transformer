 CREATE DATABASE data_transfer;
use data_transfer;

#--------- table 1 : customer ----------#
CREATE TABLE Customers (CustomerID INT PRIMARY KEY, FirstName VARCHAR(100), LastName VARCHAR(100), Email VARCHAR(100), RegistrationDate DATE);
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, RegistrationDate) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02');
SELECT * FROM Customers;

#--------- table 2 : orders ----------#
CREATE TABLE Orders ( OrderID INT PRIMARY KEY, CustomerID INT, OrderDate DATE, TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75);
SELECT * FROM Orders;

#--------- table 3 : employees ----------#
CREATE TABLE Employees ( EmployeeID INT PRIMARY KEY, FirstName VARCHAR(100), LastName VARCHAR(100), Department VARCHAR(50),  HireDate DATE, Salary DECIMAL(10, 2));
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, HireDate, Salary) VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00);
SELECT * FROM Employees;

#----- JOINS --------#
## 1. INNER JOIN: Retrieve all orders and customer details where orders exist.
SELECT T1.OrderID, T1.OrderDate, T1.TotalAmount, T2.FirstName, T2.LastName, T2.Email FROM Orders T1 INNER JOIN Customers T2 ON T1.CustomerID = T2.CustomerID;

## 2. LEFT JOIN: Retrieve all customers and their corresponding orders (if any).
SELECT T2.FirstName, T2.LastName, T1.OrderID, T1.TotalAmount, T1.OrderDate FROM Customers T2 LEFT JOIN Orders T1 ON T2.CustomerID = T1.CustomerID;

## 3. RIGHT JOIN: Retrieve all orders and their corresponding customers (if any).
SELECT T2.FirstName, T2.LastName, T1.OrderID, T1.TotalAmount, T1.OrderDate FROM Customers T2 RIGHT JOIN Orders T1 ON T2.CustomerID = T1.CustomerID;

## 4. FULL OUTER JOIN: Retrieve all customers and all orders, regardless of matching.
SELECT T2.CustomerID, T2.FirstName, T2.LastName, T1.OrderID, T1.OrderDate, T1.TotalAmount
FROM Customers T2 LEFT JOIN Orders T1 ON T2.CustomerID = T1.CustomerID 
UNION
SELECT T2.CustomerID, T2.FirstName, T2.LastName, T1.OrderID, T1.OrderDate, T1.TotalAmount
FROM Customers T2 RIGHT JOIN Orders T1 ON T2.CustomerID = T1.CustomerID  
WHERE T2.CustomerID IS NULL;

#----- Subqueries --------#
## 5. Subquery to find customers who have placed orders worth more than the average amount.
SELECT DISTINCT T2.FirstName, T2.LastName 
FROM Orders T1 JOIN Customers T2 ON T1.CustomerID = T2.CustomerID
WHERE T1.TotalAmount > (SELECT AVG(TotalAmount) FROM Orders);

## 6. Subquery to find employees with salaries above the average salary.
SELECT EmployeeID, FirstName, LastName, Salary 
FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

## 7. Extract the year and month from the OrderDate.
SELECT OrderID, OrderDate, EXTRACT(YEAR FROM OrderDate) AS OrderYear, EXTRACT(MONTH FROM OrderDate) AS OrderMonth FROM Orders; 

## 8. Calculate the difference in days between two dates (order date and current date).
SELECT OrderID, OrderDate, DATEDIFF(CURDATE(), OrderDate) AS DaysOrder FROM Orders;

## 9. Format the OrderDate to a more readable format (e.g., 'DD-MMM-YYYY').
SELECT OrderID, OrderDate, DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate FROM Orders;

## 10. Concatenate FirstName and LastName to form a full name.
SELECT FirstName, LastName, CONCAT(FirstName, ' ', LastName) AS FullName FROM Customers;

## 11. Replace part of a string (e.g., replace 'John' with 'Jonathan').
SELECT FirstName, REPLACE(FirstName, 'John', 'Jonathan') AS NewFirstName FROM Customers;

## 12. Convert FirstName to uppercase and LastName to lowercase.
SELECT FirstName, LastName, UPPER(FirstName) AS UpperFirst, LOWER(LastName) AS LowerLast FROM Customers;

## 13. Trim extra spaces from the Email field.
SELECT Email, TRIM(Email) AS TrimmedEmail FROM Customers;

## 14. Calculate the running total of Total Amount for each order.
SELECT OrderID, OrderDate, TotalAmount, SUM(TotalAmount) OVER (ORDER BY OrderDate ROWS UNBOUNDED PRECEDING) AS RunningTotal FROM Orders;

## 15. Rank orders based on TotalAmount using the RANK() function.
SELECT OrderID, TotalAmount, RANK() OVER (ORDER BY TotalAmount DESC) AS OrderRank FROM Orders;

## 16. Assign a discount based on TotalAmount in orders.
SELECT OrderID, TotalAmount, CASE WHEN TotalAmount > 200 THEN '10% off' WHEN TotalAmount > 100 THEN '5% off' ELSE 'No Discount' END AS DiscountOffer FROM Orders;
 
## 17. Categorize employees' salaries as high, medium, or low.
SELECT EmployeeID, FirstName, Salary, CASE WHEN Salary >= 60000 THEN 'High' WHEN Salary >= 50000 THEN 'Medium' ELSE 'Low' END AS SalaryCategory FROM Employees;

