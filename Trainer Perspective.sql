USE Project;

-- Trainer Perspective

-- all courses the trainer is assigned to 
SELECT C.title
FROM Schedule S
JOIN Course C ON s.course_id = C.course_id
WHERE S.TR_ID = 2;

--  upcoming sessions
SELECT C.title, S.start_date, S.end_date, S.time_slot
FROM Schedule s
JOIN Course C ON S.course_id = C.course_id
WHERE S.TR_ID = 2
ORDER BY S.start_date;

--  how many trainees are enrolled in each of your courses 
SELECT C.title, COUNT(E.train_id) AS trainee_count
FROM Schedule S
JOIN Course C ON S.course_id = C.course_id
LEFT JOIN Enrollment E ON s.course_id = E.course_id
WHERE S.TR_ID = 1
GROUP BY C.title;

--  names and emails of trainees in each of your courses 
SELECT c.title, t.name AS trainee_name, t.email
FROM Schedule s
JOIN Enrollment e ON s.course_id = e.course_id
JOIN Trainee t ON e.train_id = t.train_id
JOIN Course c ON e.course_id = c.course_id
WHERE s.TR_ID = 2
ORDER BY c.title;

-- the trainer's contact info and assigned courses
SELECT tr.phone, tr.email, c.title
FROM Trainer tr
JOIN Schedule s ON tr.TR_ID = s.TR_ID
JOIN Course c ON s.course_id = c.course_id
WHERE tr.TR_ID = 1;

--  the number of courses the trainer teaches 
SELECT COUNT(DISTINCT s.course_id) AS course_count
FROM Schedule s
WHERE s.TR_ID = 2;
