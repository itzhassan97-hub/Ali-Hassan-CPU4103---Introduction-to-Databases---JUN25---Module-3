USE CrownfieldDB;

-- Create roles
CREATE ROLE 'Administrator';
CREATE ROLE 'Doctor';
CREATE ROLE 'Receptionist';

-- Assign privileges
GRANT ALL PRIVILEGES ON CrownfieldDB.* TO 'Administrator';
GRANT SELECT, INSERT, UPDATE ON CrownfieldDB.APPOINTMENT TO 'Receptionist';
GRANT SELECT, INSERT, UPDATE ON CrownfieldDB.PATIENT TO 'Receptionist';
GRANT SELECT, INSERT, UPDATE ON CrownfieldDB.DIAGNOSIS TO 'Doctor';
GRANT SELECT, INSERT, UPDATE ON CrownfieldDB.PRESCRIPTION TO 'Doctor';
GRANT SELECT, INSERT, UPDATE ON CrownfieldDB.MEDICINE_ITEM TO 'Doctor';
GRANT SELECT ON CrownfieldDB.PATIENT TO 'Doctor';

-- Create users and assign roles
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin123';
GRANT 'Administrator' TO 'admin_user'@'localhost';
SET DEFAULT ROLE 'Administrator' TO 'admin_user'@'localhost';

CREATE USER 'dr_ahmed'@'localhost' IDENTIFIED BY 'doc123';
GRANT 'Doctor' TO 'dr_ahmed'@'localhost';
SET DEFAULT ROLE 'Doctor' TO 'dr_ahmed'@'localhost';

CREATE USER 'reception_front'@'localhost' IDENTIFIED BY 'rec123';
GRANT 'Receptionist' TO 'reception_front'@'localhost';
SET DEFAULT ROLE 'Receptionist' TO 'reception_front'@'localhost';
