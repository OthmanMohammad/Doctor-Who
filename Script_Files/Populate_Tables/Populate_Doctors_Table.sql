USE DoctorWho;
GO

INSERT INTO tblDoctor (DoctorId,
                       DoctorNumber,
					   DoctorName,
					   BirthDate,
					   FirstEpisodeDate,
					   LastEpisodeDate)

VALUES ('First Doctor', 1, 'William Hartnell', CAST('1908-01-08' AS Date), CAST('1963-10-29' AS DATE), CAST('1966-10-29' AS DATE)),
	   ('Second Doctor', 2, 'Patrick Troughton', CAST('1920-03-25' AS Date), CAST('1966-11-05' AS DATE), CAST('1969-06-21' AS DATE)),
       ('Third Doctor', 3, 'Jon Pertwee', CAST('1919-07-07' AS Date), CAST('1970-01-02' AS DATE), CAST('1974-06-08' AS DATE)),
	   ('Fourth Doctor', 4, 'Tom Baker', CAST('1934-01-20' AS Date), CAST('1974-12-28' AS DATE), CAST('1981-03-21' AS DATE)),
	   ('Fifth Doctor', 5, 'Peter Davison', CAST('1951-04-13' AS Date), CAST('1982-01-04' AS DATE), CAST('1984-03-16' AS DATE)),
	   ('Sixth Doctor', 6, 'Colin Baker', CAST('1943-06-08' AS Date), CAST('1984-03-22' AS DATE), CAST('1986-12-06' AS DATE)),
	   ('Seventh Doctor', 7, 'Sylvester McCoy', CAST('1943-08-20' AS Date), CAST('1987-09-07' AS DATE), CAST('1989-12-06' AS DATE)),
	   ('Eighth Doctor', 8, 'Paul McGann', CAST('1959-11-14' AS Date), CAST('1996-05-27' AS DATE), CAST('1996-05-27' AS DATE)),
	   ('Ninth Doctor', 9, 'Christopher Eccleston', CAST('1964-02-16' AS Date), CAST('2005-03-26' AS DATE), CAST('2005-06-18' AS DATE)),
	   ('Tenth Doctor', 10, 'David Tennant', CAST('1971-04-18' AS Date), CAST('2005-12-25' AS DATE), CAST('2010-01-01' AS DATE)),
	   ('Eleventh Doctor', 11, 'Matt Smith', CAST('1982-10-28' AS Date), CAST('2010-04-03' AS DATE), CAST('2013-12-25' AS DATE)),
	   ('Twelfth Doctor', 12, 'Peter Capaldi', CAST('1958-04-14' AS Date), CAST('2014-08-23' AS DATE), CAST('2017-12-25' AS DATE)),
	   ('Thirteenth Doctor', 13, 'Jodie Whittaker', CAST('1982-06-17' AS Date), CAST('2018-10-07' AS DATE), DEFAULT);


