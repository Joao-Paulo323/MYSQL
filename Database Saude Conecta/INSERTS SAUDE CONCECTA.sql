USE SaudeConecta;

-- ============================================================
-- 1. ENDEREÇOS
-- ============================================================

INSERT INTO Address
(ZipCode, Street, AddressNumber, Country, State, City, Complement)
VALUES
('30130-110', 'Rua da Bahia', '1200', 'Brasil', 'Minas Gerais', 'Belo Horizonte', 'Apto 402'),
('31270-901', 'Avenida Presidente Antônio Carlos', '6627', 'Brasil', 'Minas Gerais', 'Belo Horizonte', 'Apto 203'),
('30310-760', 'Avenida do Contorno', '5800', 'Brasil', 'Minas Gerais', 'Belo Horizonte', 'Bloco B, Apto 301'),
('30510-000', 'Rua Úrsula Paulino', '850', 'Brasil', 'Minas Gerais', 'Belo Horizonte', NULL),
('31710-400', 'Avenida Cristiano Machado', '9200', 'Brasil', 'Minas Gerais', 'Belo Horizonte', 'Casa 2'),
('31560-260', 'Rua Padre Pedro Pinto', '1450', 'Brasil', 'Minas Gerais', 'Belo Horizonte', 'Apto 104'),
('30260-070', 'Rua Pouso Alegre', '730', 'Brasil', 'Minas Gerais', 'Belo Horizonte', NULL),
('30640-000', 'Avenida Amazonas', '7500', 'Brasil', 'Minas Gerais', 'Belo Horizonte', 'Apto 502'),
('31330-000', 'Avenida Fleming', '450', 'Brasil', 'Minas Gerais', 'Belo Horizonte', 'Casa'),
('30421-169', 'Rua Platina', '650', 'Brasil', 'Minas Gerais', 'Belo Horizonte', 'Apto 302');


-- ============================================================
-- 2. MÉDICOS
-- ============================================================

INSERT INTO Doctor
(DoctorName, CRM, Specialty, Phone)
VALUES
('Dr. Ricardo Almeida Costa', 'CRM-MG 48231', 'Cardiologia', '(31) 98821-4501'),
('Dra. Mariana Ferreira Lima', 'CRM-MG 51742', 'Pediatria', '(31) 99134-7822'),
('Dr. Gustavo Henrique Martins', 'CRM-MG 45398', 'Ortopedia', '(31) 98452-1190'),
('Dra. Camila Rodrigues Souza', 'CRM-MG 58921', 'Dermatologia', '(31) 99741-3312'),
('Dr. Felipe Mendes Oliveira', 'CRM-MG 60114', 'Clínica Geral', '(31) 98321-6445'),
('Dra. Juliana Castro Ribeiro', 'CRM-MG 55209', 'Ginecologia', '(31) 99254-8107');


-- ============================================================
-- 3. MEDICAMENTOS
-- ============================================================

INSERT INTO Medication
(MedicationName, ActiveIngredient, Strenght)
VALUES
('Losartana Potássica', 'Losartana Potássica', '50 mg'),
('Dipirona Monoidratada', 'Dipirona', '500 mg'),
('Amoxicilina', 'Amoxicilina', '500 mg'),
('Ibuprofeno', 'Ibuprofeno', '400 mg'),
('Omeprazol', 'Omeprazol', '20 mg'),
('Loratadina', 'Loratadina', '10 mg'),
('Paracetamol', 'Paracetamol', '750 mg'),
('Azitromicina', 'Azitromicina', '500 mg'),
('Metformina', 'Cloridrato de Metformina', '500 mg'),
('Prednisona', 'Prednisona', '20 mg');


-- ============================================================
-- 4. PACIENTES
-- ============================================================

INSERT INTO Patient
(AddressID, PatientName, CPF, BirthDate, Phone, Email)
VALUES
(1, 'Lucas Henrique Barbosa', '123.456.789-10', '1998-03-14', '(31) 99821-4512', 'lucas.barbosa@example.com'),
(2, 'Ana Clara Fernandes', '234.567.890-21', '2001-07-22', '(31) 99124-8536', 'ana.fernandes@example.com'),
(3, 'Gabriel Augusto Moreira', '345.678.901-32', '1985-11-08', '(31) 98741-5621', 'gabriel.moreira@example.com'),
(4, 'Beatriz Mendes Rocha', '456.789.012-43', '1994-05-19', '(31) 99563-7410', 'beatriz.rocha@example.com'),
(5, 'Pedro Henrique Dias', '567.890.123-54', '1976-09-03', '(31) 98214-9635', 'pedro.dias@example.com'),
(6, 'Mariana Alves Ribeiro', '678.901.234-65', '2005-12-17', '(31) 99635-1208', 'mariana.ribeiro@example.com'),
(7, 'João Victor Carvalho', '789.012.345-76', '1989-01-25', '(31) 98421-7789', 'joao.carvalho@example.com'),
(8, 'Larissa Gomes Martins', '890.123.456-87', '1997-08-30', '(31) 99331-5627', 'larissa.martins@example.com'),
(9, 'Carlos Eduardo Ferreira', '901.234.567-98', '1968-04-11', '(31) 98875-3214', 'carlos.ferreira@example.com'),
(10, 'Isabela Cristina Souza', '012.345.678-09', '2002-06-15', '(31) 99788-6431', 'isabela.souza@example.com');


-- ============================================================
-- 5. HORÁRIOS DISPONÍVEIS DOS MÉDICOS
-- ============================================================

INSERT INTO AvaibleSlot
(DoctorID, DayOfWeek, StartTime, EndTime)
VALUES
(1, 'Segunda-feira', '08:00:00', '12:00:00'),
(1, 'Quarta-feira', '13:00:00', '17:00:00'),

(2, 'Terça-feira', '08:00:00', '12:00:00'),
(2, 'Quinta-feira', '13:00:00', '18:00:00'),

(3, 'Segunda-feira', '13:00:00', '18:00:00'),
(3, 'Sexta-feira', '08:00:00', '12:00:00'),

(4, 'Terça-feira', '09:00:00', '17:00:00'),
(4, 'Quinta-feira', '09:00:00', '17:00:00'),

(5, 'Segunda-feira', '08:00:00', '18:00:00'),
(5, 'Quarta-feira', '08:00:00', '18:00:00'),
(5, 'Sexta-feira', '08:00:00', '16:00:00'),

(6, 'Terça-feira', '08:00:00', '16:00:00'),
(6, 'Quinta-feira', '08:00:00', '16:00:00');


-- ============================================================
-- 6. CONSULTAS
-- ============================================================

INSERT INTO Appointment
(PatientID, DoctorID, AppointmentDate, AppointmentStatus, Notes)
VALUES

-- Consultas já realizadas
(1, 5, '2026-07-15 09:00:00', 'Concluída',
 'Paciente apresentou dor abdominal e desconforto após refeições.'),

(3, 1, '2026-07-20 10:00:00', 'Concluída',
 'Paciente relatou episódios de pressão arterial elevada.'),

(5, 1, '2026-07-27 11:00:00', 'Concluída',
 'Consulta de acompanhamento cardiológico.'),

(6, 4, '2026-08-04 14:00:00', 'Concluída',
 'Paciente apresentou irritação e manchas avermelhadas na pele.'),

(9, 5, '2026-08-07 08:30:00', 'Concluída',
 'Paciente relatou fadiga frequente e aumento da sede.'),

-- Não compareceu
(7, 3, '2026-08-10 15:00:00', 'Não compareceu',
 'Paciente não compareceu à consulta agendada.'),

-- Consulta do dia
(2, 5, '2026-08-12 14:00:00', 'Confirmada',
 'Consulta para avaliação de sintomas gripais.'),

-- Consultas futuras
(4, 4, '2026-08-13 10:00:00', 'Confirmada',
 'Avaliação dermatológica de rotina.'),

(8, 6, '2026-08-13 13:30:00', 'Agendada',
 'Consulta ginecológica de rotina.'),

(10, 2, '2026-08-18 09:30:00', 'Agendada',
 'Avaliação clínica de rotina.'),

(1, 1, '2026-08-19 14:00:00', 'Agendada',
 'Avaliação cardiológica preventiva.'),

(3, 3, '2026-08-21 09:00:00', 'Agendada',
 'Paciente relata dores recorrentes no joelho direito.'),

(5, 1, '2026-08-24 08:30:00', 'Agendada',
 'Retorno cardiológico para avaliação dos exames.'),

(6, 4, '2026-08-25 11:00:00', 'Agendada',
 'Retorno para avaliação do tratamento dermatológico.'),

(9, 5, '2026-08-26 10:00:00', 'Agendada',
 'Retorno para análise dos exames laboratoriais.');


-- ============================================================
-- 7. EXAMES SOLICITADOS
-- ============================================================

INSERT INTO Exam
(AppointmentID, ExamName, RequestDate)
VALUES
(2, 'Eletrocardiograma', '2026-07-20 10:30:00'),
(2, 'Hemograma Completo', '2026-07-20 10:35:00'),

(3, 'Ecocardiograma', '2026-07-27 11:30:00'),
(3, 'Perfil Lipídico', '2026-07-27 11:35:00'),

(4, 'Teste Alérgico', '2026-08-04 14:30:00'),

(5, 'Glicemia em Jejum', '2026-08-07 09:00:00'),
(5, 'Hemoglobina Glicada', '2026-08-07 09:05:00'),

(12, 'Radiografia do Joelho Direito', '2026-08-21 09:30:00');


-- ============================================================
-- 8. RESULTADOS DOS EXAMES
-- ============================================================

INSERT INTO ExamResult
(ExamID, ExamValue, Result, ResultDate)
VALUES
(1,
 'Ritmo sinusal',
 'Eletrocardiograma sem alterações significativas. Frequência cardíaca dentro dos parâmetros esperados.',
 '2026-07-21 14:20:00'),

(2,
 'Hemoglobina: 14,2 g/dL',
 'Hemograma dentro dos valores de referência, sem sinais laboratoriais de anemia ou infecção.',
 '2026-07-21 15:10:00'),

(3,
 'FEVE: 64%',
 'Função sistólica preservada. Cavidades cardíacas com dimensões normais.',
 '2026-07-30 10:40:00'),

(4,
 'LDL: 148 mg/dL',
 'Colesterol LDL acima do valor recomendado. Orientado acompanhamento clínico e mudanças alimentares.',
 '2026-07-28 09:20:00'),

(5,
 'Reação moderada',
 'Teste apresentou sensibilidade moderada a ácaros e poeira doméstica.',
 '2026-08-05 16:30:00'),

(6,
 '126 mg/dL',
 'Glicemia de jejum acima do intervalo considerado normal. Recomenda-se investigação complementar.',
 '2026-08-08 10:15:00'),

(7,
 '6,7%',
 'Hemoglobina glicada elevada. Resultado deve ser avaliado pelo médico responsável.',
 '2026-08-08 10:30:00');


-- ============================================================
-- 9. AGENDA / SCHEDULE
-- ============================================================

INSERT INTO Schedule
(DoctorID, PatientID, ScheduleDate)
VALUES
(4, 4, '2026-08-13 10:00:00'),
(6, 8, '2026-08-13 13:30:00'),
(2, 10, '2026-08-18 09:30:00'),
(1, 1, '2026-08-19 14:00:00'),
(3, 3, '2026-08-21 09:00:00'),
(1, 5, '2026-08-24 08:30:00'),
(4, 6, '2026-08-25 11:00:00'),
(5, 9, '2026-08-26 10:00:00');


-- ============================================================
-- 10. FATURAS
-- ============================================================

INSERT INTO Invoice
(AppointmentID, TotalAmount, IssueDate, InvoiceStatus)
VALUES
(1, 180.00, '2026-07-15 09:45:00', 'PAGA'),
(2, 350.00, '2026-07-20 11:00:00', 'PAGA'),
(3, 300.00, '2026-07-27 12:00:00', 'PAGA'),
(4, 220.00, '2026-08-04 15:00:00', 'PAGA'),
(5, 190.00, '2026-08-07 09:30:00', 'PENDENTE'),
(8, 220.00, '2026-08-11 16:00:00', 'PENDENTE'),
(9, 280.00, '2026-08-11 16:10:00', 'PENDENTE');


-- ============================================================
-- 11. PAGAMENTOS
-- ============================================================

INSERT INTO Payment
(InvoiceID, PaidAmount, PaymentMethod, PaymentDate, PaymentStatus)
VALUES
(1, 180.00, 'PIX', '2026-07-15 09:50:00', 'APROVADO'),

(2, 350.00, 'Cartão de Crédito', '2026-07-20 11:05:00', 'APROVADO'),

(3, 300.00, 'PIX', '2026-07-27 12:05:00', 'APROVADO'),

(4, 220.00, 'Cartão de Débito', '2026-08-04 15:10:00', 'APROVADO'),

-- Pagamento recusado
(5, 190.00, 'Cartão de Crédito', '2026-08-07 09:40:00', 'RECUSADO'),

-- Pagamento aguardando processamento
(6, 220.00, 'PIX', '2026-08-12 09:30:00', 'EM ANÁLISE');


-- ============================================================
-- 12. RECEITAS MÉDICAS
-- ============================================================

INSERT INTO Prescription
(AppointmentID, DoctorID, IssueDate, Notes, ValidUntill, PrescriptionStatus)
VALUES

(1, 5,
 '2026-07-15 09:30:00',
 'Uso conforme orientação médica. Retornar caso os sintomas persistam.',
 '2026-08-15',
 'Ativa'),

(2, 1,
 '2026-07-20 10:40:00',
 'Manter acompanhamento da pressão arterial.',
 '2026-10-20',
 'Ativa'),

(3, 1,
 '2026-07-27 11:40:00',
 'Uso contínuo. Não interromper sem orientação médica.',
 '2026-10-27',
 'Ativa'),

(4, 4,
 '2026-08-04 14:40:00',
 'Evitar contato com substâncias que possam provocar irritação.',
 '2026-09-04',
 'Ativa'),

(5, 5,
 '2026-08-07 09:15:00',
 'Aguardar resultado dos exames antes de qualquer alteração na medicação.',
 '2026-09-07',
 'Ativa');


-- ============================================================
-- 13. ITENS DAS RECEITAS
-- ============================================================

INSERT INTO Prescription_Item
(PrescriptionID, MedicationID, Dosage, Quantity, Duration,
 RouteOfAdministration, Notes)
VALUES

-- Receita 1
(1, 5, '20 mg', '14 cápsulas', '14 dias',
 'Oral', 'Tomar 1 cápsula pela manhã em jejum.'),

-- Receita 2
(2, 1, '50 mg', '30 comprimidos', '30 dias',
 'Oral', 'Tomar 1 comprimido uma vez ao dia.'),

-- Receita 3
(3, 1, '50 mg', '60 comprimidos', '60 dias',
 'Oral', 'Tomar 1 comprimido diariamente no mesmo horário.'),

-- Receita 4
(4, 6, '10 mg', '10 comprimidos', '10 dias',
 'Oral', 'Tomar 1 comprimido à noite.'),

(4, 10, '20 mg', '5 comprimidos', '5 dias',
 'Oral', 'Tomar somente conforme orientação médica.'),

-- Receita 5
(5, 9, '500 mg', '60 comprimidos', '30 dias',
 'Oral', 'Tomar junto às refeições conforme orientação médica.');


-- ============================================================
-- 14. CONTATOS MÉDICOS DOS PACIENTES
-- ============================================================

INSERT INTO Contact
(PatientID, DoctorID, ContactType)
VALUES
(1, 5, 'Médico de Referência'),
(3, 1, 'Médico de Referência'),
(5, 1, 'Cardiologista'),
(6, 4, 'Dermatologista'),
(9, 5, 'Médico de Referência'),
(8, 6, 'Ginecologista'),
(10, 2, 'Médico de Referência');