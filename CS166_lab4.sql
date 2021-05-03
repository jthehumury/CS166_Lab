DROP TABLE IF EXISTS Books, Students, Authors, Descriptions, Borrows, Has_written, Describes;
CREATE TABLE Books (
DocId numeric(9,0) NOT NULL,
Title text,
Publisher text,
Year numeric(4,0),
PRIMARY KEY (DocId)
);
CREATE TABLE Students (
StId numeric(9,0) NOT NULL,
StName text,
Major text,
Age numeric(2,0),
PRIMARY KEY (StId)
);
CREATE TABLE Authors (
AName text NOT NULL,
Address text,
PRIMARY KEY (AName)
);
CREATE TABLE Descriptions (
Keyword text NOT NULL,
PRIMARY KEY (Keyword)
);
CREATE TABLE Borrows (
DocId numeric(9,0) NOT NULL,
StId numeric(9,0) NOT NULL,
Date text,
PRIMARY KEY (DocId, StId),
FOREIGN KEY (DocId) REFERENCES Books (DocId),
FOREIGN KEY (StId) REFERENCES Students (StId)
);
CREATE TABLE Has_written (
DocId numeric(9,0) NOT NULL,
AName text NOT NULL,
PRIMARY KEY (DocId, AName),
FOREIGN KEY (DocId) REFERENCES Books (DocId),
FOREIGN KEY (AName) REFERENCES Authors (AName)
);
CREATE TABLE Describes (
DocId numeric(9,0) NOT NULL,
Keyword text NOT NULL,
PRIMARY KEY (DocId, Keyword),
FOREIGN KEY (DocId) REFERENCES Books (DocId),
FOREIGN KEY (Keyword) REFERENCES Descriptions (Keyword)
);

SELECT Year, Title FROM Books;
SELECT * FROM Students WHERE Major = 'CS';
SELECT * FROM Students CROSS JOIN Books;
SELECT * FROM Books WHERE Publisher = 'McGraw-Hill' AND Year < 1990;
SELECT AName FROM Authors WHERE Address = 'Davis';
SELECT StName FROM Students WHERE NOT(Major='CS' OR Age<30);
ALTER TABLE Authors RENAME COLUMN AName TO Name;
SELECT StName FROM Students NATURAL JOIN Borrows WHERE Major = 'CS';
SELECT Title FROM Authors NATURAL JOIN Has_written NATURAL JOIN Books WHERE Name = 'Jones';
SELECT Title FROM Descriptions NATURAL JOIN Authors NATURAL JOIN Has_written NATURAL JOIN Books WHERE Name = 'Jones' AND NOT(Keyword = 'database');
SELECT StName FROM ((SELECT StName, Age FROM Students) MINUS (SELECT d.StName, d.Age FROM (((SELECT * INTO d FROM Students) WHERE Students.Age < d.Age)));
SELECT Title FROM ((SELECT Title, Year FROM Books) MINUS (SELECT d.Title, d.Year FROM (((SELECT * INTO d FROM Books) CROSS JOIN Books) WHERE Books.Year < d.Year)));
