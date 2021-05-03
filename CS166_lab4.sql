DROP TABLE IF EXISTS Professor, Project, Dept, Graduate, Work_in, Work_proj, Work_dept, Supervise;
CREATE TABLE Professor (
ssn text NOT NULL,
name text,
age INTEGER,
rank text,
specialty text,
PRIMARY KEY (ssn)
);
CREATE TABLE Project (
pno INTEGER NOT NULL,
ssn text NOT NULL,
sponsor text,
start_date text,
end_date text,
budget REAL,
PRIMARY KEY (pno),
FOREIGN KEY (ssn) REFERENCES Professor (ssn)
);
CREATE TABLE Dept (
dno INTEGER NOT NULL,
ssn text NOT NULL,
dname text,
office text,
PRIMARY KEY (dno),
FOREIGN KEY (ssn) REFERENCES Professor (ssn)
);
CREATE TABLE Graduate (
ssn text NOT NULL,
ssn_advisor text NOT NULL,
dno INTEGER NOT NULL,
name text,
age INTEGER,
deg_pg text,
PRIMARY KEY (ssgn),
FOREIGN KEY (dno) REFERENCES Dept (dno)
);
CREATE TABLE Work_in (
ssn text NOT NULL,
pno INTEGER,
PRIMARY KEY (ssn, pno),
FOREIGN KEY (ssn) REFERENCES Professor (ssn),
FOREIGN KEY (pno) REFERENCES Project (pno)
);
CREATE TABLE Work_proj (
pno INTEGER NOT NULL,
ssn text NOT NULL,
since text,
PRIMARY KEY (pno, ssn),
FOREIGN KEY (pno) REFERENCES Project (pno),
FOREIGN KEY (ssn) REFERENCES Graduate (ssn)
);
CREATE TABLE Work_dept (
ssn text,
dno INTEGER NOT NULL,
time_pc text,
PRIMARY KEY (ssn, dno),
FOREIGN KEY (ssn) REFERENCES Professor (ssn),
FOREIGN KEY (dno) REFERENCES Dept (dno)
);
CREATE TABLE Supervise (
pno INTEGER,
ssn_graduate text,
ssn text NOT NULL,
since text,
PRIMARY KEY (pno, ssn_graduate, ssn),
FOREIGN KEY (pno) REFERENCES Project (pno),
FOREIGN KEY (ssn_graduate) REFERENCES Graduate (ssn),
FOREIGN KEY (ssn) REFERENCES Professor (ssn)
);

DROP TABLE IF EXISTS Musicians, Album, Songs, Instrument, Place, Telephone, Plays, Perform, Lives;
CREATE TABLE Musicians (
ssn text NOT NULL,
name text,
PRIMARY KEY (ssn)
);
CREATE TABLE Album (
albumIdentifier text NOT NULL,
copywriteDate text,
speed text,
title text,
ssn text NOT NULL,
PRIMARY KEY (albumIdentifier),
FOREIGN KEY (ssn) REFERENCES Musicians (ssn)
);
CREATE TABLE Songs (
songId text NOT NULL,
title text,
author text,
albumidentifier text NOT NULL,
PRIMARY KEY (songId),
FOREIGN KEY (albumIdentifier) REFERENCES Album (albumIdentifier)
);
CREATE TABLE Instrument (
instrId text NOT NULL,
dname text,
key text,
PRIMARY KEY (instrId)
);
CREATE TABLE Place (
address text NOT NULL,
PRIMARY KEY (address)
);
CREATE TABLE Telephone (
phone_no text,
address text NOT NULL,
PRIMARY KEY (phone_no),
FOREIGN KEY (address) REFERENCES Place (address)
);
CREATE TABLE Plays (
ssn text NOT NULL,
instrId text NOT NULL,
PRIMARY KEY (ssn, instrId),
FOREIGN KEY (ssn) REFERENCES Musicians (ssn),
FOREIGN KEY (instrId) REFERENCES Instrument (instrId)
);
CREATE TABLE Perform (
ssn text NOT NULL,
songId text NOT NULL,
PRIMARY KEY (ssn, songId),
FOREIGN KEY (ssn) REFERENCES Musicians (ssn),
FOREIGN KEY (songId) REFERENCES Songs (songId)
);
CREATE TABLE Lives (
address text NOT NULL,
phone_no text NOT NULL,
ssn text NOT NULL,
PRIMARY KEY (address, phone_no, ssn),
FOREIGN KEY (address) REFERENCES Place (address),
FOREIGN KEY (phone_no) REFERENCES Telephone (phone_no),
FOREIGN KEY (ssn) REFERENCES Musicians (ssn)
);
