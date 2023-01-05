USE DoctorWho;
GO

DROP FUNCTION IF EXISTS fnRetrieveListOfEnemyIds;
DROP FUNCTION IF EXISTS fnRetrieveListOfEnemyNames;
DROP FUNCTION IF EXISTS fnRetrieveEnemies;
DROP FUNCTION IF EXISTS fnEnemies;
GO

--Helper function retrieves a Table of the Ids of all the enemies that appeared in the provided episode.
CREATE FUNCTION fnRetrieveListOfEnemyIds (@EpisodeId INT)
RETURNS TABLE AS
RETURN
	SELECT DISTINCT EnemyId
	FROM tblEpisodeEnemy EE
	WHERE @EpisodeId = EE.EpisodeId
GO

--Helper function retrieves a Table of the Names of all the enemies that appeared in the provided episode.
CREATE FUNCTION fnRetrieveListOfEnemyNames (@EpisodeId INT)
RETURNS TABLE AS
RETURN
	SELECT DISTINCT EnemyName
	FROM tblEnemy tbl JOIN fnRetrieveListOfEnemyIds(@EpisodeId) fn 
	ON tbl.EnemyId = fn.EnemyId
GO

--Helper function returns the names of the enemies that appeared in the provided episode separated by commas.
CREATE FUNCTION fnRetrieveEnemies (@EpisodeId INT)
RETURNS VARCHAR(MAX) AS
BEGIN
	DECLARE @List_Of_Enemies AS VARCHAR(MAX)
	DECLARE @name AS VARCHAR(MAX)
	DECLARE enemy_cursor CURSOR FOR 
									SELECT * FROM fnRetrieveListOfEnemyNames(@EpisodeId)

	OPEN enemy_cursor
	FETCH NEXT FROM enemy_cursor
	INTO @name

	WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @List_Of_Enemies = CONCAT(@List_Of_Enemies, ', ', @name)

			FETCH NEXT FROM enemy_cursor
			INTO @name
		END

	CLOSE enemy_cursor
	DEALLOCATE enemy_cursor
	RETURN TRIM(', ' FROM @List_Of_Enemies)
END;
GO

--Function displays the enemy names for a given episode, if any. Displays an error message if there are none.
CREATE FUNCTION fnEnemies (@EpisodeId INT)
RETURNS VARCHAR(MAX) AS
BEGIN
	DECLARE @Max_Episode_Id AS INT
	SET @Max_Episode_Id = (SELECT MAX(EpisodeId) FROM tblEpisode)
	DECLARE @result AS VARCHAR(MAX)

	IF @EpisodeId <= 0 OR @EpisodeId > @Max_Episode_Id
		BEGIN
			SET @result = 'Invalid Episode Id! No Episodes exist for the Episode Id you have entered...'
		END

	ELSE
		BEGIN
			SET @result = dbo.fnRetrieveEnemies(@EpisodeId)
		END

	RETURN (CASE WHEN LEN(@result) > 0 THEN @result
	ELSE 'No enemies appear on this episode' END);
END;
GO