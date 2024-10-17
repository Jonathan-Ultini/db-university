--1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(enrolment_date) AS anno_iscrizione, COUNT(*) AS numero_iscritti
FROM students
GROUP BY YEAR(enrolment_date)
ORDER BY anno_iscrizione;


--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT office_address, COUNT(*) AS numero_insegnanti
FROM teachers
GROUP BY office_address
HAVING COUNT(*) > 1;


--3. Calcolare la media dei voti di ogni appello d'esame
SELECT exam_id, AVG(vote) AS media_voti
FROM exam_student
GROUP BY exam_id;


--4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT departments.name AS department_name, COUNT(*) AS numero_corsi_laurea
FROM degrees
JOIN departments ON degrees.department_id = departments.id
GROUP BY departments.id;