/* Movie Library Project (RBD Project)
  Created by : Deniz Erdem Özkan (s31409) */

-- tables
-- Table: Award
CREATE TABLE Award (
    Award_ID integer  NOT NULL,
    Award_Name varchar2(100)  NOT NULL,
    CONSTRAINT Award_pk PRIMARY KEY (Award_ID)
) ;

-- Table: Award of Movie
CREATE TABLE AwardofMovie (
    AwardMatch_ID integer  NOT NULL,
    Movie_Movie_ID integer  NOT NULL,
    Award_Award_ID integer  NULL,
    CONSTRAINT AwardofMovie_pk PRIMARY KEY (AwardMatch_ID)
) ;

-- Table: Gender
CREATE TABLE Gender (
    Gender_ID integer  NOT NULL,
    Gender_Name nvarchar2(100)  NOT NULL,
    CONSTRAINT Gender_pk PRIMARY KEY (Gender_ID)
) ;

-- Table: Genre
CREATE TABLE Genre (
    Genre_ID integer  NOT NULL,
    Genre_Name varchar2(100)  NOT NULL,
    CONSTRAINT Genre_pk PRIMARY KEY (Genre_ID)
) ;

-- Table: GenreOfMovie
CREATE TABLE GenreOfMovie (
    Movie_Movie_ID integer  NULL,
    Genre_Genre_ID integer  NULL,
    Movie_ID int not null,
    Genre_ID int not null,
    CONSTRAINT GenreOfMovie_pk PRIMARY KEY (Movie_Movie_ID,Genre_Genre_ID)
) ;

-- Table: Language
CREATE TABLE Language (
    Language_ID integer  NOT NULL,
    Language_Name varchar2(100)  NOT NULL,
    CONSTRAINT Language_pk PRIMARY KEY (Language_ID)
) ;

-- Table: LanguageofMovies
CREATE TABLE LanguageofMovies (
    Dubbed varchar2(100)  NOT NULL,
    Subtitles varchar2(100)  NOT NULL,
    Movie_Movie_ID integer  NOT NULL,
    Language_Language_ID integer  NOT NULL,
    LanguageMatch_ID integer  NOT NULL,
    CONSTRAINT LanguageofMovies_pk PRIMARY KEY (LanguageMatch_ID)
) ;

-- Table: Location
CREATE TABLE Location (
    Country_ID integer  NOT NULL,
    CountryName varchar2(100)  NOT NULL,
    CONSTRAINT Location_pk PRIMARY KEY (Country_ID)
) ;

-- Table: LocationofMovie
CREATE TABLE LocationofMovie (
    MovieLocation_ID integer  NOT NULL,
    LocationMatch_ID integer  NOT NULL,
    Location_Country_ID integer  NOT NULL,
    CONSTRAINT LocationofMovie_pk PRIMARY KEY (MovieLocation_ID)
) ;

-- Table: Movie
CREATE TABLE Movie (
    Movie_ID integer  NOT NULL,
    Movie_Name varchar2(100)  NOT NULL,
    Country_of_Origin varchar2(100)  NOT NULL,
    Release_Date date  NOT NULL,
    IMDb_Score float(10)  NOT NULL,
    CONSTRAINT Movie_pk PRIMARY KEY (Movie_ID)
) ;

-- Table: Movie_Streaming
CREATE TABLE Movie_Streaming (
    Stream_ID integer  NOT NULL,
    Movie_Movie_ID integer  NOT NULL,
    Services_ID integer  NOT NULL,
    CONSTRAINT Movie_Streaming_pk PRIMARY KEY (Stream_ID)
) ;

-- Table: Person
CREATE TABLE Person (
    ID integer  NOT NULL,
    Name varchar2(100)  NOT NULL,
    Surname varchar2(100)  NOT NULL,
    Birth_Date date  NOT NULL,
    Gender_Gender_ID integer  NOT NULL,
    Birth_Location_ID int not null,
    CONSTRAINT Person_pk PRIMARY KEY (ID)
) ;

-- Table: PersonNationality
CREATE TABLE PersonNationality (
    Nationality_ID integer  NOT NULL,
    Person_ID integer  NOT NULL,
    Location_Country_ID integer  NOT NULL,
    CONSTRAINT PersonNationality_pk PRIMARY KEY (Nationality_ID)
) ;

-- Table: Role
CREATE TABLE Role (
    Role_ID integer  NOT NULL,
    Role_Name varchar2(100)  NOT NULL,
    Person_ID integer  NOT NULL,
    Movie_Movie_ID integer  NOT NULL,
    CONSTRAINT Role_pk PRIMARY KEY (Role_ID)
) ;

-- Table: StreamingServices
CREATE TABLE StreamingServices (
    Service_ID integer  NOT NULL,
    ServiceName varchar2(100)  NOT NULL,
    CONSTRAINT StreamingServices_pk PRIMARY KEY (Service_ID)
) ;

-- foreign keys
-- Reference: AwardofMovie_Award (table: AwardofMovie)
ALTER TABLE AwardofMovie ADD CONSTRAINT AwardofMovie_Award
    FOREIGN KEY (Award_Award_ID)
    REFERENCES Award (Award_ID);

-- Reference: AwardofMovie_Movie (table: AwardofMovie)
ALTER TABLE AwardofMovie ADD CONSTRAINT AwardofMovie_Movie
    FOREIGN KEY (Movie_Movie_ID)
    REFERENCES Movie (Movie_ID);

-- Reference: LanguageofMovies_Language (table: LanguageofMovies)
ALTER TABLE LanguageofMovies ADD CONSTRAINT LanguageofMovies_Language
    FOREIGN KEY (Language_Language_ID)
    REFERENCES Language (Language_ID);

-- Reference: LanguageofMovies_Movie (table: LanguageofMovies)
ALTER TABLE LanguageofMovies ADD CONSTRAINT LanguageofMovies_Movie
    FOREIGN KEY (Movie_Movie_ID)
    REFERENCES Movie (Movie_ID);

-- Reference: LocationofMovie_Location (table: LocationofMovie)
ALTER TABLE LocationofMovie ADD CONSTRAINT LocationofMovie_Location
    FOREIGN KEY (Location_Country_ID)
    REFERENCES Location (Country_ID);

-- Reference: LocationofMovie_Movie (table: LocationofMovie)
ALTER TABLE LocationofMovie ADD CONSTRAINT LocationofMovie_Movie
    FOREIGN KEY (MovieLocation_ID)
    REFERENCES Movie (Movie_ID);

-- Reference: Movie_Streaming_Movie (table: Movie_Streaming)
ALTER TABLE Movie_Streaming ADD CONSTRAINT Movie_Streaming_Movie
    FOREIGN KEY (Movie_Movie_ID)
    REFERENCES Movie (Movie_ID);

-- Reference: PersonNationality_Location (table: PersonNationality)
ALTER TABLE PersonNationality ADD CONSTRAINT PersonNationality_Location
    FOREIGN KEY (Location_Country_ID)
    REFERENCES Location (Country_ID);

-- Reference: PersonNationality_Person (table: PersonNationality)
ALTER TABLE PersonNationality ADD CONSTRAINT PersonNationality_Person
    FOREIGN KEY (Person_ID)
    REFERENCES Person (ID);

-- Reference: Person_Gender (table: Person)
ALTER TABLE Person ADD CONSTRAINT Person_Gender
    FOREIGN KEY (Gender_Gender_ID)
    REFERENCES Gender (Gender_ID);

-- Reference: Role_Movie (table: Role)
ALTER TABLE Role ADD CONSTRAINT Role_Movie
    FOREIGN KEY (Movie_Movie_ID)
    REFERENCES Movie (Movie_ID);

-- Reference: Role_Person (table: Role)
ALTER TABLE Role ADD CONSTRAINT Role_Person
    FOREIGN KEY (Person_ID)
    REFERENCES Person (ID);

-- Reference: StreamingServices (table: Movie_Streaming)
ALTER TABLE Movie_Streaming ADD CONSTRAINT StreamingServices
    FOREIGN KEY (Services_ID)
    REFERENCES StreamingServices (Service_ID);

-- Reference: Table_23_Genre (table: GenreOfMovie)
ALTER TABLE GenreOfMovie ADD CONSTRAINT Table_23_Genre
    FOREIGN KEY (Genre_Genre_ID)
    REFERENCES Genre (Genre_ID);

-- Reference: Table_23_Movie (table: GenreOfMovie)
ALTER TABLE GenreOfMovie ADD CONSTRAINT Table_23_Movie
    FOREIGN KEY (Movie_Movie_ID)
    REFERENCES Movie (Movie_ID);

INSERT ALL
  INTO Movie (Movie_ID, Movie_Name, Country_of_Origin, Release_Date, IMDb_Score) VALUES (816692, 'Interstellar', 'United States', TO_DATE('2014-11-07', 'YYYY-MM-DD'), 8.7)
  INTO Movie (Movie_ID, Movie_Name, Country_of_Origin, Release_Date, IMDb_Score) VALUES (4154796, 'Avengers: Endgame', 'United States', TO_DATE('2019-04-26', 'YYYY-MM-DD'), 8.4)
  INTO Movie (Movie_ID, Movie_Name, Country_of_Origin, Release_Date, IMDb_Score) VALUES (15398776, 'Oppenheimer', 'United States', TO_DATE('2023-07-21', 'YYYY-MM-DD'), 8.3)
  INTO Movie (Movie_ID, Movie_Name, Country_of_Origin, Release_Date, IMDb_Score) VALUES (211915, 'Amelie', 'France', TO_DATE('2002-02-08', 'YYYY-MM-DD'), 8.3)
  INTO Movie (Movie_ID, Movie_Name, Country_of_Origin, Release_Date, IMDb_Score) VALUES (2382320, 'No Time To Die', 'United Kingdom', TO_DATE('2021-10-08', 'YYYY-MM-DD'), 7.3)
  INTO Movie (Movie_ID, Movie_Name, Country_of_Origin, Release_Date, IMDb_Score) VALUES (86250, 'Scarface', 'United States', TO_DATE('1983-12-09', 'YYYY-MM-DD'), 8.3)
  INTO Movie (Movie_ID, Movie_Name, Country_of_Origin, Release_Date, IMDb_Score) VALUES (2798920, 'Annihilation', 'United States', TO_DATE('2018-02-23', 'YYYY-MM-DD'), 6.8)
  INTO Movie (Movie_ID, Movie_Name, Country_of_Origin, Release_Date, IMDb_Score) VALUES (19770238, 'Aftersun', 'United Kingdom', TO_DATE('2022-11-18', 'YYYY-MM-DD'), 7.6)
  INTO Movie (Movie_ID, Movie_Name, Country_of_Origin, Release_Date, IMDb_Score) VALUES (7395114, 'The Devil All The Time', 'United States', TO_DATE('2020-04-10', 'YYYY-MM-DD'), 7.1)
  INTO Movie (Movie_ID, Movie_Name, Country_of_Origin, Release_Date, IMDb_Score) VALUES (6723592, 'Tenet', 'United States', TO_DATE('2020-04-03', 'YYYY-MM-DD'), 7.3)
  INTO Movie (Movie_ID, Movie_Name, Country_of_Origin, Release_Date, IMDb_Score) VALUES (5727208, 'Uncut Gems', 'United States', TO_DATE('2019-12-25', 'YYYY-MM-DD'), 7.4)
SELECT 1 FROM dual;

-- Inserting Gender Values
INSERT ALL
  INTO Gender(Gender_ID, Gender_Name) VALUES (1, 'Male')
  INTO Gender(Gender_ID, Gender_Name) VALUES (2, 'Female')
  INTO Gender(Gender_ID, Gender_Name) VALUES (3, 'Other')
SELECT 1 FROM dual;

-- Inserting Person Values
INSERT ALL
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (190, 'Matthew', 'McConaughey', TO_DATE('1969-11-04', 'YYYY-MM-DD'), 1, 2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (4266, 'Anne', 'Hathaway', TO_DATE('1982-11-12', 'YYYY-MM-DD'), 2, 2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (375, 'Robert', 'Downey Jr', TO_DATE('1965-04-04', 'YYYY-MM-DD'),1, 2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (851582, 'Audrey', 'Tautou', TO_DATE('1976-09-28', 'YYYY-MM-DD'), 2, 2004)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (614165, 'Cillian', 'Murphy', TO_DATE('1976-05-25', 'YYYY-MM-DD'), 1, 2001)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (185819, 'Daniel', 'Craig', TO_DATE('1968-03-02', 'YYYY-MM-DD'), 1, 2001)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (1785339, 'Rami', 'Malek', TO_DATE('1981-05-12', 'YYYY-MM-DD'), 1,2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (2244205, 'Lea', 'Seydoux', TO_DATE('1985-07-01', 'YYYY-MM-DD'), 2, 2004)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (199, 'Al', 'Pacino', TO_DATE('1940-04-25', 'YYYY-MM-DD'), 1,2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (201, 'Michelle', 'Pfeiffer', TO_DATE('1958-04-29', 'YYYY-MM-DD'),2, 2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (204, 'Natalie', 'Portman', TO_DATE('1981-06-09', 'YYYY-MM-DD'),2, 2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (1209966, 'Oscar', 'Isaac', TO_DATE('1979-03-09', 'YYYY-MM-DD'),1, 2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (8958770, 'Paul', 'Mescal', TO_DATE('1996-02-02', 'YYYY-MM-DD'), 1, 2001)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (13592008, 'Frankie', 'Corio', TO_DATE('2010-07-07', 'YYYY-MM-DD'), 2, 2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (803889, 'Bill', 'Skarsgard', TO_DATE('1990-08-09', 'YYYY-MM-DD'), 1,2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (4043618, 'Tom', 'Holland', TO_DATE('2003-02-01', 'YYYY-MM-DD'), 1, 2001)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (1659221, 'Sebastian', 'Stan', TO_DATE('1982-08-13', 'YYYY-MM-DD'), 1, 2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (1500155, 'Robert', 'Pattinson', TO_DATE('1986-05-13', 'YYYY-MM-DD'), 1, 2001)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (913475, 'John David', 'Washington', TO_DATE('1984-07-28', 'YYYY-MM-DD'), 1, 2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (1191, 'Adam', 'Sandler', TO_DATE('1966-09-09', 'YYYY-MM-DD'), 1, 2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (9681752, 'Julia', 'Fox', TO_DATE('1990-02-02', 'YYYY-MM-DD'), 2, 2003)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (634240, 'Christopher', 'Nolan', TO_DATE('1970-07-30', 'YYYY-MM-DD'), 1, 2001)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (634300, 'Jonathan', 'Nolan', TO_DATE('1976-06-06', 'YYYY-MM-DD'), 1, 2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (751577, 'Anthony', 'Russo', TO_DATE('1970-02-03', 'YYYY-MM-DD'), 1, 2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (751648, 'Joe', 'Russo', TO_DATE('1971-07-08', 'YYYY-MM-DD'), 1, 2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (1321655, 'Christopher', 'Markus', TO_DATE('1969-10-16', 'YYYY-MM-DD'), 1, 2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (466, 'Jean Pierre', 'Jaunet', TO_DATE('1953-04-03', 'YYYY-MM-DD'), 1, 2004)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (491011, 'Guillaume', 'Laurant', TO_DATE('1961-11-22', 'YYYY-MM-DD'), 1, 2004)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (1560977, 'Cary Joji', 'Fukunaga', TO_DATE('1977-07-10', 'YYYY-MM-DD'), 1, 2002)
  INTO Person (ID, Name, Surname, Birth_Date, Gender_Gender_ID, Birth_Location_ID) VALUES (701031, 'Neal', 'Purvis', TO_DATE('1961-09-09', 'YYYY-MM-DD'), 1, 2002)
SELECT 1 FROM dual;

--Inserting Streaming Services Values
INSERT ALL
  INTO StreamingServices (Service_ID, ServiceName) VALUES (11, 'Netflix')
  INTO StreamingServices (Service_ID, ServiceName) VALUES (12, 'AppleTV')
  INTO StreamingServices (Service_ID, ServiceName) VALUES (13, 'Amazon Prime Video')
  INTO StreamingServices (Service_ID, ServiceName) VALUES (14, 'Disney+')
  INTO StreamingServices (Service_ID, ServiceName) VALUES (15, 'HBO Max')
  INTO StreamingServices (Service_ID, ServiceName) VALUES (16, 'Hulu')
  INTO StreamingServices (Service_ID, ServiceName) VALUES (17, 'Peacock')
SELECT 1 FROM dual;

--Inserting Award Values
INSERT ALL
  INTO Award (Award_ID, Award_Name) VALUES (21, 'Best Motion Picture')
  INTO Award (Award_ID, Award_Name) VALUES (22, 'Best Actor')
  INTO Award (Award_ID, Award_Name) VALUES (23, 'Best Actress')
  INTO Award (Award_ID, Award_Name) VALUES (24, 'Best Director')
  INTO Award (Award_ID, Award_Name) VALUES (25, 'Best Cinematography')
  INTO Award (Award_ID, Award_Name) VALUES (26, 'Best Visual Effects')
  INTO Award (Award_ID, Award_Name) VALUES (27, 'Best Film')
SELECT 1 FROM dual;

--Inserting Language Values
INSERT ALL
  INTO Language (Language_ID, Language_Name) VALUES (31, 'English')
  INTO Language (Language_ID, Language_Name) VALUES (32, 'Turkish')
  INTO Language (Language_ID, Language_Name) VALUES (33, 'German')
  INTO Language (Language_ID, Language_Name) VALUES (34, 'Italian')
  INTO Language (Language_ID, Language_Name) VALUES (35, 'Polish')
  INTO Language (Language_ID, Language_Name) VALUES (36, 'French')
SELECT 1 FROM dual;

--Inserting Genre Values
INSERT ALL
  INTO Genre (Genre_ID, Genre_Name) VALUES (100, 'Action')
  INTO Genre (Genre_ID, Genre_Name) VALUES (101, 'Science Fiction')
  INTO Genre (Genre_ID, Genre_Name) VALUES (102, 'Thriller')
  INTO Genre (Genre_ID, Genre_Name) VALUES (103, 'Drama')
  INTO Genre (Genre_ID, Genre_Name) VALUES (104, 'Romance')
  INTO Genre (Genre_ID, Genre_Name) VALUES (105, 'Comedy')
  INTO Genre (Genre_ID, Genre_Name) VALUES (106, 'Fantasy')
  INTO Genre (Genre_ID, Genre_Name) VALUES (107, 'Horror')
SELECT 1 FROM dual;

--Inserting Location Values
INSERT ALL
  INTO Location (Country_ID, CountryName) VALUES (2001, 'United Kingdom')
  INTO Location (Country_ID, CountryName) VALUES (2002, 'United States')
  INTO Location (Country_ID, CountryName) VALUES (2003, 'Italy')
  INTO Location (Country_ID, CountryName) VALUES (2004, 'France')
  INTO Location (Country_ID, CountryName) VALUES (2005, 'Turkey')
  INTO Location (Country_ID, CountryName) VALUES (2006, 'China')
  INTO Location (Country_ID, CountryName) VALUES (2007, 'South Korea')
  INTO Location (Country_ID, CountryName) VALUES (2008, 'Japan')
  INTO Location (Country_ID, CountryName) VALUES (2009, 'Germany')
SELECT 1 FROM dual;

INSERT ALL
INTO  AwardofMovie (AwardMatch_ID, Movie_Movie_ID, Award_Award_ID) VALUES (1111, 816692, 27)--Interstellar Best Film
INTO  AwardofMovie (AwardMatch_ID, Movie_Movie_ID, Award_Award_ID) VALUES (2222, 211915, 27)-- Amelie Best Film
INTO  AwardofMovie (AwardMatch_ID, Movie_Movie_ID, Award_Award_ID) VALUES (3333, 15398776, 22)
INTO  AwardofMovie (AwardMatch_ID, Movie_Movie_ID, Award_Award_ID) VALUES (4444, 15398776, 26)
INTO  AwardofMovie (AwardMatch_ID, Movie_Movie_ID, Award_Award_ID) VALUES (5555, 15398776, 24)
INTO  AwardofMovie (AwardMatch_ID, Movie_Movie_ID, Award_Award_ID) VALUES (6666, 2382320, 25)
INTO  AwardofMovie (AwardMatch_ID, Movie_Movie_ID, Award_Award_ID) VALUES (7777, 4154796, 21)
INTO  AwardofMovie (AwardMatch_ID, Movie_Movie_ID, Award_Award_ID) VALUES (8888, 86250, 22)
INTO  AwardofMovie (AwardMatch_ID, Movie_Movie_ID, Award_Award_ID) VALUES (9999, 86250, 24)
SELECT 1 FROM dual;

INSERT ALL
    INTO LanguageofMovies (LanguageMatch_ID, Dubbed, Subtitles, Movie_Movie_ID, Language_Language_ID) VALUES (987, 'Yes', 'Yes', 816692, 31)
    INTO LanguageofMovies (LanguageMatch_ID, Dubbed, Subtitles, Movie_Movie_ID, Language_Language_ID) VALUES (986, 'Yes', 'Yes', 211915, 36)
    INTO LanguageofMovies (LanguageMatch_ID, Dubbed, Subtitles, Movie_Movie_ID, Language_Language_ID) VALUES (985, 'Yes', 'Yes', 4154796, 31)
    INTO LanguageofMovies (LanguageMatch_ID, Dubbed, Subtitles, Movie_Movie_ID, Language_Language_ID) VALUES (984, 'Yes', 'Yes', 15398776, 31)
    INTO LanguageofMovies (LanguageMatch_ID, Dubbed, Subtitles, Movie_Movie_ID, Language_Language_ID) VALUES (983, 'Yes', 'Yes', 2382320, 31)
    INTO LanguageofMovies (LanguageMatch_ID, Dubbed, Subtitles, Movie_Movie_ID, Language_Language_ID) VALUES (982, 'Yes', 'Yes', 86250, 31)
    INTO LanguageofMovies (LanguageMatch_ID, Dubbed, Subtitles, Movie_Movie_ID, Language_Language_ID) VALUES (981, 'Yes', 'Yes', 5727208, 31)
    INTO LanguageofMovies (LanguageMatch_ID, Dubbed, Subtitles, Movie_Movie_ID, Language_Language_ID) VALUES (980, 'Yes', 'Yes', 6723592, 31)
    INTO LanguageofMovies (LanguageMatch_ID, Dubbed, Subtitles, Movie_Movie_ID, Language_Language_ID) VALUES (979, 'Yes', 'Yes', 7395114, 31)
    INTO LanguageofMovies (LanguageMatch_ID, Dubbed, Subtitles, Movie_Movie_ID, Language_Language_ID) VALUES (978, 'Yes', 'Yes', 19770238, 31)
    INTO LanguageofMovies (LanguageMatch_ID, Dubbed, Subtitles, Movie_Movie_ID, Language_Language_ID) VALUES (977, 'Yes', 'Yes', 2798920, 31)
SELECT 1 FROM dual;

-- Insert data into the Movie_Streaming table
INSERT ALL
    INTO Movie_Streaming (Stream_ID, Movie_Movie_ID, Services_ID) VALUES (120, 816692, 11)
    INTO Movie_Streaming (Stream_ID, Movie_Movie_ID, Services_ID) VALUES (119, 816692, 12)
    INTO Movie_Streaming (Stream_ID, Movie_Movie_ID, Services_ID) VALUES (121, 211915, 12)
    INTO Movie_Streaming (Stream_ID, Movie_Movie_ID, Services_ID) VALUES (118, 211915, 14)
    INTO Movie_Streaming (Stream_ID, Movie_Movie_ID, Services_ID) VALUES (117, 15398776, 13)
    INTO Movie_Streaming (Stream_ID, Movie_Movie_ID, Services_ID) VALUES (122, 4154796, 11)
    INTO Movie_Streaming (Stream_ID, Movie_Movie_ID, Services_ID) VALUES (123, 15398776, 13)
    INTO Movie_Streaming (Stream_ID, Movie_Movie_ID, Services_ID) VALUES (124, 2382320, 11)
    INTO Movie_Streaming (Stream_ID, Movie_Movie_ID, Services_ID) VALUES (125, 86250, 12)
    INTO Movie_Streaming (Stream_ID, Movie_Movie_ID, Services_ID) VALUES (126, 5727208, 15)
    INTO Movie_Streaming (Stream_ID, Movie_Movie_ID, Services_ID) VALUES (127, 6723592, 12)
    INTO Movie_Streaming (Stream_ID, Movie_Movie_ID, Services_ID) VALUES (128, 7395114, 17)
    INTO Movie_Streaming (Stream_ID, Movie_Movie_ID, Services_ID) VALUES (129, 19770238, 13)
    INTO Movie_Streaming (Stream_ID, Movie_Movie_ID, Services_ID) VALUES (130, 2798920, 17)
SELECT 1 FROM dual;

INSERT ALL
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID, Movie_ID, Genre_ID) VALUES(816692,101,816692,101)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (816692,103,816692,103)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (816692,102,816692,102)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (4154796,101,4154796,101)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (4154796,100,4154796,100)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (4154796,102,4154796,102)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (4154796,103,4154796,103)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (4154796,106,4154796,106)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (15398776,101,15398776,101)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (15398776,103,15398776,103)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (15398776,102,15398776,102)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (211915,103,211915,103)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (211915,104,211915,104)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (211915,105,211915,105)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (2382320,100,2382320,100)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (2382320,102,2382320,102)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (2382320,103,2382320,103)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (86250,103,86250,103)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (86250,100,86250,100)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (2798920,101,2798920,101)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (2798920,102,2798920,102)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (2798920,103,2798920,103)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (19770238,103,19770238,103)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (7395114,103,7395114,103)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (7395114,102,7395114,102)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (6723592,101,6723592,101)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (6723592,106,6723592,106)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (6723592,102,6723592,102)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (5727208,103,5727208,103)
 INTO GenreOfMovie (Movie_Movie_ID,Genre_Genre_ID,Movie_ID, Genre_ID) VALUES (5727208,102,5727208,102)
 SELECT 1 FROM dual;

INSERT ALL
 INTO Role(Role_ID, Role_Name, Person_ID, Movie_Movie_ID) VALUES (230,'Actor', 190,816692)
 INTO Role(Role_ID, Role_Name, Person_ID, Movie_Movie_ID) VALUES (231,'Actor', 4266,816692)
 INTO Role(Role_ID, Role_Name, Person_ID, Movie_Movie_ID) VALUES (232,'Actor', 375,4154796)
 INTO Role(Role_ID, Role_Name, Person_ID, Movie_Movie_ID) VALUES (233,'Actor', 851582,211915)
 INTO Role(Role_ID, Role_Name, Person_ID, Movie_Movie_ID) VALUES (234,'Actor', 614165,15398776)
 INTO Role(Role_ID, Role_Name, Person_ID, Movie_Movie_ID) VALUES (235,'Actor', 185819,2382320)
 INTO Role(Role_ID, Role_Name, Person_ID, Movie_Movie_ID) VALUES (236,'Actor', 1785339,2382320)
 INTO Role(Role_ID, Role_Name, Person_ID, Movie_Movie_ID) VALUES (237,'Actor', 2244205,2382320)-- Lea
 INTO Role(Role_ID, Role_Name, Person_ID, Movie_Movie_ID) VALUES (238,'Actor', 199,86250)
 INTO Role(Role_ID, Role_Name, Person_ID, Movie_Movie_ID) VALUES (239,'Director',634240,816692)
 INTO Role(Role_ID, Role_Name, Person_ID, Movie_Movie_ID) VALUES (240,'Director',634240,15398776)
 INTO Role(Role_ID, Role_Name, Person_ID, Movie_Movie_ID) VALUES (241,'Director',634240,6723592)
 INTO Role(Role_ID, Role_Name, Person_ID, Movie_Movie_ID) VALUES (242,'Writer',634300,816692)
 SELECT 1 FROM dual;

SELECT * FROM Movie;
Select * from Person;
Select * from Genre;
Select * from Award;
Select * from StreamingServices;
Select * from Language;
Select * from AWARDOFMOVIE;
SELECT * FROM Movie_Streaming;
SELECT * FROM Role;
SELECT * FROM GenreOfMovie;
SELECT * FROM Location;

-- Give me the People whose Gender is "Male" - TASK 1
SELECT Person.Name, Person.Surname
From Person
JOIN GENDER ON Person.Gender_Gender_ID = Gender.Gender_ID
WHERE Gender.Gender_Name = 'Male';

-- Show me the names of Streaming Services which "Amelie" is available - TASK 1
SELECT StreamingServices.ServiceName
FROM Movie_Streaming
JOIN Movie ON Movie_Streaming.Movie_Movie_ID = Movie.Movie_ID
JOIN StreamingServices ON Movie_Streaming.Services_ID = StreamingServices.Service_ID
WHERE Movie.Movie_Name = 'Amelie';

-- Show me the multiple genres of movie "Oppenheimer" - TASK 1
SELECT g.Genre_Name, m.Movie_Name
FROM Movie M
JOIN GenreOfMovie MG ON M.Movie_ID = MG.Movie_ID
JOIN Genre G ON MG.Genre_ID = G.Genre_ID
WHERE Movie_Name = 'Oppenheimer';

-- Show me the number of movies that Person worked for in descending order, exclude the ones only worked on 1 movie -- TASK 2
SELECT p.Name, p.Surname, COUNT(r.Movie_Movie_ID) AS Movie_Count
FROM Person p
JOIN Role r ON p.ID = r.Person_ID
JOIN Location bp ON p.Birth_Location_ID = bp.Country_ID
GROUP BY p.Name, p.Surname
HAVING COUNT(r.Movie_Movie_ID) > 1
ORDER BY Movie_Count DESC;

-- Show me the awards of a movie with latest arrival date (exclude ones without an award) - TASK 2
SELECT  m.Movie_ID, m.Movie_Name, a.Award_Name, m.Release_Date
FROM Movie m
JOIN AwardofMovie AM ON m.Movie_ID = AM.Movie_Movie_ID
JOIN Award a ON AM.Award_Award_ID = a.Award_ID
WHERE m.Release_Date >= (SELECT MAX(m.Release_Date) FROM Movie m)
GROUP BY m.Movie_Name, m.Movie_ID, a.Award_Name, m.RELEASE_DATE
HAVING a.Award_Name IS NOT NULL;

-- Show me the Award Count of Genres, exclude the ones with lower Average imdb score than 8.1 - TASK 2
SELECT g.Genre_Name, AVG(m.IMDB_Score) AS AverageIMDBScore, COUNT(a.AwardMatch_ID) AS AwardCount
FROM Movie m
JOIN GenreOfMovie gm ON m.Movie_ID = gm.Movie_Movie_ID
JOIN Genre g ON gm.Genre_Genre_ID = g.Genre_ID
JOIN AwardofMovie a ON m.Movie_ID = a.Movie_Movie_ID
GROUP BY g.Genre_Name
HAVING AVG(m.IMDB_Score) > 8.1
ORDER BY AwardCount DESC;


-- Select the movies with IMDB Score higher than the average - TASK 3
SELECT Movie_Name, IMDB_Score
FROM Movie
WHERE IMDb_Score > ( SELECT AVG (IMDB_Score) FROM MOVIE);


--Show me the movies has more award than the average award number among the movies - TASK 3
SELECT m.Movie_ID, m.Movie_Name, COUNT(aw.AwardMatch_ID) AS Award_Count
FROM Movie m
JOIN AwardofMovie aw ON m.Movie_ID = aw.Movie_Movie_ID
GROUP BY m.Movie_ID, m.Movie_Name
HAVING COUNT(aw.AwardMatch_ID) > (
    SELECT AVG(awi)
    FROM (
        SELECT COUNT(AwardMatch_ID) AS awi
        FROM AwardofMovie
        GROUP BY Movie_Movie_ID
    )
);

--Show me the person who was worked more than average person among the people - TASK 4
SELECT p.Name, p.Surname, COUNT(r.Movie_Movie_ID) AS Movie_Count
FROM Person p
JOIN Role r ON p.ID = r.Person_ID
--JOIN Location bp ON p.Birth_Location_ID = bp.Country_ID
GROUP BY p.Name, p.Surname
HAVING COUNT(r.Movie_Movie_ID) > ( SELECT AVG(rcount)
    FROM (SELECT COUNT(Person_ID) AS rcount FROM Role
        GROUP BY Person_ID
    )
);

--Show me the People who is older than the average - TASK 4
SELECT p.Name, p.Surname, MIN(p.Birth_Date) AS MBD
FROM Person p
GROUP BY p.Name, p.Surname
HAVING MIN(EXTRACT(YEAR FROM p.Birth_Date)) <= (SELECT AVG(EXTRACT(YEAR FROM Birth_Date)) FROM Person)
ORDER BY MBD ASC;


-- Show me the movies that has higher imdb score than average TASK 4 Correlated Subquery
SELECT m.Movie_ID, m.Movie_Name, m.IMDb_Score
FROM Movie m
WHERE m.IMDb_Score > (
    SELECT AVG(m2.IMDb_Score)
    FROM Movie m2
);
-- Show me the every movie that has the highest imdb score from every country TASK 4 Correlated Subquery
SELECT Movie_ID, Movie_Name, Country_of_Origin, IMDb_Score
FROM Movie m
WHERE IMDb_Score = (
    SELECT MAX(IMDb_Score)
    FROM Movie m2
    WHERE m2.Country_of_Origin = m.Country_of_Origin
);