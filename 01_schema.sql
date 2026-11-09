CREATE DATABASE CrownfieldDB;
USE CrownfieldDB;

-- 1. Creating PATIENT Table
CREATE TABLE PATIENT (
    PatientID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Postcode VARCHAR(15) NOT NULL
);

-- 2. Creating SPECIALTY Table
CREATE TABLE SPECIALTY (
    SpecialtyID VARCHAR(10) PRIMARY KEY,
    SpecialtyName VARCHAR(100) NOT NULL
);

-- 3. Creating CLINIC Table
CREATE TABLE CLINIC (
    ClinicID VARCHAR(10) PRIMARY KEY,
    ClinicName VARCHAR(100) NOT NULL
);

-- 4. Creating CLINICIAN Table
CREATE TABLE CLINICIAN (
    ClinicianID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    SpecialtyID VARCHAR(10),
    FOREIGN KEY (SpecialtyID) REFERENCES SPECIALTY(SpecialtyID)
);

-- 5. Creating APPOINTMENT Table
CREATE TABLE APPOINTMENT (
    AppointmentID VARCHAR(10) PRIMARY KEY,
    PatientID VARCHAR(10),
    ClinicianID VARCHAR(10),
    ClinicID VARCHAR(10),
    ApptDate DATE,
    ApptTime TIME,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES PATIENT(PatientID),
    FOREIGN KEY (ClinicianID) REFERENCES CLINICIAN(ClinicianID),
    FOREIGN KEY (ClinicID) REFERENCES CLINIC(ClinicID)
);

-- 6. Creating DIAGNOSIS Table
CREATE TABLE DIAGNOSIS (
    DiagnosisID VARCHAR(10) PRIMARY KEY,
    AppointmentID VARCHAR(10),
    ConditionName VARCHAR(100) NOT NULL,
    FOREIGN KEY (AppointmentID) REFERENCES APPOINTMENT(AppointmentID)
);

-- 7. Creating PRESCRIPTION Table
CREATE TABLE PRESCRIPTION (
    PrescriptionID VARCHAR(10) PRIMARY KEY,
    AppointmentID VARCHAR(10),
    FOREIGN KEY (AppointmentID) REFERENCES APPOINTMENT(AppointmentID)
);

-- 8. Creating MEDICINE_ITEM Table
CREATE TABLE MEDICINE_ITEM (
    MedicineItemID VARCHAR(10) PRIMARY KEY,
    PrescriptionID VARCHAR(10),
    MedicineName VARCHAR(100) NOT NULL,
    Dose VARCHAR(50),
    Route VARCHAR(50),
    Frequency VARCHAR(50),
    Duration VARCHAR(50),
    FOREIGN KEY (PrescriptionID) REFERENCES PRESCRIPTION(PrescriptionID)
);

-- 9. Creating FOLLOW_UP Table
CREATE TABLE FOLLOW_UP (
    FollowUpID VARCHAR(10) PRIMARY KEY,
    AppointmentID VARCHAR(10),
    DueDate DATE,
    Priority VARCHAR(20),
    Status VARCHAR(20),
    FOREIGN KEY (AppointmentID) REFERENCES APPOINTMENT(AppointmentID)
);

-- 1. Inserting data into PATIENT table
INSERT INTO PATIENT (PatientID, Name, Postcode) VALUES
('P01', 'Amina Yusuf', 'LHR-01'),
('P02', 'Daniel Reed', 'ISB-02'),
('P03', 'Sarah Jones', 'KHI-03');

-- 2. Inserting data into SPECIALTY table
INSERT INTO SPECIALTY (SpecialtyID, SpecialtyName) VALUES
('S01', 'General Ophthalmology'),
('S02', 'Retina Specialist'),
('S03', 'Glaucoma Department');

-- 3. Inserting data into CLINIC table
INSERT INTO CLINIC (ClinicID, ClinicName) VALUES
('C01', 'Crownfield Main Campus'),
('C02', 'City Center Branch');

-- 4. Inserting data into CLINICIAN table
INSERT INTO CLINICIAN (ClinicianID, Name, SpecialtyID) VALUES
('D01', 'Dr. Ahmed Raza', 'S01'),
('D02', 'Dr. Fatima Ali', 'S02'),
('D03', 'Dr. John Smith', 'S03');

-- 5. Inserting data into APPOINTMENT table
INSERT INTO APPOINTMENT (AppointmentID, PatientID, ClinicianID, ClinicID, ApptDate, ApptTime, Notes) VALUES
('A01', 'P01', 'D01', 'C01', '2026-11-10', '09:00:00', 'Routine checkup'),
('A02', 'P02', 'D02', 'C02', '2026-11-11', '10:30:00', 'Vision blurriness reported'),
('A03', 'P03', 'D03', 'C01', '2026-11-12', '14:00:00', 'Glaucoma screening');

-- 6. Inserting data into DIAGNOSIS table
INSERT INTO DIAGNOSIS (DiagnosisID, AppointmentID, ConditionName) VALUES
('DG01', 'A01', 'Myopia'),
('DG02', 'A02', 'Diabetic Retinopathy'),
('DG03', 'A03', 'Normal Vision');

-- 7. Inserting data into PRESCRIPTION table
INSERT INTO PRESCRIPTION (PrescriptionID, AppointmentID) VALUES
('PR01', 'A01'),
('PR02', 'A02'); 
-- (Appointment A03 ke liye medicine nahi di, jo hamari assumption ko support karta hai)

-- 8. Inserting data into MEDICINE_ITEM table
INSERT INTO MEDICINE_ITEM (MedicineItemID, PrescriptionID, MedicineName, Dose, Route, Frequency, Duration) VALUES
('M01', 'PR01', 'Artificial Tears', '1 Drop', 'Ocular', 'Twice daily', '1 Month'),
('M02', 'PR02', 'Anti-VEGF Injection', '1 Vial', 'Intravitreal', 'Once', '1 Day'),
('M03', 'PR01', 'Vitamin A Supplements', '1 Pill', 'Oral', 'Once daily', '2 Months');

-- 9. Inserting data into FOLLOW_UP table
INSERT INTO FOLLOW_UP (FollowUpID, AppointmentID, DueDate, Priority, Status) VALUES
('F01', 'A01', '2027-05-10', 'Low', 'Scheduled'),
('F02', 'A02', '2026-12-11', 'High', 'Pending');
