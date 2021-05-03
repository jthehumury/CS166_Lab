DROP TABLE IF EXISTS Books, Students, Authors, Descriptions, Borrows, Has-written, Describes;
CREATE TABLE Books (
DocId numeric(0,9) NOT NULL,
Title text,
Publisher text,
Year numeric(0,4),
PRIMARY KEY (DocId)
);
CREATE TABLE Students (
StId numeric(0,9) NOT NULL,
StName text,
Major text,
Age numeric(0,3),
PRIMARY KEY (StId),
);
CREATE TABLE Authors (
AName text NOT NULL,
Address text,
PRIMARY KEY (AName),
);
CREATE TABLE Descriptions (
Keyword text NOT NULL,
PRIMARY KEY (Keyword)
);
CREATE TABLE Borrows (
DocId numeric(0,9) NOT NULL,
StId numeric(0,9) NOT NULL,
Date text,
PRIMARY KEY (DocId, StId),
FOREIGN KEY (DocId) REFERENCES Books (DocId),
FOREIGN KEY (StId) REFERENCES Students (StId)
);
CREATE TABLE Has-written (
DocId numeric(0,9) NOT NULL,
AName text NOT NULL,
PRIMARY KEY (DocId, AName),
FOREIGN KEY (DocId) REFERENCES Books (DocId),
FOREIGN KEY (AName) REFERENCES Authors (AName)
);
CREATE TABLE Describes (
DocId numeric(0,9) NOT NULL,
Keyword text NOT NULL,
PRIMARY KEY (ssn, dno),
FOREIGN KEY (DocId) REFERENCES Books (DocId),
FOREIGN KEY (Keyword) REFERENCES Descriptions (Keyword)
);
