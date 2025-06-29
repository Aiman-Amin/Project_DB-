USE Project;

SELECT * FROM Trainee;
SELECT * FROM Trainer;
SELECT * FROM Course;
SELECT * FROM Schedule;
SELECT * FROM Enrollment;

-- Admin Perspective 

-- a new course (INSERT statement) 
INSERT INTO Course (course_id, title, category, Dhr, level)
VALUES (6, 'Data Analysis with SQL', 'Data Science', 30, 'Intermediate');

--  a new schedule for a trainer 
INSERT INTO Schedule (schedule_ID, course_id, TR_ID, start_date, end_date, time_slot) 
VALUES (6, 3, 2, '2025-08-05', '2025-08-15', 'Morning');

-- all trainee enrollments with course title and schedule info
SELECT t.name AS trainee_name, c.title AS course_title, s.start_date, s.time_slot
FROM Enrollment E
JOIN Trainee T ON e.train_id = t.train_id
JOIN Course C ON e.course_id = c.course_id
JOIN Schedule S ON e.course_id = s.course_id
ORDER BY s.start_date;

-- how many courses each trainer is assigned to 
SELECT tr.name, COUNT(DISTINCT s.course_id) AS course_count
FROM Trainer tr
LEFT JOIN Schedule s ON tr.TR_ID = s.TR_ID
GROUP BY tr.name;

-- all trainees enrolled in "Data Basics" 
SELECT t.name, t.email
FROM Enrollment e
JOIN Trainee t ON e.train_id = t.train_id
JOIN Course c ON e.course_id = c.course_id
WHERE c.title = 'Database Fundamentals';

-- course with the highest number of enrollments
SELECT TOP 1 c.title, COUNT(e.enr_ID) AS enrollment_count
FROM Course c
JOIN Enrollment e ON c.course_id = e.course_id
GROUP BY c.title
ORDER BY enrollment_count DESC;

-- all schedules sorted by start date
SELECT *
FROM Schedule
ORDER BY start_date ASC;
