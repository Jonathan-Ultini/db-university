--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT * 
FROM students
JOIN degrees ON students.degree_id = degrees.id
WHERE degrees.name = 'corso di laurea in Economia';


--2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di
--Neuroscienze
SELECT * 
FROM students
JOIN degrees ON students.degree_id = degrees.id
WHERE degrees.name = 'Neuroscienze'; AND degrees.level='magistrale'


--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT * 
FROM course_teacher 
JOIN teachers ON course_teacher.teacher_id = teachers.id
WHERE teachers.id = 44;


--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
--sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
--nome
SELECT students.name, students.surname, degrees.name AS degree_name, departments.name AS department_name
FROM students 
JOIN degrees  ON students.degree_id = degrees.id
JOIN departments ON degrees.department_id = departments.id
ORDER BY students.surname, students.name;


--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT DISTINCT degrees.name AS degree_name, courses.name AS course_name, teachers.name AS teacher_name
FROM degrees
JOIN course_teacher
JOIN courses ON degrees.id = courses.degree_id
JOIN teachers ON course_teacher.teacher_id = teachers.id;


--6. Selezionare tutti i docenti che insegnano nel Dipartimento di
--Matematica (54)
SELECT DISTINCT teachers.*
FROM teachers 
JOIN course_teacher ON teachers.id = course_teacher.teacher_id
JOIN courses ON course_teacher.course_id = courses.id
JOIN degrees ON courses.degree_id = degrees.id
WHERE degrees.name = 'Corso di laurea in Matematica' OR degrees.name = 'Corso di laurea magistrale in Matematica';
--7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti
--per ogni esame, stampando anche il voto massimo. Successivamente,
--filtrare i tentativi con voto minimo 18.