--Populate EMPLOYEE
 
INSERT INTO EMPLOYEE (E_ID, E_FirstName, E_MiddleInitial, E_LastName, E_Street, E_City, E_State, E_PostalCode, E_Phone, E_Email, E_DOB, E_Gender, E_JobTitle, E_JobType)
VALUES(12322, 'Siri' , 'A', 'Mini', '111 Ian MacDonald Blvd', 'North York', 'ON', 'M3J1P3',1234,'jflkjdaldfkjalkld@qq.com', '1988-04-09', 'Male', 'Cardiologist', ''M''),
  	 (88992, 'Schulich', 'B', 'YY', '1890 Ian Manald Blvd', 'Toronto', 'ON', 'M8J8P9',123273, '99080@gmail.com', '1997-12-08', 'Female', 'Physician', ''M''),
  	         (77478, 'Rotman', ''C'', 'ZZ', '105 St George St', 'Toronto', 'ON','M5S3E6',97388, '333@rotman.com', '1876-11-08', 'Male', 'Receptionist', 'N'),
              (98088, 'Alexa', 'D', 'Amazon', '8050 Heritage Rd', 'Brampton', 'ON','L6Y0C9', 877586, 'cs-reply@amazon.in', '1964-01-12', 'Male', 'Pro Physician', ''M'');
SELECT * FROM Employee;
--Populate MEDICAL_EMP

INSERT INTO Medical_Employee (ME_ID)
VALUES(12322),
              (88992),
              (98088);

SELECT * FROM Medical_Employee;

--Populate NON_MEDICAL

INSERT INTO Non_Medical_Employee(NME_ID)
VALUES(77478);

SELECT * FROM Non_Medical_Employee;

--Populate JOB_HISTORY

INSERT INTO JOB_HISTORY (J_JobTitle, J_StartDate, J_EndDate, E_ID)
VALUES('Cardiologist', '2018-10-10','2019-10-01' , 12322),
              ('Physician', '2011-10-10', '2018-10-10', 12322),
              ('Nurse', '2011-10-10','2017-09-08',88992),
              ('Clerk', '2011-10-11','2033-12-03',77478),
              ('Data entry', '2009-10-11','2011-10-11',77478),
              ('Physician', '2011-10-11','2098-08-05',98088);

SELECT * FROM Job_History;
 
--Populate CONSUMABLE
 
INSERT INTO CONSUMABLE(C_ID, C_Name, C_Description, C_Quantity)
VALUES(000, 'needle', 'a small, very thin piece of polished metal which is used for sewing',250),
  	(001, 'mask', 'worn by health professionals during health care procedures', 150),
  	(002, 'medical gloves', 'disposable gloves used during medical examinations and procedures', 500);
 
SELECT * FROM Consumable; 
--Populate MEDICATION
 
INSERT INTO MEDICATION(M_ID, M_Name, M_Description, M_Quantity)
VALUES('100', 'Amoxicillin', 'penicillin antibiotic that fights bacteria', 50),
  	('200', 'Codeine', 'opiate used to treat pain, coughing, and diarrhea', 45),
  	('300', 'Viagra', 'relaxes muscles found in the walls of blood vessels and increases blood flow', 70),
    ('400', 'Advil', 'used for treating pain, fever, and inflammation',80);

SELECT * FROM Medication;
--Populate VENDOR
 
INSERT INTO VENDOR (V_ID, V_Name, V_Phone, V_Email, V_ContactFirstName,
V_ContactMiddleInitial,V_ContactLastName)
VALUES(01,'Vendor_one', 1928374365, 'cusservice@vendor_one.com', 'Kelly', 'Y', 'Green'),
              (02,'Vendor_two', 1234283049, 'cusservice@vendor_two.com', 'Lucas', 'Z', 'Yan');
SELECT * FROM Vendor;
--Populate INVENTORY
 
INSERT INTO INVENTORY (Inv_ID, V_ID, Inv_Type)
VALUES(000,01,'C'),
              (001,01,'C'),
              (002,02,'C'),
              (100,02,'M'),
              (200,01,'M'),
              (300,01,'M'),
              (400,02,'M');
SELECT * FROM Inventory;
--Populate INVENTORY_USED
 
INSERT INTO INVENTORY_USED(Inv_ID, Complaint_ID)
VALUES('300', 1),
              ('200', 2),
              ('000', 2),
              ('100', 3),
              ('001', 3),
              ('100', 4),
              ('400', 5),
              ('002', 5),
              ('400', 6),
              ('100', 7);
SELECT * FROM Inventory_used;
--Populate APPOINTMENT
 
INSERT INTO APPOINTMENT(A_ID, Scheduled_DateTime, Actual_DateTime, EmployeeNote, DiagnosisDetail, TreatmentDetail, P_ID, ME_ID)
VALUES(101,'2019-10-24','2019-11-23', 'appointment rescheduled due to weather', 'erectile dysfunction','Viagra',10003, 12322),
      (202,'2019-10-09','2019-10-09', 'appointment on-time', 'diarrhea','Codeine',10001,12322),
      (303,'2019-10-18','2019-11-19', 'appointment on-time', 'fever','Amoxicillin', 10002, 98088),
      (404,'2019-10-11','2019-11-15', 'appointment rescheduled due to personal reasons', 'headache','Amoxicillin', 10004,12322),
      (505,'2019-10-10','2019-10-10', 'appointment rescheduled due to personal reasons', 'stomachache','Advil', 10005, 98088),
      (606,'2019-11-11','2019-11-11', 'appointment on-time', 'backache', 'Advil',10006,98088),
  	(707,'2019-10-09','2019-10-09', 'appointment rescheduled due to personal reasons', 'fever','Amoxicillin',10007,98088);


SELECT * FROM Appointment;



--Populate PATIENT
 
INSERT INTO PATIENT(P_ID, P_FirstName, P_MiddleInitial, P_LastName, P_Street, P_City, P_Province, P_PostalCode, P_Email, P_DOB, P_Gender, P_OHIP,P_NextofKin, P_FamilyDoctorName, P_FamilyDoctorNumber, P_OtherDetail)
VALUES(10001,'Nicole', 'Y', 'Yonge', '1001 Alexander Street', 'Toronto', 'ON', 'T0K5G6', 'ny@google.com', '1983-09-09','Female', 125532, 'Alex Yonge', 'Green', 1092, 'N/A'),
      (10002,'Ann', 'L', 'Green', '1231 Alexander Street', 'Toronto', 'ON', 'T4K5G7', 'att@google.com', '1983-10-09','Female', 1309849, 'Alex Yonge', 'Green', 26374, 'N/A' ),
      (10003, 'Tommy', 'H', 'Shi', '19991 Alexander Street', 'Toronto', 'ON', 'T2K5G6', 'lshi@google.com', '1983-09-12','Male', 123435, 'Bo Yonge', 'Green', 2986534, 'N/A' ),
      (10004,'Oleg', 'L', 'Yang', '2345 Alexander Street', 'Toronto', 'ON', 'T9K8G6', 'ojgi@google.com', '1903-01-04','Female', 1245462, 'Alex Cheng', 'Green', 987654, 'N/A' ),
      (10005,'Anna', 'F', 'Anne', '64254 Alexander Street', 'Toronto', 'ON', 'T3K5G4', 'aaaa@google.com', '1973-03-03','Female', 164743, 'Alex Anne', 'Green', 256789, 'N/A'),
      (10006,'Nancy', 'S', 'Yonge', '24556 Alexander Street', 'Toronto', 'ON', 'T4K5G5', 'nancyy@google.com', '1963-05-02','Female', 1436674, 'Alex Green', 'Green', 5678988, 'N/A'),
      (10007, 'Rakesh', 'S', 'Yonge', '93847 Alexander Street', 'Toronto', 'ON', 'T5K5G6', 'nicoley@google.com', '1993-01-01','Male', 1375377, 'Leo Yonge', 'Green', 1234, 'N/A');  
 SELECT * FROM Patient;
--Populate CLAIM
 
INSERT INTO CLAIM(Claim_ID, Procedure_Name, Amount_Submitted, Date_Submitted, Amount_Covered, I_PolicyNumber, Complaint_ID)
VALUES(1, 'Viagra',125.98,'2019-11-23',100.00,20001,1),
  	(2,'Codeine',25.00,'2019-10-09',25.00,20002,2),
  	(3,'Amoxicillin', 50.00, '2019-11-19',50.00,20003,3),
  	(4,'Amoxicillin',25.00,'2019-11-15', 25.00,20004,4),
  	(5,'Advil', 200.00, '2019-10-10', 150.00,20005,5),
  	(6,'Advil',250.00, '2019-11-11',100.00,20006,6),
  	(7,'Amoxicillin', 90.00, '2019-10-09',45.00,20007,7);
 SELECT * FROM Claim;
 
--Populate COMPLAINT
 
INSERT INTO COMPLAINT (Complaint_ID, Start_Date, End_Date)
VALUES(1,'2019-11-23','2019-12-05'),
      (2,'2019-10-09','2019-10-09'),
      (3,'2019-11-19','2019-11-19'),
      (4,'2019-11-15','2019-11-15'),
      (5,'2019-10-10','2019-10-10'),
      (6,'2019-11-11','2019-11-11'),
      (7,'2019-10-09','2019-10-09');
SELECT * FROM Complaint;

--Populate VISITING_REASON
 
INSERT INTO VISITING_REASON(Complaint_ID, A_ID)
VALUES(1, 101),
              (2, 202),
              (3, 303),
              (4, 404),
              (5, 505),
              (6, 606),
              (7, 707);

SELECT * FROM Visiting_Reason;

--Populate INSURANUM

INSERT INTO INSURANCENUM(I_PolicyNumber, P_id)
VALUES(20001,10001),
(20002,10002),
(20003,10003),
(20004,10004),
(20005,10005),
(20006,10006),
(20007,10007);

--Populate INSURANCE
INSERT INTO INSURANCE(I_PolicyNumber, I_name, I_phone, I_email)
VALUES(20001, 'SUNLIFE', 6478888, '20001@SUNLIFE.COM'),
(20002, 'SUNLIFE', 6478888, '20002@SUNLIFE.COM'),
(20003, 'SUNLIFE', 6478888, '20003@SUNLIFE.COM'),
(20004, 'SUNLIFE', 6478888, '20004@SUNLIFE.COM'),
(20005, 'SUNLIFE', 6478888, '20005@SUNLIFE.COM'),
(20006, 'SUNLIFE', 6478888, '20006@SUNLIFE.COM'),
(20007, 'SUNLIFE', 6478888, '20007@SUNLIFE.COM');