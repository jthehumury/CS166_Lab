DROP TABLE IF EXISTS Books, Students, Authors, Descriptions, Borrows, Has-written, Describes;
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
CREATE TABLE Has-written (
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
