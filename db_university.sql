--1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT * 
FROM students 
WHERE YEAR(date_of_birth) = 1990;

--2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT * 
FROM `courses`
WHERE cfu > 10

--3. Selezionare tutti gli studenti che hanno più di 30 anni(3646)
SELECT * 
FROM students 
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 30;

--4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT * 
FROM `courses` 
WHERE period = 'I semestre' 
AND year = 1;

--5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT * 
FROM exams 
WHERE date = '2020-06-20' 
AND HOUR(hour) >= 14;

--6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT * 
FROM `degrees` 
WHERE level = 'magistrale';

--7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*) 
FROM `departments`;

--8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(*) 
FROM `teachers` 
WHERE phone IS NOT NULL;

--9. Inserire nella tabella degli studenti un nuovo record con i propri dati (per il campo degree_id, inserire un valore casuale)
INSERT 
INTO students (name, surname, email, date_of_birth, degree_id, enrolment_date, registration_number, fiscal_code)
VALUES ('Nazeem', 'Reth', 'cross@gmail.com','6-12-25', 7, '2024-06-26', 'vinpan', 'stalla3magia');

--10. Cambiare il numero dell’ufficio del professor Pietro Rizzo in 126
UPDATE `teachers` SET office_number=126
WHERE name='Pietro' AND surname = 'Rizzo';

--11 Eliminare dalla tabella studenti il record creato precedentemente al punto 9
DELETE FROM students 
WHERE name = 'Nazeem' AND surname = 'Reth';

--12 Selezionare tutti gli esami (appelli) con data nel futuro
SELECT * 
FROM exams 
WHERE date > CURDATE();

--13 Trovare tutti i corsi che iniziano con la lettera 'P'
SELECT * 
FROM courses 
WHERE name LIKE 'P%';

--14 Selezionare tutti gli studenti e ordinare per la data di nascita in ordine decrescente
SELECT * 
FROM students 
ORDER BY date_of_birth DESC;


--15 elimina possibili esami inseriti durante le feste invernali
DELETE 
FROM `exams` 
WHERE date BETWEEN '2020-12-21' AND '2021-01-06';