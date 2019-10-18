--Switch context to 'master' database
Use master
GO

-- If our DB already exists, drop it. (Only for exercises to refresh database to default state)
DROP DATABASE IF EXISTS AnimalHospitalDB

--Create the ArtGallery
CREATE DATABASE AnimalHospitalDB
GO

--Use the new database
USE AnimalHospitalDB
GO

CREATE TABLE Pet (
	PetID		int NOT NULL IDENTITY primary key,
	PetName		nvarchar(30) NOT NULL,
	Type		nvarchar(30) NOT NULL DEFAULT ('Unknown'),
	Age			nvarchar(15) NOT NULL DEFAULT ('Unknown'),
	OwnerId		int NOT NULL,
);

CREATE TABLE Owner (
	OwnerId	int identity(100, 1) primary key, -- (100, 10) is optional. Starts identity at 100 and increments by 10. If single column ID, you can do it this simplified way rather than the above way
	LastName	nvarchar(50) NOT NULL,
	FirstName	nvarchar(50) NOT NULL,
	Address		nvarchar(100) DEFAULT ('Unknown')
)

ALTER TABLE Pet ADD CONSTRAINT fk_Pet_Owner 
FOREIGN KEY (OwnerId) REFERENCES Owner(OwnerId)

CREATE TABLE PetProcedure (
	ProcedureId	int identity primary key,
	ProName		nvarchar(50) NOT NULL,
	VisitDate	datetime,
	PetId		int NOT NULL,
	Cost		money NOT NULL,
	constraint FK_PetProcedure_Pet FOREIGN KEY (PetId) REFERENCES Pet(PetID),
	
)

CREATE TABLE Invoice (
	InvoiceId	int identity primary key,
	OwnerId	int NOT NULL,
	constraint FK_Invoice_Owner FOREIGN KEY (OwnerId) REFERENCES Owner(OwnerId),
)