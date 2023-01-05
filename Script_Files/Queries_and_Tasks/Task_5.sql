USE DoctorWho;
GO

DELETE FROM tblCompanion
WHERE CompanionId IN (
						SELECT CompanionId
						FROM tblCompanion
						EXCEPT
						SELECT CompanionId
						FROM tblEpisodeCompanion
						GROUP BY CompanionId
					 );