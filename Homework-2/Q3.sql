-- This query was executed in Microsoft SQL Server Management Studio (SSMS).

				-- Question 3: -
SELECT TOP 1 E.Floor_number, COUNT(H.Current_status) AS Sick_employeesCount
FROM Employees E
JOIN Health_status H ON E.E_ID = H.E_ID
WHERE H.Current_status = 'Sick'
GROUP BY E.Floor_number
ORDER BY Sick_employeesCount DESC;