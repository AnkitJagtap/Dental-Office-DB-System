
--What is the schedule for a dentist today?

SELECT pi.provider_id, pi.First_name, pi.Last_name, ps.Date, ps.Start_time, ps.End_time 
	FROM provider.provider_schedule ps JOIN provider.provider_info pi 
	ON ps.Provider_id = pi.provider_id 
	WHERE Date = '2021-12-20';


--What prescriptions were written last month?

SELECT p.Prescription_name,a.Appointment_date, a.Appointment_id, MONTH(a.Appointment_date) 
	FROM record.Appiontment a 
	JOIN record.prescription p on a.Appointment_id = p.Appointment_id  
	WHERE CAST(MONTH(a.Appointment_date) AS int)  < MONTH(GETDATE());



--Display the information from a patient intake form?

Select * from Patient.patient_personal_info a 
	JOIN Patient.patient_address b 
	ON a.Patient_id=b.Patient_id 
	JOIN Patient.patient_allergy_other c 
	ON a.Patient_id=c.Patient_id
	JOIN Patient.patient_contact d
	ON a.Patient_id=d.Patient_id
	JOIN Patient.patient_insurance e
	ON a.Patient_id=e.Patient_id
	JOIN Patient.patient_medication f
	ON a.Patient_id=f.Patient_id
	JOIN Patient.patient_pharmacy g
	ON a.Patient_id=g.Patient_id;

--What hours are a room open today?

Select * from Office.room r
	JOIN Record.Appiontment a
	ON r.Room_id=a.Room_id
	WHERE a.Cancelled=0 AND a.Appointment_date='2021-12-20';


--What hours are a dentist available today?


SELECT a.Appointment_id, a.Appointment_date,
	CAST(ps.Start_time AS VARCHAR) + ' - ' +
	CAST(DATEADD(MINUTE,DATEDIFF(minute,ps.Start_time, a.Start_time),ps.Start_time) AS VARCHAR) 
	+ ' , ' + 
	CAST(a.End_time AS VARCHAR) + ' - ' +
	CAST(DATEADD(MINUTE,DATEDIFF(minute,a.End_time, ps.End_time),a.End_time) AS VARCHAR) AS available_free_slots
	FROM Record.Appiontment a 
	JOIN provider.provider_schedule ps 
	ON ps.Provider_id = a.Provider_id;


