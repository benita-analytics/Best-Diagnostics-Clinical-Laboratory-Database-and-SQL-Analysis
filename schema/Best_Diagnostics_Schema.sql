CREATE DATABASE BestDiagnostics;
GO
USE [BestDiagnostics]

CREATE TABLE [dbo].[HMO](
	hmoID INT IDENTITY (1,1) PRIMARY KEY CLUSTERED,
	hmo_name NVARCHAR(100) NOT NULL,
	contact_person NVARCHAR(100) NULL,
    contact_phonenumber NVARCHAR(15) NULL,
    email NVARCHAR(100)NOT NULL,
    address NVARCHAR(255) NOT NULL,
    registered_date DATETIME DEFAULT(GETDATE()),

    CONSTRAINT CK_HMO_name CHECK (LEN(LTRIM(RTRIM(hmo_name))) > 0),
	CONSTRAINT CK_HMO_name CHECK (contact_phonenumber IS NULL OR (LEN(LTRIM(RTRIM(phonenumber)))>=11)),
);
GO
CREATE UNIQUE NONCLUSTERED INDEX NCI_HMO_name ON HMO(hmo_name)
CREATE UNIQUE NONCLUSTERED INDEX NCI_email ON HMO(email)

GO

CREATE TABLE [dbo].[Patients](
	patientID INT IDENTITY (1,1) PRIMARY KEY CLUSTERED,
	first_name NVARCHAR (50) NOT NULL,
	last_name NVARCHAR (50) NOT NULL,
	DOB DATE NOT NULL,
	gender NVARCHAR (10) NOT NULL,
	phonenumber NVARCHAR (15) NOT NULL,
	houseaddress NVARCHAR (200) NULL,
	hmoID INT REFERENCES HMO(hmoID) NULL,
	

	CONSTRAINT CK_Patient_DOB CHECK (DOB <=GETDATE()),
	CONSTRAINT CK_Patient_phoneno CHECK (LEN(LTRIM(RTRIM(phonenumber)))>=5)
);
GO
CREATE NONCLUSTERED INDEX NCI_Patient_gender ON Patients(gender)
GO

CREATE TABLE [dbo].[Doctor](
	doctorID INT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
	doctorname NVARCHAR (150) NOT NULL,
	specialization NVARCHAR (100) NULL,
	phonenumber NVARCHAR (15) NOT NULL,

	CONSTRAINT UQ_Doctor_phoneno UNIQUE (phonenumber),
	CONSTRAINT CK_Doctor_fullname CHECK (LEN(LTRIM(RTRIM(doctorname)))>0)
);
GO
CREATE NONCLUSTERED INDEX NCI_Doctor_specialization ON Doctor(specialization)
GO

CREATE TABLE [dbo].[Department](
	departmentID INT IDENTITY (100,100) PRIMARY KEY CLUSTERED,
	department_name NVARCHAR (50) NOT NULL,

	CONSTRAINT CK_department_departmentname CHECK (LEN(LTRIM(RTRIM(department_name)))>0),
	CONSTRAINT CK_department_department_name CHECK (department_name IN ('Chemical Pathology', 'Microbiology', 'Haematology','Histopatholgy','Blood Banking','Molecular Diagnostics','Immunology')),
);
GO

CREATE UNIQUE NONCLUSTERED INDEX NCI_department_department_name ON Department(department_name)
GO

CREATE TABLE[dbo].[LabScientists](
	scientistID INT IDENTITY(100,1) PRIMARY KEY CLUSTERED,
	scientist_name NVARCHAR (150) NOT NULL,
	department NVARCHAR (50) REFERENCES Department(department_name),

	CONSTRAINT CK_Scientists_scientist_name CHECK (LEN(LTRIM(RTRIM(scientist_name)))>0)
)
GO
CREATE NONCLUSTERED INDEX NCI_Scientist_name ON LabScientists(scientist_name)
CREATE NONCLUSTERED INDEX NCI_Scientist_dept ON LabScientists(department)
GO

CREATE TABLE [dbo].[Test](
	testID INT IDENTITY (1,1) PRIMARY KEY CLUSTERED,
	test_name NVARCHAR (100) NOT NULL,
	price DECIMAL (10,2) NOT NULL,
	departmentID INT REFERENCES Department(departmentID)
)
GO
CREATE UNIQUE NONCLUSTERED INDEX NCI_Test_testname ON Test(test_name)
GO

CREATE TABLE [dbo].[TestRequest](
	requestID INT IDENTITY (1,1)PRIMARY KEY CLUSTERED,
	patientID INT REFERENCES Patients(patientID) NOT NULL,
	testID INT REFERENCES Test(testID)NOT NULL,
	test_name NVARCHAR (100) REFERENCES Test (test_name) NOT NULL,
	request_date DATETIME DEFAULT (GETDATE()),
	doctorID INT REFERENCES Doctor(doctorID) NULL,
	
	CONSTRAINT CK_Request_testname CHECK (LEN(LTRIM(RTRIM(test_name)))>0),
	CONSTRAINT CK_request_requestdate CHECK (request_date <=GETDATE()),
);
GO
CREATE UNIQUE NONCLUSTERED INDEX NCI_Request_testID ON TestRequest(requestID)
CREATE NONCLUSTERED INDEX NCI_Request_patientID ON TestRequest(patientID);
CREATE NONCLUSTERED INDEX NCI_Request_doctorID ON TestRequest(doctorID);
GO

CREATE TABLE [dbo].[Test_Result](
	resultID INT IDENTITY (1,1) PRIMARY KEY CLUSTERED,
	requestID INT REFERENCES TestRequest(requestID) ON DELETE CASCADE NOT NULL,
	testName NVARCHAR(100) REFERENCES Test (test_name) NOT NULL ,
	result_value NVARCHAR (MAX) NOT NULL,
	result_date DATETIME DEFAULT (GETDATE()),
	scientistID INT REFERENCES LabScientists (scientistID) ON DELETE NO ACTION NOT NULL,
	scientist_comment NVARCHAR (MAX) NULL,
	departmentID INT REFERENCES Department(departmentID)

	CONSTRAINT CK_Result_value CHECK (LEN(LTRIM(RTRIM(result_value)))>0),
	CONSTRAINT CK_Result_date CHECK (result_date<= GETDATE()),
	CONSTRAINT CK_Result_scientistcomment CHECK (scientist_comment IS NULL OR LEN(LTRIM(RTRIM(result_value)))>0)
);
GO
CREATE UNIQUE NONCLUSTERED INDEX NCI_Result_requestID ON Test_Result(requestID)
CREATE NONCLUSTERED INDEX NCI_Result_date ON Test_Result(result_date)
GO

CREATE TABLE [dbo].[Payment](
	paymentID INT IDENTITY (1,1) PRIMARY KEY CLUSTERED,
	requestID INT REFERENCES TestRequest (requestID) NOT NULL,
	amount_paid DECIMAL (10,2) NOT NULL,
	payment_type NVARCHAR(50),
	transactionID NVARCHAR (150) NULL,
	hmo_id INT REFERENCES HMO(hmo_id),
	transaction_description NVARCHAR (300) NOT NULL,
	payment_date DATETIME DEFAULT (GETDATE()),
	hmo_id INT REFERENCES HMO(hmo_id)

	CONSTRAINT UQ_Paymemt_transactionID UNIQUE (transactionID),
	CONSTRAINT CK_Payment_paymentdate CHECK (payment_date <= GETDATE()),
	CONSTRAINT CK_Payment_paymenttype CHECK (payment_type IN(
															'Cash',
															 'Bank Transfer',
															 'POS',
															 'Online',
															 'MobileWallet',
															 'HMO',
															 'Corporate',
															 'Paystack'
															  ))
); 
GO
CREATE UNIQUE NONCLUSTERED INDEX NCI_Payment_requestID ON Payment(requestID)
CREATE NONCLUSTERED INDEX NCI_Payment_type ON Payment(payment_type)
CREATE  NONCLUSTERED INDEX NCI_Payment_date_paid ON Payment(payment_date)

GO
