DROP DATABASE IF EXISTS SaudeConecta;

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS SaudeConecta
CHARACTER SET utf8mb4 -- CHARACTER SET utf8mb4: Suporta caracteres Unicode completos, incluindo emojis e acentos
COLLATE utf8mb4_unicode_ci; -- COLLATE utf8mb4_unicode_ci: Define regras de comparação case-insensitive e acento-insensitive

USE SaudeConecta;

-- ============================================================
-- TABELA: Pacientes
-- ============================================================
-- Armazena dados vinculados aos pacientes (cpf, telefone, etc.)
-- ============================================================

CREATE TABLE IF NOT EXISTS Address (

AddressID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
ZipCode VARCHAR (10),
Street VARCHAR (150),
AddressNumber VARCHAR (20),
Country VARCHAR (50),
State VARCHAR(50),
City VARCHAR(30),
Complement VARCHAR (100),

INDEX idx_address_city (City),
INDEX idx_address_state (State),
INDEX idx_address_country (Country),
INDEX idx_address_number (AddressNumber)


)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- TABELA: Doutores
-- ============================================================
-- Armazena dados essenciais dos médicos (CRM, especialidade, etc..)
-- ============================================================

CREATE TABLE IF NOT EXISTS Doctor (

DoctorID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
DoctorName VARCHAR (120) NOT NULL,

-- Número de registro que o profissional recebe desse conselho para poder atender legalmente
CRM VARCHAR (20) NOT NULL UNIQUE,
Specialty VARCHAR (100) NOT NULL,
Phone VARCHAR (20) NOT NULL,

INDEX idx_doctor_specialty (Specialty) --  Acelera buscas de doutores com filtros em especialidades


) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Medication (

MedicationID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
MedicationName VARCHAR (120),
ActiveIngredient VARCHAR (120),
Strenght VARCHAR (20),

INDEX idx_strenght (Strenght), -- Acelera buscas em medicamentos com filtro em  força
INDEX idx_medication_name (MedicationName) -- Acelera buscas de medicamentos comm filtros de nomes especificos.

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS Patient (

-- Chave primária auto incrementada do paciente
-- Unsigned: usado para armazenar somente valores POSITIVOS, puxa menos memória.
PatientID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
AddressID INT UNSIGNED,

PatientName VARCHAR (120) NOT NULL,
CPF VARCHAR (14) NOT NULL UNIQUE,
BirthDate DATE NOT NULL,
Phone VARCHAR (20) NOT NULL ,
Email VARCHAR (120) NOT NULL UNIQUE,

CONSTRAINT fk_patient_addressid FOREIGN KEY (AddressID) REFERENCES Address (AddressID),

INDEX idx_cpf_patient (CPF), -- Acelera buscas de pacientes com filtros em CPF
INDEX idx_email_patient (Email), -- Acelera buscas de pacientes com filtro em Email
INDEX idx_birth_date (BirthDate) --  Acelera buscas de pacientes com filtro em data de nascimento

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS AvaibleSlot (

SlotID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
DoctorID INT UNSIGNED NOT NULL,
DayOfWeek VARCHAR(15),
StartTime TIME,
EndTime TIME,

CONSTRAINT fk_avaibleslot_doctorid FOREIGN KEY (DoctorID) REFERENCES Doctor (DoctorID)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Appointment (

AppointmentID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
PatientID INT UNSIGNED NOT NULL,
DoctorID INT UNSIGNED NOT NULL,
AppointmentDate DATETIME,
AppointmentStatus ENUM('Agendada','Confirmada','Em andamento','Concluída','Cancelada','Não compareceu') NOT NULL DEFAULT 'Agendada',
Notes TEXT,

CONSTRAINT fk_appointment_patientid FOREIGN KEY (PatientID) REFERENCES Patient (PatientID),
CONSTRAINT fk_appointment_doctorid FOREIGN KEY (DoctorID) REFERENCES Doctor (DoctorID),

INDEX idx_appointment_status (AppointmentStatus),
INDEX idx_appointment_date (AppointmentDate)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Exam (

ExamID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
AppointmentID INT UNSIGNED NOT NULL,
ExamName VARCHAR (120),
RequestDate DATETIME,

CONSTRAINT fk_exam_appointmentid FOREIGN KEY (AppointmentID) REFERENCES Appointment (AppointmentID),

INDEX idx_exam_name (ExamName),
INDEX idx_request_date (RequestDate)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS ExamResult (

ExamResultID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
ExamID INT UNSIGNED NOT NULL,
ExamValue VARCHAR (100) NOT NULL,
Result TEXT,
ResultDate DATETIME,

CONSTRAINT fk_examresult_examid FOREIGN KEY (ExamID) REFERENCES Exam (ExamID) 
ON DELETE CASCADE, -- Comando utilizado para apagar todos os registros filhos caso o registro pai seja apagado  primeiro.

INDEX idx_result (Result(191)),
INDEX idx_examvalue (ExamValue)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Schedule (

ScheduleID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
DoctorID INT UNSIGNED NOT NULL,
PatientID INT UNSIGNED NOT NULL,
ScheduleDate DATETIME,

CONSTRAINT fk_schedule_doctorid FOREIGN KEY (DoctorID) REFERENCES Doctor (DoctorID),
CONSTRAINT fk_schedule_patientid FOREIGN KEY (PatientID) REFERENCES Patient (PatientID),

INDEX idx_schedule_date (ScheduleDate)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Invoice (

InvoiceID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
AppointmentID INT UNSIGNED NOT NULL,
TotalAmount DECIMAL(10,2),
IssueDate DATETIME,
InvoiceStatus VARCHAR(20),

CONSTRAINT fk_invoice_appoimentid FOREIGN KEY (AppointmentID) REFERENCES Appointment (AppointmentID),

INDEX idx_invoice_status (InvoiceStatus), --  Acelera filtros de busca por status de fatura (invoice)
INDEX idx_issue_date (IssueDate) -- Acelera busca de filtros por data de emissão


) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Payment (

PaymentID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
InvoiceID INT UNSIGNED NOT NULL,
PaidAmount DECIMAL(10,2),
PaymentMethod VARCHAR(30),
PaymentDate DATETIME,
PaymentStatus ENUM('APROVADO', 'RECUSADO', 'EM ANÁLISE', 'CANCELADO'),

CONSTRAINT fk_payment_invoiceid FOREIGN KEY (InvoiceID) REFERENCES Invoice (InvoiceID),

INDEX idx_payment_status (PaymentStatus),  -- Índice no campo status do pagamento - acelera filtros por tipo de pagamento
INDEX idx_paid_amount (PaidAmount) -- Índice no valor do pagamento - acelera filtros por tipo de valor de pagamento


) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Prescription (

PrescriptionID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
AppointmentID INT UNSIGNED NOT NULL,
DoctorID INT UNSIGNED NOT NULL,
IssueDate DATETIME,
Notes  Text,
ValidUntill DATE,
PrescriptionStatus VARCHAR(20),

CONSTRAINT fk_prescription_appointmentid FOREIGN KEY (AppointmentID) REFERENCES Appointment (AppointmentID),
 CONSTRAINT fk_prescription_doctorid FOREIGN KEY (DoctorID) REFERENCES Doctor (DoctorID),

INDEX idx_prescription_issuedate (IssueDate), -- Acelera a consulta com filtros de data de emissão
INDEX idx_valid_untill (ValidUntill) 

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Prescription_Item (

PrescriptionItemID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
PrescriptionID INT UNSIGNED NOT NULL,
MedicationID INT UNSIGNED NOT NULL,
Dosage VARCHAR(50),
Quantity VARCHAR(50),
Duration VARCHAR(50),
RouteOfAdministration VARCHAR(50),
Notes Text,

CONSTRAINT fk_prescriptionI_prescriptionid FOREIGN KEY (PrescriptionID) REFERENCES Prescription (PrescriptionID) 
ON DELETE CASCADE, -- Comando utilizado para apagar todos os registros filhos caso o registro pai seja apagado  primeiro.

CONSTRAINT fk_prescription_medicationid FOREIGN KEY (MedicationID) REFERENCES Medication (MedicationID),

INDEX idx_duration (Duration),
INDEX idx_dosage (Dosage)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS Contact (

ContactID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
PatientID INT UNSIGNED NOT NULL,
DoctorID INT UNSIGNED NOT NULL,
ContactType VARCHAR(30), -- ex: 'Médico de Referência', 'Emergência'

CONSTRAINT fk_contact_patientid FOREIGN KEY (PatientID) REFERENCES Patient (PatientID),
CONSTRAINT fk_contact_doctorid FOREIGN KEY (DoctorID) REFERENCES Doctor (DoctorID)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






