﻿USE Enterprise
SELECT FirstName, Phone FROM dbo.Employees;

SELECT SUM([Money]) FROM Payouts;

SELECT COUNT(Id) FROM Payouts;

SELECT FirstName, LastName FROM Employees WHERE PositionID = 1;

SELECT FirstName, LastName FROM Employees WHERE BirthDay <= '01.01.2000';

SELECT Id, FirstName, LastName FROM Employees WHERE Phone = '0985552311' OR Email = '435hgt@gmail.com';

SELECT Id, FirstName, LastName FROM Employees WHERE NOT Phone = '0985552311' AND NOT Email = '123435DF@gmail.com';

SELECT Id, FirstName, LastName FROM Employees WHERE Id IN (1, 3, 5);

SELECT Id, FirstName, LastName, Phone FROM Employees WHERE NOT Id IN (2, 4, 5);

SELECT Id, FirstName, LastName, Phone FROM Employees WHERE  Id BETWEEN 2 AND 4;

SELECT Id, FirstName, LastName, ISNULL(Email, N'Отсуцтвует') AS СВЯЗЬ FROM Employees;

SELECT Id, FirstName, LastName, Email FROM Employees WHERE Email IS NULL;

SELECT Id, FirstName, LastName, ISNULL(Email, Phone) AS СВЯЗЬ FROM Employees WHERE Email IS NULL;

SELECT Id, FirstName, LastName, MiddleName, Phone, Email, BirthDay, EmploymentDate, (SELECT [PositionName] FROM Positions WHERE Id = PositionID) AS Position, (SELECT [DepartmentName] FROM Depart WHERE Id = DepartmentID) AS Department FROM Employees WHERE MiddleName LIKE N'%димир%';

SELECT Id, FirstName, LastName, MiddleName, Phone, Email, BirthDay, EmploymentDate FROM Employees WHERE MiddleName NOT LIKE N'[А-В]%'; --LIKE N'[^А-В]%';

SELECT Id, FirstName, LastName, MiddleName, Phone, Email, BirthDay, EmploymentDate FROM Employees WHERE Email LIKE N'%@mail.r_';

SELECT Id, FirstName, LastName, MiddleName, Phone, Email, BirthDay, EmploymentDate FROM Employees WHERE Email LIKE N'%[%]%'; --ESCAPE '%';


SELECT * FROM Logs WHERE EmployeeID = 1;


--расширенные возмошности выборки

SELECT FirstName, (SELECT [PositionName] FROM Positions WHERE Id = PositionID) AS Position FROM Employees GROUP BY PositionID, FirstName;

SELECT 
E.Id AS ИД, E.LastName AS 'ИМЯ', E.MiddleName AS 'ФАМИЛИЯ', P.PositionName AS 'ПОЗИЦИЯ', D.DepartmentName AS 'ОТДЕЛ'
FROM Employees AS E
JOIN Positions AS P 
ON E.PositionID = P.Id
JOIN Depart AS D
ON E.DepartmentID = D.Id


--1. Получить текущие дату-время
--2. Получить год из переданной даты-времени
--3. Получить месяц из переданной даты-времени
--4. Получить дату из переданной даты-времени
--5. Получить разницу в днях между двумя дата-время
--6. Получить дату которая через 2 месяца после переданной даты
--7. Получить дату которая 1 год, 2 месяца, 3 дня назад от переданной даты

--1
SELECT GETDATE() AS [DATE];

--2
SELECT (YEAR(GETDATE())) AS [YEAR];

--3
SELECT (MONTH(GETDATE())) AS [MONTH];

--4
SELECT (DAY(GETDATE())) AS [DAY];

--5 
SELECT DATEDIFF(day, '2007-04-30 13:10:02', GETDATE())  AS [DAY];

--6
SELECT DATEADD(month, 2, GETDATE()) AS [MONTH];

--7
SELECT DATEFROMPARTS((YEAR(GETDATE()) - 1), (MONTH(GETDATE()) -2), (DAY(GETDATE()) - 3)) AS [DATETIME];


