DROP TABLE IF EXISTS Professor;
CREATE TABLE Professor (ssn text, name text, age INTEGER, rank text, specialty text);
DROP TABLE IF EXISTS Project;
CREATE TABLE Project (pno INTEGER, sponsor text, start_date text, end_date text, budget REAL);
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (dno INTEGER, dname text, office text);
DROP TABLE IF EXISTS Graduate;
CREATE TABLE Graduate (ssn text, name text, age INTEGER, deg_pg text);
DROP TABLE IF EXISTS Work_in;
CREATE TABLE Work_in (ssn text, pno text);
DROP TABLE IF EXISTS Project_mgr;
CREATE TABLE Project_mgr (pno INTEGER, ssn text, sponsor text, start_date text, end_date text, budget REAL);
DROP TABLE IF EXISTS Work_proj;
CREATE TABLE Work_proj (pno INTEGER, ssn text, since text);
DROP TABLE IF EXISTS Works_dept;
CREATE TABLE Works_dept (ssn DNO, pno INTEGER, since text);
DROP TABLE IF EXISTS Dep_chair;
CREATE TABLE Dep_chair (ddn text,  dno INTEGER, pno INTEGER, since text);

DROP TABLE IF EXISTS Project_supervisor;
CREATE TABLE Project_supervisor (ssn text, dno INTEGER, pno INTEGER, since text);

DROP TABLE IF EXISTS Graduate_dept;
CREATE TABLE Graduate_dpt (ssn text, dno INTEGER, ssn text, name text, age INTEGER, deg_pg text);
DROP TABLE IF EXISTS Advises;
CREATE TABLE Advises (ssn text, ssn text, name text, age INTEGER, deg_pg text);

