/* 1. Busca Múltipla: Liste o nome do paciente, a data da consulta, o nome do médico e a
especialidade, apenas para consultas realizadas no ano atual. */

SELECT PATIENTNAME AS 'Nome do paciente', DoctorName AS 'Nome do medico',
appointmentdate AS 'Data da consulta', specialty AS 'Especialidade'

FROM Patient 
JOIN Appointment ON  Appointment.patientid = Patient.patientid
JOIN Doctor ON Appointment.doctorid = Doctor.doctorid

WHERE YEAR (Appointment.appointmentdate) = 2026;


/*2. Agregação: Qual é o total de receita (valor das consultas) gerado por cada especialidade
médica? Ordene da maior para a menor. */

SELECT SUM(totalamount) AS 'Receita Total', specialty AS 'Especialidade' 
FROM Doctor
JOIN Appointment ON Doctor.doctorid = Appointment.doctorid
JOIN Invoice ON Appointment.appointmentid = Invoice.appointmentid
GROUP BY Doctor.specialty
ORDER BY SUM(totalamount) DESC;


/* 3. Left Join: Mostre o nome de todos os médicos e, caso tenham consultas agendadas, mostre
a data. Médicos sem consultas também devem aparecer na lista. */

SELECT Doctorname AS 'Nome do Medico', appointmentdate AS 'Data da Consulta'
FROM Doctor 
LEFT JOIN Appointment ON Doctor.doctorid = Appointment.doctorid;