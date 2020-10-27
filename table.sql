

/*Tables are created for database group assignment*/



-- Create PATIENT

CREATE TABLE PATIENT
(
  P_ID                 integer            PRIMARY KEY,
  P_FirstName          varchar(55),
  P_MiddleInitial      varchar(55),
  P_LastName          varchar(55),    
  P_Street             varchar(55),
  P_City               varchar(55),
  P_Province           char(2), 
  P_PostalCode         varchar(6),
  P_Email              varchar(255),
  P_DOB                date,
  P_Gender             varchar(55),
  P_OHIP               integer,
  P_NextofKin          varchar(55),
  P_FamilyDoctorName     varchar(55),
  P_FamilyDoctorNumber    integer,
  P_OtherDetail        varchar(55),
  P_InsurancePolicyNumber     integer
  );

-- Create APPOINTMENT

CREATE TABLE APPOINTMENT
(
  A_ID            integer     PRIMARY KEY,
  Scheduled_DateTime    date,
  Actual_DateTime      date, 
  EmployeeNote         varchar(55),
  DiagnosisDetail      varchar(55),          
  TreatmentDetail      varchar(55),
  P_ID               integer,
  ME_ID              integer
);


-- Create INSURANCE

CREATE TABLE INSURANCE
(
  I_PolicyNumber    integer   primary key,
  I_Name      varchar(55),           
  I_Phone      integer,
  I_Email     varchar(55)         
);


-- Create CLAIM

CREATE TABLE CLAIM
(
  Claim_ID           integer       NOT NULL,
  Procedure_Name        varchar(55),
  Amount_Submitted       DECIMAL(11), 
  Date_Submitted        date,
  Amount_Covered        DECIMAL(11),
  I_PolicyNumber        integer,
  Complaint_ID          integer,               
  PRIMARY KEY (Claim_ID)
);

-- Create VENDOR

CREATE TABLE VENDOR
(
  V_ID           integer   NOT NULL,
  V_Name         VARCHAR(25),    
  V_Phone        integer,
  V_Email        VARCHAR(50),
  V_ContactFirstName    VARCHAR(25),
  V_ContactMiddleInitial    VARCHAR(1),
  V_ContactLastName         VARCHAR(25),
  PRIMARY KEY (V_ID)
);



-- Create INSURANCENUM         ## COMPOSITE PRIMARY KEY

CREATE TABLE INSURANCENUM
(
  I_PolicyNumber   integer     NOT NULL,
  P_ID            integer     NOT NULL
);



-- Create INVENTORY

CREATE TABLE INVENTORY
(
  Inv_ID        integer   NOT NULL,    
  Inv_Type          char(1),  
   V_ID          integer,
  PRIMARY KEY (Inv_ID)
);



-- Create CONSUMABLE

CREATE TABLE CONSUMABLE
(
  C_ID           integer      NOT NULL,
  C_Name          VARCHAR(25),
  C_Description    VARCHAR(100),
  C_Quantity           integer, 
  PRIMARY KEY (C_ID)
);



-- Create MEDICATION

CREATE TABLE MEDICATION
(
  M_ID       integer    NOT NULL,
  M_Name     VARCHAR(25),
  M_Description    VARCHAR(100),
  M_Quantity     integer, 
  PRIMARY KEY (M_ID)
);



-- Create SKILL

CREATE TABLE SKILL
(
  Skill       varchar(55)   NOT NULL,
  E_ID        integer
);



-- Create EMPLOYEE

CREATE TABLE EMPLOYEE
(
  E_ID           integer    NOT NULL,
  E_FirstName        VARCHAR(25),
  E_MiddleInitial     VARCHAR(1),
  E_LastName          VARCHAR(25),
  E_Street            VARCHAR(25),
  E_City              VARCHAR(25),
  E_State             CHAR(2),
  E_PostalCode        VARCHAR(6),
  E_Phone             integer,
  E_Email             VARCHAR(50),
  E_DOB               date,
  E_Gender            varchar(55),
  E_JobTitle	        varchar(55),
  E_JobType           char(1),
  PRIMARY KEY (E_ID)
);


-- Create MEDICAL_EMPLOYEE

CREATE TABLE MEDICAL_EMPLOYEE
(
  ME_ID    integer      NOT NULL,
  PRIMARY KEY (ME_ID)  
);


-- Create NON_MEDICAL_EMPLOYEE

CREATE TABLE NON_MEDICAL_EMPLOYEE
(
  NME_ID   integer    NOT NULL,
  PRIMARY KEY (NME_ID)
);




-- Create VISITING_REASON    # COMPOSITE

CREATE TABLE VISITING_REASON
(
  Complaint_ID     integer          NOT NULL,
  A_ID            integer           NOT NULL
);




-- Create ALMA_MATER     

CREATE TABLE ALMA_MATER
(
  School       varchar(55)   NOT NULL,
  ME_ID        integer
);


-- Create SPECIALITY

CREATE TABLE SPECIALITY
(
  Speciality      varchar(55)     NOT NULL,
  ME_ID            integer
);


-- Create JOB_HISTORY

CREATE TABLE JOB_HISTORY
(
  J_JobTitle       varchar(55)      NOT NULL,
  J_StartDate      date          NOT NULL,
  J_EndDate        date          NOT NULL,
  E_ID             integer
);



-- Create CREDENTIAL

CREATE TABLE CREDENTIAL
(
  Credential       varchar(55)       NOT NULL,
  E_ID            integer
);


-- Create COMPLAINT

CREATE TABLE COMPLAINT
(
  Complaint_ID       integer   NOT NULL,
  Start_Date         date,
  End_Date           date,    
  PRIMARY KEY (Complaint_ID)
);


-- Create INVENTORY_USED

CREATE TABLE INVENTORY_USED
(
  Inv_ID        integer   NOT NULL,    
  Complaint_ID          integer
);



-- Add Composite Primary Key Constraint for OrderItem_T

ALTER TABLE SKILL ADD PRIMARY KEY (Skill,E_ID);
ALTER TABLE VISITING_REASON ADD PRIMARY KEY (Complaint_ID,A_ID);
ALTER TABLE INSURANCENUM ADD PRIMARY KEY (I_PolicyNumber,P_ID);
ALTER TABLE INVENTORY_USED ADD PRIMARY KEY (Inv_ID,Complaint_ID);
ALTER TABLE ALMA_MATER ADD PRIMARY KEY (School, ME_ID);
ALTER TABLE SPECIALITY ADD PRIMARY KEY (Speciality, ME_ID);
ALTER TABLE JOB_HISTORY ADD PRIMARY KEY (J_JobTitle, J_StartDate, J_EndDate,E_ID);
ALTER TABLE CREDENTIAL ADD PRIMARY KEY (Credential, E_ID);

--Add Foreign Key Constraints

ALTER TABLE APPOINTMENT ADD CONSTRAINT FK1_Appointment FOREIGN KEY (P_ID) REFERENCES PATIENT(P_ID);
ALTER TABLE APPOINTMENT ADD CONSTRAINT FK2_Appointment FOREIGN KEY (ME_ID) REFERENCES MEDICAL_EMPLOYEE(ME_ID);
ALTER TABLE CLAIM ADD CONSTRAINT FK1_CLAIM FOREIGN KEY (I_PolicyNumber) REFERENCES INSURANCE(I_PolicyNumber);
ALTER TABLE CLAIM ADD CONSTRAINT FK2_CLAIM FOREIGN KEY (Complaint_ID) REFERENCES COMPLAINT(Complaint_ID);
ALTER TABLE INSURANCENUM ADD CONSTRAINT FK1_INSURANCENUM FOREIGN KEY (I_PolicyNumber) REFERENCES INSURANCE(I_PolicyNumber);
ALTER TABLE INSURANCENUM ADD CONSTRAINT FK2_INSURANCENUM FOREIGN KEY (P_ID) REFERENCES PATIENT(P_ID);
ALTER TABLE INVENTORY ADD CONSTRAINT FK_INVENTORY FOREIGN KEY (V_ID) REFERENCES VENDOR(V_ID);
ALTER TABLE CONSUMABLE ADD CONSTRAINT FK_CONSUMABLE FOREIGN KEY (C_ID) REFERENCES INVENTORY(Inv_ID);
ALTER TABLE MEDICATION ADD CONSTRAINT FK_MEDICATION FOREIGN KEY (M_ID) REFERENCES INVENTORY(Inv_ID);
ALTER TABLE SKILL ADD CONSTRAINT FK_SKILL FOREIGN KEY (E_ID) REFERENCES EMPLOYEE(E_ID);
ALTER TABLE MEDICAL_EMPLOYEE ADD CONSTRAINT FK_MEDICALEMP FOREIGN KEY (ME_ID) REFERENCES EMPLOYEE(E_ID);
ALTER TABLE NON_MEDICAL_EMPLOYEE ADD CONSTRAINT FK_NONMEDICALEMP FOREIGN KEY (NME_ID) REFERENCES EMPLOYEE(E_ID);
ALTER TABLE VISITING_REASON ADD CONSTRAINT FK1_VistingReason FOREIGN KEY (Complaint_ID) REFERENCES COMPLAINT(Complaint_ID);
ALTER TABLE VISITING_REASON ADD CONSTRAINT FK2_VistingReason FOREIGN KEY (A_ID) REFERENCES APPOINTMENT(A_ID);
ALTER TABLE ALMA_MATER ADD CONSTRAINT FK_MEALMA_MATER FOREIGN KEY (ME_ID) REFERENCES MEDICAL_EMPLOYEE(ME_ID);
ALTER TABLE SPECIALITY ADD CONSTRAINT FK_MESPECIALITY FOREIGN KEY (ME_ID) REFERENCES MEDICAL_EMPLOYEE(ME_ID);
ALTER TABLE JOB_HISTORY ADD CONSTRAINT FK_EMPLOYEEJOB_H FOREIGN KEY (E_ID) REFERENCES EMPLOYEE(E_ID);
ALTER TABLE CREDENTIAL ADD CONSTRAINT FK_EMPLOYEECREDENTIAL FOREIGN KEY (E_ID) REFERENCES EMPLOYEE(E_ID);
ALTER TABLE CLAIM ADD CONSTRAINT FK_InsuranceClaim FOREIGN KEY (I_PolicyNumber) REFERENCES INSURANCE(I_PolicyNumber);
ALTER TABLE INVENTORY_USED ADD CONSTRAINT FK1_INVENTORY_USED FOREIGN KEY (Inv_ID) REFERENCES INVENTORY(Inv_ID);
ALTER TABLE INVENTORY_USED ADD CONSTRAINT FK2_INVENTORY_USED FOREIGN KEY (Complaint_ID) REFERENCES COMPLAINT(Complaint_ID);
ALTER TABLE SKILL ADD CONSTRAINT FK_EMPLOYEESKILL FOREIGN KEY (E_ID) REFERENCES EMPLOYEE(E_ID);