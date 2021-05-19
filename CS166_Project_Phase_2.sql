DROP TABLE IF EXISTS Hospital, Patient, Appointment, Department_includes, Doctor_worksDept, Staff_worksIn, past, active, available, waitlisted, has, schedules, request_maintenance, searches;
/*Entities: Hospital, Patient, Appointment*/
CREATE TABLE Hospital (hospital_ID CHAR(10) NOT NULL, hname CHAR(30),
	PRIMARY KEY(hospital_ID));
CREATE TABLE Patient (patient_ID CHAR(10) NOT NULL, pname CHAR(30), gender CHAR(10), num_appointment INTEGER, age INTEGER, address CHAR(50),
	PRIMARY KEY(patient_ID));
CREATE TABLE Appointment (appnt_ID CHAR(10) NOT NULL, date CHAR(30), time_slot CHAR(10),
	PRIMARY KEY(appnt_ID));

/*Dual Entities?: Department_Includes, Doctor_worksDept, Staff_worksIn*/
CREATE TABLE Department_includes (dept_ID CHAR(10) NOT NULL, hospital_ID CHAR(10) NOT NULL, name CHAR(30),
	UNIQUE(dept_ID),
	PRIMARY KEY(hospital_ID, dept_ID),
	FOREIGN KEY(hospital_ID) REFERENCES Hospital(hospital_ID));
CREATE TABLE Doctor_worksDept (doctor_ID CHAR(10) NOT NULL, dept_ID CHAR(10) NOT NULL, name CHAR(30), specialty CHAR(30),
	UNIQUE(doctor_ID),
	PRIMARY KEY(doctor_ID, dept_ID),
	FOREIGN KEY(dept_ID) REFERENCES Department_includes(dept_ID));
CREATE TABLE Staff_worksIn (staff_ID CHAR(10) NOT NULL, name CHAR(30), hospital_ID CHAR(10) NOT NULL,
	UNIQUE(staff_ID),
	PRIMARY KEY(hospital_ID, staff_ID),
	FOREIGN KEY(hospital_ID) REFERENCES Hospital(hospital_ID));


/*Weak Entities: past, active, available, waitlisted*/
CREATE TABLE past (appnt_ID CHAR(10) NOT NULL,
	PRIMARY KEY(appnt_ID),
	FOREIGN KEY(appnt_ID) REFERENCES Appointment(appnt_ID) ON DELETE CASCADE);
CREATE TABLE active (appnt_ID CHAR(10) NOT NULL,
	PRIMARY KEY(appnt_ID),
	FOREIGN KEY(appnt_ID) REFERENCES Appointment(appnt_ID) ON DELETE CASCADE);
CREATE TABLE available (appnt_ID CHAR(10) NOT NULL,
	PRIMARY KEY(appnt_ID),
	FOREIGN KEY(appnt_ID) REFERENCES Appointment(appnt_ID) ON DELETE CASCADE);
CREATE TABLE waitlisted (appnt_ID CHAR(10) NOT NULL,
	PRIMARY KEY(appnt_ID),
	FOREIGN KEY(appnt_ID) REFERENCES Appointment(appnt_ID) ON DELETE CASCADE);


/*Relationship: has connecting Doctor and Appointment*/
CREATE TABLE has (appnt_ID CHAR(10), doctor_id CHAR(10),
	PRIMARY KEY(appnt_ID, doctor_ID),
	FOREIGN KEY(appnt_ID) REFERENCES Appointment(appnt_ID),
	FOREIGN KEY(doctor_ID) REFERENCES Doctor_worksDept(doctor_ID));

/*Relationship: schedules connecting Appointment and Staff*/
CREATE TABLE schedules (appnt_ID CHAR(10), staff_ID CHAR(10),
	PRIMARY KEY(appnt_ID, staff_ID),
	FOREIGN KEY(appnt_ID) REFERENCES Appointment(appnt_ID),
	FOREIGN KEY(staff_ID) REFERENCES Staff_worksIn(staff_ID));

/*Relationship: request_maintenance connecting Doctor and Staff*/
CREATE TABLE request_maintenance (patient_per_hour INTEGER, dept_name CHAR(30), time_slot CHAR(10), 
	doctor_ID CHAR(10), staff_ID CHAR(10),
	PRIMARY KEY(doctor_ID, staff_ID),
	FOREIGN KEY(doctor_ID) REFERENCES Doctor_worksDept(doctor_ID),
	FOREIGN KEY(staff_ID) REFERENCES Staff_worksIn(staff_ID));

/*Relationship: Searches connecting Hospital, Patient, Appointment*/
CREATE TABLE searches (hospital_ID CHAR(10), patient_ID CHAR(10), appnt_ID CHAR(10),
	PRIMARY KEY(hospital_ID, patient_ID, appnt_ID),
	FOREIGN KEY(hospital_ID) REFERENCES Hospital(hospital_ID),
	FOREIGN KEY(patient_ID) REFERENCES Patient(patient_ID),
	FOREIGN KEY(appnt_ID) REFERENCES Appointment(appnt_ID));

