USE SaudeConecta;

DELIMITER $$


-- ============================================================
-- TRIGGER 1
-- IMPEDE DOIS PACIENTES NO MESMO HORÁRIO PARA O MESMO MÉDICO
-- ============================================================

DROP TRIGGER IF EXISTS trg_ImpedirConflitoMedico $$

CREATE TRIGGER trg_ImpedirConflitoMedico

BEFORE INSERT ON Appointment

FOR EACH ROW

BEGIN

    IF EXISTS (

        SELECT 1

        FROM Appointment

        WHERE DoctorID = NEW.DoctorID

        AND AppointmentDate = NEW.AppointmentDate

        AND AppointmentStatus <> 'Cancelada'

    )

    THEN

        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT =
        'O médico já possui uma consulta neste horário.';

    END IF;

END $$


-- ============================================================
-- TRIGGER 2
-- IMPEDE PACIENTE DE TER DUAS CONSULTAS NO MESMO HORÁRIO
-- ============================================================

DROP TRIGGER IF EXISTS trg_ImpedirConflitoPaciente $$

CREATE TRIGGER trg_ImpedirConflitoPaciente

BEFORE INSERT ON Appointment

FOR EACH ROW

BEGIN

    IF EXISTS (

        SELECT 1

        FROM Appointment

        WHERE PatientID = NEW.PatientID

        AND AppointmentDate = NEW.AppointmentDate

        AND AppointmentStatus <> 'Cancelada'

    )

    THEN

        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT =
        'O paciente já possui uma consulta neste horário.';

    END IF;

END $$


-- ============================================================
-- TRIGGER 3
-- IMPEDE FATURA COM VALOR ZERO OU NEGATIVO
-- ============================================================

DROP TRIGGER IF EXISTS trg_ValidarValorFatura $$

CREATE TRIGGER trg_ValidarValorFatura

BEFORE INSERT ON Invoice

FOR EACH ROW

BEGIN

    IF NEW.TotalAmount <= 0

    THEN

        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT =
        'O valor da fatura deve ser maior que zero.';

    END IF;

END $$


-- ============================================================
-- TRIGGER 4
-- IMPEDE PAGAMENTO COM VALOR ZERO OU NEGATIVO
-- ============================================================

DROP TRIGGER IF EXISTS trg_ValidarValorPagamento $$

CREATE TRIGGER trg_ValidarValorPagamento

BEFORE INSERT ON Payment

FOR EACH ROW

BEGIN

    IF NEW.PaidAmount <= 0

    THEN

        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT =
        'O valor do pagamento deve ser maior que zero.';

    END IF;

END $$


-- ============================================================
-- TRIGGER 5
-- ATUALIZA FATURA PARA PAGA
-- ============================================================

DROP TRIGGER IF EXISTS trg_AtualizarStatusFatura $$

CREATE TRIGGER trg_AtualizarStatusFatura

AFTER INSERT ON Payment

FOR EACH ROW

BEGIN

    DECLARE TotalPago DECIMAL(10,2);

    DECLARE ValorFatura DECIMAL(10,2);

    SELECT TotalAmount

    INTO ValorFatura

    FROM Invoice

    WHERE InvoiceID = NEW.InvoiceID;


    SELECT COALESCE(SUM(PaidAmount), 0)

    INTO TotalPago

    FROM Payment

    WHERE InvoiceID = NEW.InvoiceID

    AND PaymentStatus = 'APROVADO';


    IF TotalPago >= ValorFatura

    THEN

        UPDATE Invoice

        SET InvoiceStatus = 'PAGA'

        WHERE InvoiceID = NEW.InvoiceID;

    END IF;

END $$


-- ============================================================
-- TRIGGER 6
-- VALIDA DATA DE VALIDADE DA RECEITA
-- ============================================================

DROP TRIGGER IF EXISTS trg_ValidarValidadeReceita $$

CREATE TRIGGER trg_ValidarValidadeReceita

BEFORE INSERT ON Prescription

FOR EACH ROW

BEGIN

    IF NEW.ValidUntill < DATE(NEW.IssueDate)

    THEN

        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT =
        'A validade da receita não pode ser anterior à data de emissão.';

    END IF;

END $$


-- ============================================================
-- TRIGGER 7
-- MÉDICO DA RECEITA DEVE SER O MESMO DA CONSULTA
-- ============================================================

DROP TRIGGER IF EXISTS trg_ValidarMedicoReceita $$

CREATE TRIGGER trg_ValidarMedicoReceita

BEFORE INSERT ON Prescription

FOR EACH ROW

BEGIN

    DECLARE MedicoConsulta INT UNSIGNED;


    SELECT DoctorID

    INTO MedicoConsulta

    FROM Appointment

    WHERE AppointmentID = NEW.AppointmentID;


    IF MedicoConsulta <> NEW.DoctorID

    THEN

        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT =
        'O médico da receita deve ser o mesmo médico da consulta.';

    END IF;

END $$


DELIMITER ;