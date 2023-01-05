USE DoctorWho;
GO

CREATE TABLE tempEpisodeEnemy (
								 EpisodeId INT NOT NULL,
								 EnemyId INT NOT NULL
						       );

BULK INSERT tempEpisodeEnemy
FROM 'C:\Users\ASUS\Desktop\DoctorWho\Data_Files\Episode_Enemy_List.csv'
WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		FORMAT = 'CSV'
	 );

INSERT INTO tblEpisodeEnemy(EpisodeId, EnemyId)
SELECT EpisodeId, EnemyId
FROM tempEpisodeEnemy;

DROP TABLE tempEpisodeEnemy;