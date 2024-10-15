-- This query was executed in Microsoft SQL Server Management Studio (SSMS).

				-- Question 1: -
---- Creating the tables of the database ----
-- Employees table:
CREATE TABLE Employees (E_ID VARCHAR(255) PRIMARY KEY, -- E_ID is the employee's ID (Professional Service Number).
			E_name VARCHAR(255), -- E_name is the employee's name.
                        Office_number INT,
                        Floor_number INT,
                        Phone_number VARCHAR(15),
                        Email_ID VARCHAR(255));

-- Meetings table:
CREATE TABLE Meetings (Meet_ID INT PRIMARY KEY,
		       E_ID VARCHAR(255),
                       Room_number INT,
                       Floor_number INT,
                       Meet_startTime INT,
		       FOREIGN KEY (E_ID) REFERENCES Employees(E_ID));

-- Notifications table:
CREATE TABLE Notifications (Notify_ID INT PRIMARY KEY,
                            E_ID VARCHAR(255),
                            Notify_date DATE,
                            Notify_type VARCHAR(20),
                            FOREIGN KEY (E_ID) REFERENCES Employees(E_ID));

-- Symptoms table:
CREATE TABLE Symptoms (TableRow_ID INT PRIMARY KEY,
		       E_ID VARCHAR(255),
                       Reported_date DATE,
                       Syms_ID INT,
                       FOREIGN KEY (E_ID) REFERENCES Employees(E_ID));

-- Test_reports table:
CREATE TABLE Test_reports (TestReports_ID INT PRIMARY KEY,
                           E_ID VARCHAR(255),
                           Testing_location VARCHAR(255),
                           Testing_date DATE,
                           Testing_time INT,
                           Test_result VARCHAR(10),
                           FOREIGN KEY (E_ID) REFERENCES Employees(E_ID));

-- Case_testReport table
CREATE TABLE [Case_testReport] (TestCase_ID INT PRIMARY KEY,
                                E_ID VARCHAR(255),
                                TestPositive_date DATE,
                                Resolution VARCHAR(50),
                                FOREIGN KEY (E_ID) REFERENCES Employees(E_ID));

-- Health_status table
CREATE TABLE Health_status (TableRow_ID INT PRIMARY KEY,
                            E_ID VARCHAR(255),
                            HealthCheck_date DATE,
                            Current_status VARCHAR(20),
                            FOREIGN KEY (E_ID) REFERENCES Employees(E_ID));

-- Temperature_Scan table: additional table created!
CREATE TABLE Temperature_Scan (TempScan_ID INT PRIMARY KEY,
                               TempScan_date DATE,
                               TempScan_time INT,
                               E_ID VARCHAR(255),
                               Temperature DECIMAL(5, 2), -- Measured in Fahrenheit.
                               FOREIGN KEY (E_ID) REFERENCES Employees(E_ID));

---- Populating the tables with values ----
-- Values for Employees table:
INSERT INTO Employees (E_ID, E_name, Office_number, Floor_number, Phone_number, Email_ID)
VALUES
	  ('1PSN22ML001', 'Samurai Steve', 401, 4, '213-284-0536', 'stevesam@it.com'),
	  ('1PSN22ML002', 'Geralt Rivia', 804, 8, '213-333-5000', 'riviager@it.com'),
	  ('1PSN22ML003', 'Cirilla Cintra', 903, 9, '561-330-3375', 'cintracir@it.com'),
	  ('1PSN22ML004', 'Yennefer Vengerberg', 404, 4, '761-895-2222', 'vengyen@it.com'), -- Error 404: Not found lol!
	  ('1PSN22ML005', 'Triss Merigold', 405, 4, '800-235-4471', 'merigoldtri@it.com'),
	  ('1PSN22ML006', 'Sigismund Dijkstra', 504, 5, '213-221-4456', 'dijks@it.com'),
	  ('1PSN22ML007', 'Ramesh Paul', 602, 6, '457-998-5252', 'paulram@it.com'),
	  ('1PSN22ML008', 'Virat Kohli', 505, 5, '100-200-3000', 'kohlivir@it.com'),
	  ('1PSN22ML009', 'Rohit Sharma', 601, 6, '222-777-5656', 'sharmaroh@it.com'),
	  ('1PSN22ML010', 'Jasprit Bumrah', 803, 8, '456-897-5562', 'bumrahjas@it.com'),
	  ('1PSN22ML011', 'Abraham Villiers', 802, 8, '456-369-8745', 'villab@it.com'),
	  ('1PSN22ML012', 'Chris Gayle', 901, 9, '912-892-5648', 'gaylechr@it.com'),
	  ('1PSN22ML013', 'Mahendra Dhoni', 905, 9, '809-513-8238', 'dhonims@it.com'),
	  ('1PSN22ML014', 'Sachin Tendulkar', 403, 4, '988-600-6791', 'tendsach@it.com'),
	  ('1PSN22ML015', 'Neeraj Chopra', 801, 8, '934-256-8966', 'chopranee@it.com'),
	  ('1PSN22ML016', 'Nick Adams', 604, 6, '809-550-6790', 'adamsni@it.com'),
	  ('1PSN22ML017', 'Matthew Pardo', 501, 5, '266-092-8691', 'pardomat@it.com'),
	  ('1PSN22ML018', 'Daniel Vega', 603, 6, '080-413-1969', 'vegadan.com'),
	  ('1PSN22ML019', 'Henry Conroy', 502, 5, '424-880-9974', 'conroyh@it.com'),
	  ('1PSN22ML020', 'Andrew Walker', 605, 6, '742-894-3357', 'walkand@it.com'),
	  ('1PSN22ML021', 'Casey Adams', 902, 9, '666-451-2358', 'adamscas@it.com'),
	  ('1PSN22ML022', 'Gabriel Maymon', 805, 8, '709-805-0460', 'maymongab@it.com'),
	  ('1PSN22ML023', 'Zack Shawn', 402, 4, '903-525-3535', 'shawnza@it.com'),
	  ('1PSN22ML024', 'Gwen Stacy', 503, 5, '416-1780-5023', 'gwanda@it.com'),
	  ('1PSN22ML025', 'Mary Jane', 903, 9, '678-904-2058', 'janemar@it.com');

-- Values for the Meetings table:
INSERT INTO Meetings (Meet_ID, E_ID, Room_number, Floor_number, Meet_startTime)
VALUES
      (01, '1PSN22ML004', 10100, 4, 10),   
      (02, '1PSN22ML007', 10103, 6, 11),
      (03, '1PSN22ML005', 10104, 4, 12),
      (04, '1PSN22ML013', 10100, 4, 2),
      (05, '1PSN22ML011', 10100, 4, 4),
      (06, '1PSN22ML002', 10104, 4, 3), 
      (07, '1PSN22ML008', 10103, 6, 5),
      (08, '1PSN22ML015', 10103, 6, 11),
      (09, '1PSN22ML003', 10103, 6, 4), 
      (10, '1PSN22ML009', 10102, 9, 3),
      (11, '1PSN22ML025', 10102, 9, 10),
      (12, '1PSN22ML020', 10103, 6, 12),  
      (13, '1PSN22ML014', 10101, 4, 3), 
      (14, '1PSN22ML016', 10101, 6, 5),  
      (15, '1PSN22ML001', 10102, 4, 5); 

-- Values for the Notifications table:
INSERT INTO Notifications (Notify_ID, E_ID, Notify_date, Notify_type)
VALUES
      (01, '1PSN22ML008', '2023-09-27', 'Mandatory'), -- Employee tested positive.
      (02, '1PSN22ML014', '2023-11-11', 'Mandatory'), -- Employee tested positive.
      (03, '1PSN22ML015', '2023-06-04', 'Mandatory'), -- Employee tested positive.  
      (04, '1PSN22ML007', '2023-06-07', 'Mandatory'), -- Employee tested positive.  
      (05, '1PSN22ML006', '2023-09-28', 'Optional'), -- Employee was present on the same floor as one of the infected employee.  
      (06, '1PSN22ML017', '2023-09-22', 'Optional'), -- Employee was present on the same floor as one of the infected employee.   
      (07, '1PSN22ML019', '2023-09-21', 'Optional'), -- Employee was present on the same floor as one of the infected employee. 
      (08, '1PSN22ML001', '2023-09-20', 'Optional'), -- Employee was present on the same floor as one of the infected employee. 
      (09, '1PSN22ML004', '2023-09-19', 'Optional'), -- Employee was present on the same floor as one of the infected employee.  
      (10, '1PSN22ML005', '2023-09-18', 'Optional'), -- Employee was present on the same floor as one of the infected employee. 
      (11, '1PSN22ML023', '2023-09-17', 'Optional'), -- Employee was present on the same floor as one of the infected employee.  
      (12, '1PSN22ML002', '2023-09-16', 'Optional'), -- Employee was present on the same floor as one of the infected employee.  
      (13, '1PSN22ML010', '2023-09-15', 'Optional'), -- Employee was present on the same floor as one of the infected employee.  
      (14, '1PSN22ML011', '2023-09-14', 'Optional'), -- Employee was present on the same floor as one of the infected employee. 
      (15, '1PSN22ML009', '2023-09-13', 'Optional'), -- Employee was present on the same floor as one of the infected employee.  
      (16, '1PSN22ML022', '2023-09-12', 'Optional'), -- Employee was present on the same floor as one of the infected employee. 
      (17, '1PSN22ML008', '2023-09-11', 'Optional'), -- Employee was present on the same floor as one of the infected employee.
      (18, '1PSN22ML009', '2023-10-12', 'Optional'), -- Employee was present on the same floor as one of the infected employee.
      (19, '1PSN22ML016', '2023-01-11', 'Mandatory'), -- Employee was present in the same meeting as one of the infected employee. 
      (20, '1PSN22ML018', '2023-02-20', 'Optional'), -- Employee was present on the same floor as one of the infected employee.
      (21, '1PSN22ML020', '2023-10-12', 'Mandatory'), -- Employee was present in the same meeting as one of the infected employee.
      (22, '1PSN22ML003', '2023-04-03', 'Mandatory'); -- Employee was present in the same meeting as one of the infected employee.

-- Values into the Symptoms table:
INSERT INTO Symptoms (TableRow_ID, E_ID, Reported_date, Syms_ID)
VALUES
      (01, '1PSN22ML008', '2023-09-25', 4),   
      (02, '1PSN22ML011', '2023-10-01', 4), 
      (03, '1PSN22ML014', '2023-11-09', 5),  
      (04, '1PSN22ML025', '2023-11-26', 3),  
      (05, '1PSN22ML020', '2023-07-12', 2),  
      (06, '1PSN22ML004', '2023-05-11', 1),   
      (07, '1PSN22ML015', '2023-06-02', 4),  
      (08, '1PSN22ML022', '2023-06-03', 3),  
      (09, '1PSN22ML007', '2023-06-05', 5),  
      (10, '1PSN22ML019', '2023-01-01', 4), 
      (11, '1PSN22ML013', '2023-02-22', 3), 
      (12, '1PSN22ML010', '2023-12-04', 2),
      (13, '1PSN22ML001', '2023-12-09', 5),
      (14, '1PSN22ML002', '2023-10-02', 4),  
      (15, '1PSN22ML003', '2023-04-04', 1),  
      (16, '1PSN22ML006', '2023-08-10', 2), 
      (17, '1PSN22ML016', '2023-12-12', 1), 
      (18, '1PSN22ML024', '2023-06-13', 3);  

-- Values for the Test_reports table:
INSERT INTO Test_reports (TestReports_ID, E_ID, Testing_location, Testing_date, Testing_time, Test_result)
VALUES
      (01, '1PSN22ML008', 'Company', '2023-09-25', 11, 'Positive'),   
      (02, '1PSN22ML011', 'Clinic', '2023-10-01', 9, 'Negative'),  
      (03, '1PSN22ML014', 'Hospital', '2023-11-09', 12, 'Positive'),  
      (04, '1PSN22ML025', 'Hospital', '2023-11-26', 10, 'Negative'),  
      (05, '1PSN22ML020', 'Company', '2023-07-12', 10, 'Negative'),  
      (06, '1PSN22ML004', 'Company', '2023-05-11', 11, 'Negative'),  
      (07, '1PSN22ML015', 'Clinic', '2023-06-02', 23, 'Positive'),  
      (08, '1PSN22ML022', 'Company', '2023-06-03', 20, 'Negative'),  
      (09, '1PSN22ML007', 'Hospital', '2023-06-05', 21, 'Positive'),  
      (10, '1PSN22ML021', 'Company', '2023-10-29', 2, 'Negative'),  
      (11, '1PSN22ML001', 'Clinic', '2023-11-30', 2, 'Negative'), 
      (12, '1PSN22ML002', 'Hospital', '2023-10-10', 3, 'Negative'), 
      (13, '1PSN22ML003', 'Hospital', '2023-10-23', 4, 'Negative'),  
      (14, '1PSN22ML004', 'Company', '2023-10-04', 6, 'Negative'),  
      (15, '1PSN22ML005', 'Company', '2023-01-04', 10, 'Negative'),  
      (16, '1PSN22ML010', 'Clinic', '2023-01-05', 12, 'Negative'), 
      (17, '1PSN22ML006', 'Company', '2023-07-06', 11, 'Negative'), 
      (18, '1PSN22ML009', 'Hospital', '2023-12-07', 16, 'Negative'),  
      (19, '1PSN22ML023', 'Company', '2023-12-08', 15, 'Negative'), 
      (20, '1PSN22ML024', 'Clinic', '2023-11-09', 19, 'Negative'); 

-- Values for the Case_testReport table:
INSERT INTO [Case_testReport] (TestCase_ID, E_ID, TestPositive_date, Resolution)
VALUES
      (01, '1PSN22ML008', '2023-09-25', 'Back to Work'),       
      (02, '1PSN22ML014', '2023-11-09', 'Deceased'),         
      (03, '1PSN22ML015', '2023-06-02', 'Deceased'),      
      (04, '1PSN22ML007', '2023-06-05', 'Left the Company'), 
      (05, '1PSN22ML016', '2023-09-26', 'Deceased'),      
      (06, '1PSN22ML020', '2023-10-12', 'Left the Company'),  
      (07, '1PSN22ML003', '2023-04-03', 'Back to Work'),      
      (08, '1PSN22ML006', '2023-09-28', 'Left the Company'),      
      (09, '1PSN22ML017', '2023-09-22', 'Left the Company'),  
      (10, '1PSN22ML019', '2023-09-21', 'Back to Work');    

-- Values for the Health_status table:
INSERT INTO Health_status (TableRow_ID, E_ID, HealthCheck_date, Current_status)
VALUES
      (01, '1PSN22ML008', '2023-09-30', 'Sick'),          
      (02, '1PSN22ML014', '2023-11-11', 'Hospitalized'), 
      (03, '1PSN22ML015', '2023-06-04', 'Hospitalized'),         
      (04, '1PSN22ML007', '2023-06-06', 'Sick'), 
      (05, '1PSN22ML016', '2023-09-28', 'Hospitalized'),         
      (06, '1PSN22ML020', '2023-10-14', 'Sick'),  
      (07, '1PSN22ML003', '2023-04-05', 'Well'),         
      (08, '1PSN22ML006', '2023-09-30', 'Well'),         
      (09, '1PSN22ML017', '2023-09-24', 'Sick'),  
      (10, '1PSN22ML019', '2023-09-23', 'Well'),        
      (11, '1PSN22ML005', '2023-09-20', 'Well'),        
      (12, '1PSN22ML023', '2023-09-19', 'Well');       

-- Values for the Temperature_Scan table:
INSERT INTO Temperature_Scan (TempScan_ID, E_ID, TempScan_date, TempScan_time, Temperature)
VALUES
      (1, '1PSN22ML008', '2023-01-28', 9, 100.0),
      (2, '1PSN22ML020', '2023-02-27', 10, 104.0),
      (3, '1PSN22ML004', '2023-03-26', 10, 110.2),
      (4, '1PSN22ML022', '2023-04-25', 10, 105.4),
      (5, '1PSN22ML021', '2023-04-24', 9, 100.3),
      (6, '1PSN22ML023', '2023-05-23', 6, 99.9),
      (7, '1PSN22ML004', '2023-05-22', 6, 98.8),
      (8, '1PSN22ML005', '2023-06-21', 6, 98.9),
      (9, '1PSN22ML006', '2023-06-20', 5, 100.5),
      (10, '1PSN22ML014', '2023-07-19', 5, 99.0),
      (11, '1PSN22ML007', '2023-08-18', 11, 99.2),
      (12, '1PSN22ML016', '2023-09-17', 10, 98.6),
      (13, '1PSN22ML003', '2023-10-16', 9, 98.7),
      (14, '1PSN22ML025', '2023-11-15', 9, 97.0),
      (15, '1PSN22ML001', '2023-12-14', 5, 97.9),
      (16, '1PSN22ML002', '2023-11-13', 6, 96.6),
      (17, '1PSN22ML010', '2023-01-12', 5, 95.5),
      (18, '1PSN22ML011', '2023-01-11', 9, 99.4),
      (19, '1PSN22ML012', '2023-02-10', 10, 96.2),
      (20, '1PSN22ML007', '2023-03-09', 6, 98.5);