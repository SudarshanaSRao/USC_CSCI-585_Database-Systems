-- This query was executed in Microsoft SQL Server Management Studio (SSMS).

				-- Question 2:-
SELECT TOP 1 Syms_ID, COUNT(Syms_ID) AS Self_reportCount
FROM Symptoms
GROUP BY Syms_ID
ORDER BY Self_reportCount DESC;