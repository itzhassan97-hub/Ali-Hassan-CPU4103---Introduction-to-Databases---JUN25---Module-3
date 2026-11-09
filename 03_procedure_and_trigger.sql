USE CrownfieldDB;

-- ==========================================
-- Stored Procedure
-- ==========================================
DELIMITER //
CREATE PROCEDURE GetPatientHistory(IN p_PatientID VARCHAR(10))
BEGIN
    SELECT a.ApptDate, d.ConditionName, a.Notes
    FROM APPOINTMENT a
    LEFT JOIN DIAGNOSIS d ON a.AppointmentID = d.AppointmentID
    WHERE a.PatientID = p_PatientID
    ORDER BY a.ApptDate DESC;
END //
DELIMITER ;

-- Test the procedure:
-- CALL GetPatientHistory('P01');

-- ==========================================
-- Database Trigger
-- ==========================================
DELIMITER //
CREATE TRIGGER CheckFollowUpDate
BEFORE INSERT ON FOLLOW_UP
FOR EACH ROW
BEGIN
    IF NEW.DueDate < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Follow-up due date cannot be in the past.';
    END IF;
END //
DELIMITER ;
