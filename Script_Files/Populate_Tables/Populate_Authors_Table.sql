USE DoctorWho;
GO

CREATE TABLE tempAuthor (
						 AuthorName VARCHAR(350) NOT NULL
						);

BULK INSERT tempAuthor
FROM 'C:\Users\ASUS\Desktop\DoctorWho\Data_Files\Authors_List.csv'
WITH (FIRSTROW = 1,
	  ROWTERMINATOR = '0x0a'
	  );

INSERT INTO tblAuthor (AuthorName)
SELECT AuthorName
FROM tempAuthor;

DROP TABLE tempAuthor;