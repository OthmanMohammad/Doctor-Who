USE DoctorWho;
GO

UPDATE tblEpisode
SET Title = CONCAT(Title, '_CANCELLED')
WHERE DoctorId IS NULL;

/*
	This is an addition I decided to add to the fourth requirement.
	This query changes the titles of Episodes with no EpisodeDate (those who have no record of being aired) to 
	{ORIGINAL_EPISODE_NAME}_UNAIRED.
	The reason I decided to add this is just to make sure that the logic of the previous query was indeed working as intended
	since there are no episodes in my list with no doctor appearances whereas my data tables indicate that there are some episodes
	that never aired and therefore this addition was made!
*/
UPDATE tblEpisode
SET Title = CONCAT(Title, '_UNAIRED')
WHERE EpisodeDate IS NULL;