USE Project;

-- Trainee Perspective 

-- All available courses 
SELECT title, level, category
FROM Course;

-- beginner-level Data Science courses
SELECT title, level, category
FROM Course
WHERE level = 'Beginner' AND category = 'Data Science';

-- courses this trainee is enrolled in 
SELECT c.title
FROM Enrollment E
JOIN Course C ON e.course_id = C.course_id
WHERE E.train_id = 2;

-- view the schedule for the trainee's enrolled courses
SELECT s.start_date, s.time_slot
FROM Enrollment E
JOIN Schedule S ON e.course_id = S.course_id
WHERE E.train_id = 2;

-- how many courses the trainee is enrolled in
SELECT COUNT(*) AS course_count
FROM Enrollment
WHERE train_id = 2;

-- course titles, trainer names, and time slots the trainee is attending 
SELECT c.title, t.name AS trainer_name, s.time_slot
FROM Enrollment E
JOIN Schedule S ON e.course_id = S.course_id
JOIN Course C ON e.course_id = C.course_id
JOIN Trainer T ON s.TR_ID = T.TR_ID
WHERE E.train_id = 2;

