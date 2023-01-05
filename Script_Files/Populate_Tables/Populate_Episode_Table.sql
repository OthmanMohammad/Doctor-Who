USE DoctorWho;
GO

CREATE TABLE tempEpisode (
							SeriesNumber INT NULL DEFAULT 0,
							EpisodeNumber INT NULL DEFAULT 0,
							EpisodeType VARCHAR(250) NOT NULL,
							Title Text NOT NULL,
							EpisodeDate Date NULL DEFAULT NULL,
							AuthorId INT NOT NULL,
							DoctorId VARCHAR(250) NOT NULL,
							Notes Text NULL DEFAULT NULL
						 );

BULK INSERT tempEpisode
FROM 'C:\Users\ASUS\Desktop\DoctorWho\Data_Files\Episode_List.csv'
WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		FORMAT = 'CSV'
	 );

INSERT INTO tblEpisode (SeriesNumber, EpisodeNumber, EpisodeType, Title, EpisodeDate, AuthorId, DoctorId, Notes)
SELECT SeriesNumber, EpisodeNumber, EpisodeType, Title, EpisodeDate, AuthorId, DoctorId, Notes
FROM tempEpisode;

DROP TABLE tempEpisode;