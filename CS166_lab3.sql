DROP TABLE IF EXISTS Professor, Project, Department, Graduate;
CREATE TABLE Professor (ssn text, dno INTEGER NOT NULL, name text, age INTEGER, rank text, specialty text);
CREATE TABLE Project (pno INTEGER, ssn text NOT NULL, sponsor text, start_date text, end_date text, budget REAL);
CREATE TABLE Department (dno INTEGER, ssn text NOT NULL, dname text, office text);
CREATE TABLE Graduate (ssn text, dno INTEGER name text, age INTEGER, deg_pg text);
CREATE TABLE Work_in (ssn text NOT NULL, pno text)
CREATE TABLE Work_proj (pno INTEGER, ssn text, since text);
CREATE TABLE Works_dept (ssn text NOT NULL, dno INTEGER, pno INTEGER, time_pc text);

CREATE TABLE Project_supervisor (ssn text, dno INTEGER, pno INTEGER, since text);

