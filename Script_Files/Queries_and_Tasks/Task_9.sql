USE DoctorWho;
GO

DROP PROCEDURE IF EXISTS spSummariseEpisodes;
GO

CREATE PROCEDURE spSummariseEpisodes AS
BEGIN
	SELECT C.CompanionName AS [Three Most Frequently-Appearing Companions]
	FROM tblEpisodeCompanion EC
		 JOIN tblCompanion C ON EC.CompanionId = C.CompanionId
	GROUP BY EC.CompanionId, C.CompanionName
	ORDER BY COUNT(EC.CompanionId) DESC
	OFFSET 0 ROWS
	FETCH NEXT 3 ROWS ONLY;

	SELECT E.EnemyName AS [Three Most Frequently-Appearing Enemies]
	FROM tblEpisodeEnemy EE
		 JOIN tblEnemy E ON EE.EnemyId = E.EnemyId
	GROUP BY EE.EnemyId, E.EnemyName
	ORDER BY COUNT(EE.EnemyId) DESC
	OFFSET 0 ROWS
	FETCH NEXT 3 ROWS ONLY;
END;

EXEC spSummariseEpisodes;