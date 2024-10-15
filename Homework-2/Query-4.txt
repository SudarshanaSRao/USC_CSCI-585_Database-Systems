-- This query was executed in Microsoft SQL Server Management Studio (SSMS).

				-- Question 4: -
-- Number of scans:
SELECT COUNT(*) AS Scan_number
FROM Temperature_Scan
WHERE TempScan_date BETWEEN '2023-01-01' AND '2023-04-30';

-- Number of tests:
SELECT COUNT(*) AS Test_number
FROM Test_reports
WHERE Testing_date BETWEEN '2023-09-01' AND '2023-11-30';

-- Number of self-reports:
SELECT COUNT(DISTINCT E_ID) AS SelfReports_number
FROM Symptoms
WHERE Reported_date BETWEEN '2023-09-01' AND '2023-12-31';

-- Number of positive cases:
SELECT COUNT(*) AS PositiveCases_number
FROM Test_reports
WHERE Testing_date BETWEEN '2023-06-01' AND '2023-12-31' AND Test_result = 'Positive';