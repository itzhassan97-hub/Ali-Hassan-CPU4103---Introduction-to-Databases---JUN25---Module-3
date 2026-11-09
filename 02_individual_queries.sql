USE CrownfieldDB;

-- Query 1: Aggregate function with GROUP BY and HAVING
SELECT c.ClinicName, COUNT(a.AppointmentID) AS TotalAppointments
FROM CLINIC c
JOIN APPOINTMENT a ON c.ClinicID = a.ClinicID
GROUP BY c.ClinicName
HAVING COUNT(a.AppointmentID) >= 1;

-- Query 2: INNER JOIN combining three tables
SELECT p.Name AS PatientName, a.ApptDate, cl.Name AS DoctorName
FROM PATIENT p
INNER JOIN APPOINTMENT a ON p.PatientID = a.PatientID
INNER JOIN CLINICIAN cl ON a.ClinicianID = cl.ClinicianID;

-- Query 3: LEFT OUTER JOIN
SELECT a.AppointmentID, a.ApptDate, p.PrescriptionID
FROM APPOINTMENT a
LEFT JOIN PRESCRIPTION p ON a.AppointmentID = p.AppointmentID;

-- Query 4: Subquery / Nested Query
SELECT Name, Postcode 
FROM PATIENT 
WHERE PatientID IN (
    SELECT PatientID 
    FROM APPOINTMENT 
    WHERE ClinicID = 'C01'
);
