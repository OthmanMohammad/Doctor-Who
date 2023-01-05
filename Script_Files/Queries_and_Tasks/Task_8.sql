USE DoctorWho;
GO

DROP VIEW IF EXISTS viewEpisodes;
GO

CREATE VIEW viewEpisodes AS
SELECT E.SeriesNumber AS [Series Number], 
	   E.EpisodeNumber AS [Episode Number], 
	   E.Title AS Title, 
	   A.AuthorName AS [Author Name], 
	   D.DoctorName AS [Doctor Name],
	   dbo.fnCompanions(E.EpisodeId) AS Companions,
	   dbo.fnEnemies(E.EpisodeId) AS Enemies

FROM tblEpisode E
	 LEFT JOIN tblAuthor A ON E.AuthorId = A.AuthorId
	 LEFT JOIN tblDoctor D ON E.DoctorId = D.DoctorId 
GO