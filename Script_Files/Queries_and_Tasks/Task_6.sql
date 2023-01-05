USE DoctorWho;
GO

DROP FUNCTION IF EXISTS fnRetrieveListOfCompanionIds;
DROP FUNCTION IF EXISTS fnRetrieveListOfCompanionNames;
DROP FUNCTION IF EXISTS fnRetrieveCompanions;
DROP FUNCTION IF EXISTS fnCompanions;
GO

--Helper function retrieves a Table of the Ids of all the companions that appeared in the provided episode.
CREATE FUNCTION fnRetrieveListOfCompanionIds (@EpisodeId INT)
RETURNS TABLE AS
RETURN
	SELECT DISTINCT CompanionId
	FROM tblEpisodeCompanion EC
	WHERE @EpisodeId = EC.EpisodeId
GO

--Helper function retrieves a Table of the Names of all the companions that appeared in the provided episode.
CREATE FUNCTION fnRetrieveListOfCompanionNames (@EpisodeId INT)
RETURNS TABLE AS
RETURN
	SELECT DISTINCT CompanionName
	FROM tblCompanion tbl JOIN fnRetrieveListOfCompanionIds(@EpisodeId) fn 
	ON tbl.CompanionId = fn.CompanionId
GO

--Helper function returns the names of the companions that appeared in the provided episode separated by commas.
CREATE FUNCTION fnRetrieveCompanions (@EpisodeId INT)
RETURNS VARCHAR(MAX) AS
BEGIN
	DECLARE @List_Of_Companions AS VARCHAR(MAX)
	DECLARE @name AS VARCHAR(MAX)
	DECLARE companion_cursor CURSOR FOR 
									SELECT * FROM fnRetrieveListOfCompanionNames(@EpisodeId)

	OPEN companion_cursor
	FETCH NEXT FROM companion_cursor
	INTO @name

	WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @List_Of_Companions = CONCAT(@List_Of_Companions, ', ', @name)

			FETCH NEXT FROM companion_cursor
			INTO @name
		END

	CLOSE companion_cursor
	DEALLOCATE companion_cursor
	RETURN TRIM(', ' FROM @List_Of_Companions)
END;
GO

--Function displays the companion names for a given episode, if any. Displays an error message if there are none.
CREATE FUNCTION fnCompanions (@EpisodeId INT)
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
			SET @result = dbo.fnRetrieveCompanions(@EpisodeId)
		END

	RETURN (CASE WHEN LEN(@result) > 0 THEN @result
	ELSE 'No companions appear on this episode' END);
END;
GO