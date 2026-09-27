USE SaudeConecta;

-- ============================================================
-- VIEW 1: CONSULTAS DETALHADAS
-- ============================================================

CREATE OR REPLACE VIEW vw_ConsultasDetalhadas AS

SELECT
    Appointment.AppointmentID,
    Patient.PatientName,
    Patient.CPF,
    Doctor.DoctorName,
    Doctor.CRM,
    Doctor.Specialty,
    Appointment.AppointmentDate,
    Appointment.AppointmentStatus,
    Appointment.Notes

FROM Appointment

JOIN Patient
ON Appointment.PatientID = Patient.PatientID

JOIN Doctor
ON Appointment.DoctorID = Doctor.DoctorID;


-- ============================================================
-- VIEW 2: PRÓXIMAS CONSULTAS
-- ============================================================

CREATE OR REPLACE VIEW vw_ProximasConsultas AS

SELECT
    Patient.PatientName,
    Doctor.DoctorName,
    Doctor.Specialty,
    Appointment.AppointmentDate,
    Appointment.AppointmentStatus

FROM Appointment

JOIN Patient
ON Appointment.PatientID = Patient.PatientID

JOIN Doctor
ON Appointment.DoctorID = Doctor.DoctorID

WHERE Appointment.AppointmentDate >= NOW()
AND Appointment.AppointmentStatus <> 'Cancelada';


-- ============================================================
-- VIEW 3: RESULTADOS DE EXAMES
-- ============================================================

CREATE OR REPLACE VIEW vw_ResultadosExames AS

SELECT
    Patient.PatientName,
    Doctor.DoctorName,
    Exam.ExamName,
    Exam.RequestDate,
    ExamResult.ExamValue,
    ExamResult.Result,
    ExamResult.ResultDate

FROM Exam

JOIN Appointment
ON Exam.AppointmentID = Appointment.AppointmentID

JOIN Patient
ON Appointment.PatientID = Patient.PatientID

JOIN Doctor
ON Appointment.DoctorID = Doctor.DoctorID

LEFT JOIN ExamResult
ON Exam.ExamID = ExamResult.ExamID;


-- ============================================================
-- VIEW 4: RECEITAS MÉDICAS
-- ============================================================

CREATE OR REPLACE VIEW vw_ReceitasMedicas AS

SELECT
    Prescription.PrescriptionID,
    Patient.PatientName,
    Doctor.DoctorName,
    Prescription.IssueDate,
    Prescription.ValidUntill,
    Prescription.PrescriptionStatus,
    Medication.MedicationName,
    Medication.ActiveIngredient,
    Medication.Strenght,
    Prescription_Item.Dosage,
    Prescription_Item.Quantity,
    Prescription_Item.Duration,
    Prescription_Item.RouteOfAdministration

FROM Prescription

JOIN Appointment
ON Prescription.AppointmentID = Appointment.AppointmentID

JOIN Patient
ON Appointment.PatientID = Patient.PatientID

JOIN Doctor
ON Prescription.DoctorID = Doctor.DoctorID

JOIN Prescription_Item
ON Prescription.PrescriptionID = Prescription_Item.PrescriptionID

JOIN Medication
ON Prescription_Item.MedicationID = Medication.MedicationID;


-- ============================================================
-- VIEW 5: RESUMO FINANCEIRO
-- ============================================================

CREATE OR REPLACE VIEW vw_ResumoFinanceiro AS

SELECT
    Invoice.InvoiceID,
    Patient.PatientName,
    Doctor.DoctorName,
    Doctor.Specialty,
    Invoice.TotalAmount,
    Invoice.IssueDate,
    Invoice.InvoiceStatus,

    COALESCE(
        SUM(
            CASE
                WHEN Payment.PaymentStatus = 'APROVADO'
                THEN Payment.PaidAmount
                ELSE 0
            END
        ), 0
    ) AS TotalPago

FROM Invoice

JOIN Appointment
ON Invoice.AppointmentID = Appointment.AppointmentID

JOIN Patient
ON Appointment.PatientID = Patient.PatientID

JOIN Doctor
ON Appointment.DoctorID = Doctor.DoctorID

LEFT JOIN Payment
ON Invoice.InvoiceID = Payment.InvoiceID

GROUP BY
    Invoice.InvoiceID,
    Patient.PatientName,
    Doctor.DoctorName,
    Doctor.Specialty,
    Invoice.TotalAmount,
    Invoice.IssueDate,
    Invoice.InvoiceStatus;