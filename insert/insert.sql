
USE [BestDiagnostics]
GO

INSERT INTO HMO (hmo_name, contact_person, contact_phonenumber, email, address)
VALUES 
	('Hygeia HMO', 'Chinedu Okafor', '08031234567', 'chinedu@hygeiahmo.com', '23 Awolowo Road, Ikoyi, Lagos'),
	('Reliance HMO', 'Ngozi Nwankwo', '08127654321', 'ngozi@reliancehmo.com', '12 Adeniran Ogunsanya, Surulere, Lagos'),
	('AXA Mansard', 'Emeka Obi', '07051239876', 'emeka@axamansard.com', '8 Marina, Victoria Island, Lagos'),
	('Wellness HMO', 'Tope Fasina', '09123456781', 'fasinatope@wellnesshmo.com', '9 Jogunomi St, Gbagada, Lagos');
GO

INSERT INTO Department (department_name)
VALUES
	('Chemical Pathology'),
	('Microbiology'),
	('Haematology'),
	('Histopatholgy'),
	('Blood Banking'),
	('Molecular Diagnostics'),
	('Immunology');

GO
BULK INSERT LabScientists
	FROM 'C:\data\Clean_LabScientists.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR =',',
		ROWTERMINATOR ='\n',
		TABLOCK
		);

BULK INSERT Doctor
	FROM 'C:\data\DOCTORSS.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR= ',',
		ROWTERMINATOR ='\n',
		TABLOCK
		);
GO

BULK INSERT Test
	FROM 'C:\data\tests.csv'
	WITH (
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		FIRSTROW = 2,
		TABLOCK 
);
GO		

BULK INSERT Patients
	FROM 'C:\data\px_data.csv'
	WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\r\n',
    KEEPNULLS,
    TABLOCK
);
GO

BULK INSERT TestRequest
	FROM 'C:\data\test_requestsa.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		KEEPNULLS,
		TABLOCK
);
GO

BULK INSERT Payment
	FROM 'C:\data\payments.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		KEEPNULLS,
		TABLOCK
);
GO

BULK INSERT TestResult
FROM 'C:\data\11.csv'
	WITH (
	FIRSTROW= 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR ='\n',
	KEEPNULLS,
	TABLOCK
	);
