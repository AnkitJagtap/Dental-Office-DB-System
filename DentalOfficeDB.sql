CREATE SCHEMA Record;
--1.2
create table Record.dental_history(
Patient_id INT Foreign key REFERENCES Patient.patient_personal_info(Patient_id) NOT NULL, 
Dental_History_Id INT PRIMARY KEY IDENTITY (1,1),
Condition_name  VARCHAR(50) NOT NULL ,
)

INSERT INTO Record.dental_history(Patient_id, Condition_name)
VALUES
('1','ulcers'),
('2','swollen gums'),
('3','bleeding gums'),
('4','chronic bad breath'),
('5','sensitivity'),
('6','toothache'),
('7','receding gums'),
('8','pain with chewing '),
('9','cracked teeth'),
('10','frequent dry mouth'),
('11','pain with biting');

--1.3
create table Record.oral_condition(
Oral_condition_id  INT PRIMARY KEY IDENTITY (1,1),
Patient_id INT Foreign key REFERENCES Patient.patient_personal_info(Patient_id) NOT NULL, 
Tooth_number CHAR(10) NOT NULL,
Status VARCHAR(50) NOT NULL
)

INSERT INTO Record.oral_condition(Patient_id, Tooth_number,Status)
VALUES
('1','A55','Removed'),
('2','B54','N/A'),
('3','C53','Recoverd'),
('4','F61','Cleaned'),
('5','G62','Desensitized'),
('6','J65','Removerd cavity'),
('7','S84','Flap Scaling'),
('8','R83 ','Hydrogen peroxide rinse'),
('9','P81','Reattched'),
('10','O71','Prescribed Salagen'),
('11','K75','Hydrogen peroxide rinse');

--1.4
create table Record.consent(
consent_id  INT PRIMARY KEY IDENTITY (1,1),
Patient_id INT Foreign key REFERENCES Patient.patient_personal_info(Patient_id) NOT NULL, 
Is_Valid_till date NOT NULL,
)

INSERT INTO Record.consent(Patient_id, Is_Valid_till)
VALUES
('1','2022-12-20'),
('2','2022-10-11'),
('3','2022-08-11'),
('4','2022-05-06'),
('5','2022-09-12'),
('6','2022-05-22'),
('7','2023-02-12'),
('8','2022-04-05'),
('9','2022-09-02'),
('10','2022-09-12'),
('11','2022-01-01');

--1.5
create table Record.prescription(
Prescription_id INT PRIMARY KEY IDENTITY (1,1),
Prescription_name CHAR(50) NOT NULL,
Appointment_id INT Foreign key REFERENCES Record.appiontment(Appointment_id) NOT NULL,
Description VARCHAR(100) NULL,
Price FLOAT NOT NULL
)

INSERT INTO Record.prescription(Prescription_name, Appointment_id, Description, Price)
VALUES
('Lidocaine','3','Lidocaine is a local anaesthetic. It used in some medicines to treat ulcer','17'),
('amoxicillin','2','amoxicillin used to treat gum disease','8'),
('Feracrylum','3','Feracrylum used to treat gum infection','10'),
('Oral Complete','4','antibiotic to treat the bad breath ','29.95'),
('Pamprin','5','strengthen the sensitive area of tooth','7.59'),
('DenTek','6','Instant Oral Pain Reliefer and repairer ','7.99'),
('Crest Pro-Health Advanced Gum Restore','7','Advanced gum restore deep clean Toothpaste','15.99'),
('Advil or Motrin (ibuprofen)','8',' commonly used to treat chewing pain','24.69'),
('Tyleno','9','pain reliever ','8.55'),
('pilocarpine','10',' medication that stimulates saliva','9.39'),
('Advil or Motrin (ibuprofen)','11',' commonly used to treat biting pain','24.69');


--1.6
Create table Record.Appiontment(
Appointment_id INT PRIMARY KEY IDENTITY (1,1),
Patient_id INT Foreign key REFERENCES Patient.patient_personal_info(Patient_id) NOT NULL, 
Provider_id INT Foreign key REFERENCES Provider.provider_info(Provider_id) NOT NULL, 
Service_id INT Foreign key REFERENCES Provider.provider_services(Service_id) NOT NULL,
Room_id  varchar(20) Foreign key REFERENCES Office.room(Room_id) NOT NULL,
Date_created date NOT NULL,
Appointment_date date NOT NULL,
Start_time time NOT NULL,
End_time time NOT NULL,
Number_of_Slots INT NOT NULL,
Cancelled Bit NOT NULL,
Cancellation_reason varchar(50) NULL 
) ;

INSERT INTO Record.Appiontment(Patient_id ,Provider_id, Service_id, Room_id,
Date_created, Appointment_date, Start_time, End_time, Number_of_Slots, Cancelled)
VALUES
('1','2','3','1','2021-12-15','2021-12-18','15:00:00','16:00:00','4',0),
('2','3','4','2','2021-11-15','2021-12-19','14:00:00','14:15:00','1',0),
('3','4','3','3','2021-12-15','2021-12-15','11:00:00','11:30:00','2',0),
('4','5','4','4','2021-12-15','2021-12-16','15:00:00','16:00:00','4',0),
('5','6','5','4','2021-11-09','2021-12-20','15:00:00','16:00:00','4',0),
('6','6','6','5','2021-10-11','2021-12-20','16:15:00','16:30:00','1',0),
('7','6','7','6','2021-11-15','2021-12-20','17:00:00','17:30:00','2',0),
('8','7','7','7','2021-08-15','2021-12-20','16:00:00','17:00:00','4',0),
('9','7','3','8','2021-05-17','2021-12-20','18:00:00','18:30:00','2',0),
('10','8','4','8','2021-11-05','2021-12-20','13:30:00','14:00:00','2',0),
('1','8','3','9','2021-11-10','2021-12-20','17:00:00','18:15:00','5',0),
('2','3','6','10','2021-10-19','2021-12-19','11:00:00','11:30:00','2',0);


INSERT INTO Record.Appiontment(Patient_id ,Provider_id, Service_id, Room_id,
Date_created, Appointment_date, Start_time, End_time, Number_of_Slots, Cancelled)
VALUES
('8','7','7','7','2021-08-15','2021-09-20','16:00:00','17:00:00','4',0),
('9','7','3','8','2021-05-17','2021-09-08','18:00:00','18:30:00','2',0),
('10','8','4','8','2021-11-05','2021-10-07','13:30:00','14:00:00','2',0),
('1','8','3','9','2021-11-10','2021-11-27','17:00:00','18:15:00','5',0),
('2','3','6','10','2021-10-19','2021-11-16','11:00:00','11:30:00','2',0);


--2.OFFICE
--2.1
create table Office.location(
Location_id INT PRIMARY KEY IDENTITY (1,1),
Location_city  VARCHAR(50) NOT NULL,
Location_state  VARCHAR(25)  NOT NULL,
Location_zip  VARCHAR(12) NULL,
Location_street VARCHAR(50) NULL,
)

INSERT INTO Office.location(Location_City,Location_State ,Location_Zip, Location_Street)
VALUES
('Boston', 'Massachussets', '02115', 'Fenway'),
('New York City', 'New york', ' 10018', '5th Avenue'),
('Long Island City','New York', '11568', 'Old Westbury'),
('Manahasset', 'New York', '11030', 'Albermarle Rd'),
('Salem', 'Massachussets', '01970', 'Cleveland RD'),
('Quincy', 'Massachussets', '02122', 'Park St'),
('Boston', 'Massachussets', '02119', 'Roxbury St'),
('Brighton', 'Massachussets', '02135', 'Claymoss RD'),
('Cambridge', 'Massachussets', '02140', 'Russel St'),
('New Jersey', 'New Jersey', '07003', 'Bloomfield Ave');

--2.2
ALTER TABLE Office.room
ALTER COLUMN Room_id BIGINT;
create table Office.room(
Room_id	VARCHAR(20) PRIMARY KEY IDENTITY (1,1),
Room_type_id  INT Foreign key REFERENCES Office.room_type(Room_type_id) NOT NULL,
Location_id INT Foreign key REFERENCES Office.location(Location_id) NOT NULL 
)

Insert INTO Office.room(Room_id,Room_Type_id ,Location_id)
Values
('1','1','4'),
('2','2','3'),
('3','1','2'),
('4','3','4'),
('5','5','6'),
('6','4','1'),
('7','6','7'),
('8','3','8'),
('9','4','6'),
('10','5','9');

--2.3
create table Office.room_type(
Room_type_id INT PRIMARY KEY IDENTITY (1,1),
Room_Type VARCHAR(30) NOT NULL
)

Insert INTO Office.room_type(Room_Type)
Values
('General Dental'),
('Pediatric'),
('Periodontic'),
('Orthodontic'),
('Endodontic'),
('Prosthodontic');

--2.4
create table Office.room_equipment(
Equipment_id INT PRIMARY KEY IDENTITY (1,1),
Room_id  varchar(20) Foreign key REFERENCES Office.room(Room_id) NOT NULL,
Equipment_name VARCHAR(30) NOT NULL
)
Insert Into Office.room_equipment(Room_id , Equipment_name)
Values
('1','Mouth Mirror'),
('2','Dental Syringe'),
('3','Dental Patient Chair'),
('2','Scaler'),
('2','Burnisher'),
('4','Sppon Excavator'),
('3','Mould'),
('2','Suction Device'),
('4','X-ray'),
('5','Curette');

--3. Provider
--3.1 Provider_info
create table Provider.provider_info(
Provider_id INT PRIMARY KEY IDENTITY (1,1),
First_name VARCHAR(30) NOT NULL,
Last_name VARCHAR(30) NOT NULL,
Provider_type_id INT Foreign key REFERENCES Provider.provider_type(Provider_type_id) NOT NULL 
)

SET IDENTITY_INSERT Provider.provider_info OFF;
INSERT INTO Provider.provider_info(First_Name, Last_name, Provider_type_id)
	VALUES 
		('Thress', 'Abigail', '3'),
		('Chandler', 'Bing', '2'),
		('Ruby', 'Gottlieb', '5'),
		('Annabel', 'Vazquez', '3'),
		('Kaedryn', 'Pulling', '4'),
		('Sydney', 'Ring', '3'),
		('Julia', 'Norton', '1');

		Select * from Provider.provider_info;
 
--3.2
create table Provider.provider_services(
Service_id INT PRIMARY KEY IDENTITY (1,1),
Provider_id INT Foreign key REFERENCES Provider.provider_info(Provider_id) NOT NULL, 
Service_name VARCHAR(50) NOT NULL,
Duration INT  NOT NULL,
Fee Float NOT NULL
)

INSERT INTO Provider.provider_services(Provider_id, Service_name, Duration, fee)
	VALUES 
		('2', 'Periodontal', '08', '150.50'),
		('3', 'Endodontal', '08', '120.25'),
		('4',  'Pediatric', '08', '100.75'),
		('5',  'Periodontal', '08', '150.50'),
		('6',  'Prosthodontal', '08', '170.75'),
		('7',  'Periodontal', '08', '150.50'),
		('8',  'Orthodontal', '08', '100');

--3.3
create table Provider.provider_type(
Provider_type_id  INT PRIMARY KEY IDENTITY (1,1),
Category VARCHAR(25) NOT NULL
)

INSERT INTO Provider.provider_type(Category)
	VALUES 
		('Orthodontist'),
		('Endodontist'),
		('Periodontist'),
		('Prosthodontist'),
		('Pediatric');
		Select * from Provider.provider_type;

--3.4
ALTER TABLE Provider.provider_contact
ALTER COLUMN Provider_contact BIGINT;
create table Provider.provider_contact(
Contact_id INT PRIMARY KEY IDENTITY (1,1),
Provider_id INT Foreign key REFERENCES Provider.provider_info(Provider_id) NOT NULL, 
Provider_contact BIGINT NOT NULL,
Is_primary bit NOT NULL,
Email VARCHAR(30)  NOT NULL
)

INSERT INTO provider.provider_contact(Provider_id, Provider_contact, Is_Primary, Email)
	VALUES 
		( '2', '8572509984','1', 'at@perio.com'),
		( '3', '6174652223', '0', 'bc@endo.com'),
		( '4', '8576664444', '1', 'gr@pedia.com'),
		( '5', '6172340009', '1', 'va@perio.com'),
		( '6', '8572987689', '0', 'pk@prostho.com'),
		( '7', '8572987680', '0', 'rs@perio.com'),
		( '8', '8572987678', '1', 'nj@ortho.com');

--3.5
create table Provider.provider_schedule(
Schedule_id INT PRIMARY KEY IDENTITY (1,1),
Provider_id INT Foreign key REFERENCES Provider.provider_info(Provider_id) NOT NULL, 
Date DATE NOT NULL,
Start_time TIME  NOT NULL,
End_time TIME NOT NULL
)

INSERT INTO provider.provider_schedule(Provider_id, Date, Start_time, End_time)
	VALUES 
		('2', '12/18/2021', '09:00','17:00'),
		('3', '12/19/2021', '10:15', '18:15'),
		('4', '12/15/2021', '11:30', '19:30'),
		('5', '12/14/2021', '08:00', '16:00'),
		('6', '12/20/2021', '13:00', '21:00'),
		('7', '12/20/2021', '13:00', '21:00'),
		('8', '12/20/2021', '13:00', '21:00');

		select * from provider.provider_schedule;

--4 PATIENT
CREATE SCHEMA Patient;
--4.1
create table Patient.patient_personal_info(
Patient_id INT PRIMARY KEY IDENTITY (1,1),
First_name VARCHAR(30)  NOT NULL,
Last_name VARCHAR(30) NOT NULL,
Gender VARCHAR(30)  NOT NULL,
Date_of_birth DATE NOT NULL,
Email VARCHAR(30) NOT NULL
)

select * from Patient.patient_personal_info

INSERT INTO Patient.patient_personal_info(First_name, Last_name, Gender, Date_of_birth, Email)
	VALUES 
		('Scott', 'Micheal', 'Male', '1964/12/03', 'scott@dundy.com'),
		('Beesly', 'Pam', 'Female', '1980/04/09', 'beesly@dundy.com'),
		('Schrute', 'Dwight', 'Male', '1974/05/13', 'schrute@dundy.com'),
		('Halpert', 'Jim', 'Male', '1985/09/29', 'halpert@dundy.com'),
		('Malone', 'Kevin', 'Male', '1967/10/10', 'malone@dundy.com'),
		('Bratton', 'Creed', 'Male', '1958/02/15', 'bratton@dundy.com'),
		('Levinson', 'Jan', 'Female', '1970/03/02', 'levinson@dundy.com'),
		('Kapoor', 'Kelly', 'Female', '1990/01/05', 'kapoor@dundy.com'),
		('Howard', 'Ryan', 'Male', '1991/04/16', 'howard@dundy.com'),
		('Martin', 'Angela', 'Female', '1975/05/15', 'martin@dundy.com'),
		('Hannon', 'Erin', 'Female', '1991/07/17', 'hannon@dundy.com'),
		('Flax', 'Holly', 'Female', '1980/09/30', 'flax@dundy.com');

--4.2
create table Patient.patient_address(
Patient_id INT Foreign key REFERENCES Patient.patient_personal_info(Patient_id) NOT NULL, 
Patient_street CHAR(30) NOT NULL,
Patient_city CHAR(30)  NOT NULL,
Patient_state CHAR(30) NOT NULL,
Patient_zip INT  NOT NULL, 
Is_primary BIT  NOT NULL,
)

INSERT INTO Patient.patient_address(Patient_id, Patient_street, Patient_city, Patient_state, Patient_zip, Is_primary)
	VALUES 
		('1', 'St Alphonsus', 'Boston', 'Massachusetts', '02120', '1'),
		('2', 'Darling', 'Medford', 'Massachusetts', '02119', '1'),
		('3', 'Huntington', 'Boston', 'Massachusetts', '02110', '1'),
		('4', 'Westland Ave', 'Quincy', 'Massachusetts', '02010', '1'),
		('5', 'Mass Ave', 'Boston', 'Massachusetts', '02123', '1'),
		('6', 'Parker Street', 'Cambridge', 'Massachusetts', '02114', '1'),
		('7', 'Roxbury Crossing', 'Boston', 'Massachusetts', '02118', '1'),
		('8', 'Boylston Street', 'Boston', 'Massachusetts', '02109', '1'),
		('9', 'St Stephen Street', 'Providence', 'Rhode Island', '02860', '1'),
		('9', 'Ruggles street', 'Pittsburg', 'Pennsylvania', '94565', '1'),
		('10', 'Willis Street', 'Concord', 'New Hampshire', '94518', '1'),
		('11', 'Fenway Street', 'Nashua', 'New Hampshire', '03060', '1');

--4.3
create table Patient.patient_contact(
Patient_id INT Foreign key REFERENCES Patient.patient_personal_info(Patient_id) NOT NULL, 
Contact VARCHAR(10) NOT NULL,
Is_primary BIT NOT NULL
)

ALTER TABLE Patient.patient_contact
ALTER COLUMN contact Varchar(10);
INSERT INTO Patient.patient_contact(Patient_id, Contact, Is_primary)
	VALUES 
		('1', '8572509984', '1'),
		('2', '7816360022', '0'),
		('3', '9255570604', '1'),
		('4', '6178889900', '0'),
		('5', '6179990000', '1'),
		('6', '8571112345', '1'),
		('7', '6170009988', '1'),
		('8', '8574356721', '1'),
		('9', '4018889765', '1'),
		('10', '4123346789', '0'),
		('11', '6034569900', '1'),
		('12', '6039981234', '0');

--4.4
ALTER TABLE Patient.patient_pharmacy
ALTER COLUMN Pharmacy_phone_no Varchar(10);
create table Patient.patient_pharmacy(
Patient_id INT Foreign key REFERENCES Patient.patient_personal_info(Patient_id) NOT NULL, 
Pharmacy_name CHAR(25) NOT NULL,
Pharmacy_phone_no Varchar(10) NOT NULL,
Pharmacy_street CHAR(25) NOT NULL,
Pharmacy_zip INT NOT NULL,
Pharmacy_city CHAR(25) NOT NULL,
Pharmacy_state CHAR(25) NOT NULL
)

INSERT INTO Patient.patient_pharmacy(Patient_id, Pharmacy_name, Pharmacy_phone_no, Pharmacy_street, Pharmacy_zip, Pharmacy_city, Pharmacy_state)
	VALUES 
		('1', 'CVS Pharmacy', '6172666775', '1630, Tremont St', '02124', 'Boston', 'Massachusetts'),
		('2', 'Walgreens', '8572666777', '300, Longwood Ave', '02120', 'Boston', 'Massachusetts'),
		('3', 'Community Pharmacy', '6172666899', '1341, Boylston Street', '02134', 'Boston', 'Massachusetts'),
		('4', 'Walgreens', '6173566800', '231, Mass Ave', '02145', 'Boston', 'Massachusetts'),
		('5', 'CVS Pharmacy', '8573566111', '285, Columbus Ave', '02134', 'Boston', 'Massachusetts'),
		('6', 'Walgreens', '8573566945', '780, Albany St', '02156', 'Boston', 'Massachusetts'),
		('7', 'CVS Pharmacy', '6173566387', 'Brookline', '02145', 'Boston', 'Massachusetts'),
		('8', 'BriovaRx', '6173566946', '191, Stuart St', '02156', 'Boston', 'Massachusetts'),
		('9', 'Community Pharmacy', '4013566555', '2, Center Plz', '02833', 'Providence', 'Rhode Island'),
		('10', 'Walgreens', '4123566941', '21, Stanhope St', '94567', 'Pittsburg', 'Pennsylvania'),
		('11', 'Outpatient Pharmacy', '6033123321', '240, Newbury St', '03014', 'Concord', 'New Hampshire'),
		('12', 'Fenway Health Pharmacy', '6033500934', '874, Harrison Ave', '03020', 'Nashua', 'New Hampshire');

--4.5
create table Patient.patient_medication(
Patient_id INT Foreign key REFERENCES Patient.patient_personal_info(Patient_id) NOT NULL, 
Medication_name CHAR(20) NOT NULL
)

INSERT INTO Patient.patient_medication(Patient_id, Medication_name)
	VALUES 
		('1', 'Penicillin'),
		('2', 'Amoxicillin'),
		('3', 'Erythromycin'),
		('4', 'Chlorhexidine'),
		('5', 'Doxycycline'),
		('6', 'Diazepam'),
		('7', 'Clindamycin'),
		('8', 'Nystatin'),
		('9', 'Acetaminophen'),
		('10', 'Pilocarpine'),
		('11', 'Oxytetracycline'),
		('12', 'Demeclocycline');

--4.6
Create table Patient.patient_insurance(
Insurance_id INT Foreign key REFERENCES Others.insurance_lookup(Insurance_id) NOT NULL, 
Patient_id INT Foreign key REFERENCES Patient.patient_personal_info(Patient_id) NOT NULL,			
Subscriber_fname VARCHAR(25) NOT NULL,
Subscriber_Lname VARCHAR(25) NOT NULL,
primary key (Insurance_id,Patient_id)
)
Select * from Others.insurance_lookup
INSERT INTO Patient.patient_insurance(Insurance_id, Patient_id, Subscriber_Lname, Subscriber_fname)
	VALUES 
		('12', '1',  'Scott', 'Micheal'),
		('13', '2', 'Beesly', 'Daniel'),
		('14', '3', 'Dwight', 'David'),
		('15', '4', 'Halpert', 'Jonny'),
		('16', '5', 'Malone', 'Alexzander'),
		('17', '6', 'Bratton', 'Creed'),
		('18', '7', 'Levinson', 'Jan'),
		('19', '8', 'Kapoor', 'Rajeev'),
		('20', '9', 'Howard', 'Walter'),
		('21', '10', 'Martin', 'Angela'),
		('22','11', 'Hannon', 'Joanna');


--4.7
Create table Patient.patient_allergy_other(
Patient_id INT Foreign key REFERENCES Patient.patient_personal_info(Patient_id) NOT NULL, 
Allergy_name VARCHAR(25) NOT NULL
)

INSERT INTO Patient.patient_allergy_other(Patient_id, Allergy_name)
	VALUES 
		('1', 'Codeine'),
		('2', 'Darvon'),
		('3', 'Nitrous Oxide');

--5. Others
--5.1
create table Others.other_allergy_other(
Allergy_id INT PRIMARY KEY IDENTITY (1,1),
Patient_id INT Foreign key REFERENCES Patient.patient_personal_info(Patient_id) NOT NULL, 
Allergy_name VARCHAR(30) NOT NULL,
Allergy_description VARCHAR(100) NOT NULL
)

INSERT INTO Others.other_allergy_other(Patient_id, Allergy_name, Allergy_description)
	VALUES 
		('7', 'Dust', 'causes sneezing, runny nose, red eyes'),
		('8', 'Pollen', 'causes itchy throat and watery eyes'),
		('9', 'Latex', 'causes ithchy skin and hives'),
		('10', 'Lacotse', 'causes digestive problems, coughing and shortness of breath');

--5.2 
create table Others.other_symptons(
Symptom_id INT PRIMARY KEY IDENTITY (1,1),
Patient_id INT Foreign key REFERENCES Patient.patient_personal_info(Patient_id) NOT NULL, 
Symptom_name VARCHAR(30) NOT NULL
)

INSERT INTO Others.other_symptons(Patient_id, Symptom_name)
	VALUES 
		('5', 'cold and cough'),
		('6', 'Fever');

--5.3 

create table Others.insurance_lookup(
Insurance_id INT PRIMARY KEY IDENTITY (1,1),
Insurance_provider VARCHAR(30) NOT NULL,
Insurance_description varchar(200) not null
)

INSERT INTO Others.insurance_lookup(Insurance_provider,Insurance_description)
VALUES 
('United Health','Get health plans for you and your family, at every age and stage'),
('Kaiser Foundation','Filling the need for trusted information on national health issues'),
('Anthem Inc','Anthem is a leading health company dedicated to improving lives and communities, and making healthcare simple'),
('Centene Corporation','Transforming the health of the community, one person at a time'),
('Humana','Welcome to Humana, where healthcare centers around you'),
('CVS','Everything from sneezes and sprains to convenient counseling and treatments'),
('CIGNA','At Cigna, we are more than a health insurance company. We are your partner in total health and wellness.'),
('Molina Healthcare','Our comprehensive health plans provide individuals with Medicaid, Medicare, or both, quality benefits and programs.'),
('Highmark Group','Health plans for Medicare, businesses, individuals, and families.'),
('Metropolitan','With 153 years of experience, the MetLife companies are a leading innovator and a recognized leader in protection planning and retirement and savings solutions around the world'),
('Carefirst Inc.','At CareFirst BlueCross BlueShield, we have the largest network for medical, dental and vision insurance in Maryland, Washington, D.C. and Northern Virginia.')

