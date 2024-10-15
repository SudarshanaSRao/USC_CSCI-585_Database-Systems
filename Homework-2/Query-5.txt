-- This query was executed in Microsoft SQL Server Management Studio (SSMS).

				-- Question 5: -
-- Which employees, after being tested for COVID-19 and receiving a positive test result, have also been notified and exhibited a body temperature exceeding 98.5 degrees Fahrenheit?
SELECT E.E_ID, E.E_name
FROM Employees E
WHERE EXISTS (SELECT T.TestReports_ID
	      FROM Test_reports T
	      WHERE T.E_ID = E.E_ID AND T.Test_result = 'Positive')
      AND EXISTS (SELECT N.Notify_ID
		  FROM Notifications N
		  WHERE N.E_ID = E.E_ID)
      AND EXISTS (SELECT TS.TempScan_ID
		  FROM Temperature_Scan TS
		  WHERE TS.E_ID = E.E_ID AND TS.Temperature > 98.5);

-- "Which employees have been tested for COVID-19 and have received a positive test result for all their tests? (Second query that involves table division!)
SELECT E.E_ID, E.E_name
FROM Employees E
WHERE NOT EXISTS (SELECT T.TestReports_ID
		  FROM Test_reports T
		  WHERE T.E_ID = E.E_ID AND T.Test_result = 'Negative')
      AND EXISTS (SELECT T.TestReports_ID
		  FROM Test_reports T
		  WHERE T.E_ID = E.E_ID AND T.Test_result = 'Positive');