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

INSERT INTO Students VALUES (860507041,'John Anderson',CS,45);
INSERT INTO Books VALUES (860507041,'b1',McGraw-Hill,1980);
INSERT INTO Authors VALUES ('John Anderson','Davis');

SELECT Year, Title FROM Books;
SELECT * FROM Students WHERE Major = CS;

SELECT * FROM Books WHERE Publisher = McGraw-Hill AND Year < 1990;
SELECT AName FROM Authors WHERE Address = 'Davis';
