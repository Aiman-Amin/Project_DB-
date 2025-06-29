CREATE Database Project;

USE Project;

CREATE TABLE Trainee (
    Train_ID INT PRIMARY KEY,
    email VARCHAR(100),
    gender char(1) check (Gender in ('M','F')),
    name VARCHAR(50),
    back_g VARCHAR(100)
);

SELECT * FROM Trainee;

INSERT INTO Trainee (train_id, name, gender, email, back_g) VALUES
(1, 'Aisha Al-Harthy', 'F', 'aisha@example.com', 'Engineering'),
(2, 'Sultan Al-Farsi', 'M', 'sultan@example.com', 'Business'),
(3, 'Mariam Al-Saadi', 'F', 'mariam@example.com', 'Marketing'),
(4, 'Omar Al-Balushi', 'M', 'omar@example.com', 'Computer Science'),
(5, 'Fatma Al-Hinai', 'F', 'fatma@example.com', 'Data Science');

CREATE TABLE Trainer (
    TR_ID INT PRIMARY KEY,
    name VARCHAR(50),
    specialty VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100)
);

SELECT * FROM Trainer

INSERT INTO Trainer (TR_ID, name, specialty, phone, email) VALUES
(1, 'Khalid Al-Maawali', 'Databases', 96891234567, 'khalid@example.com'),
(2, 'Noura Al-Kindi', 'Web Development', 96892345678, 'noura@example.com'),
(3, 'Salim Al-Harthy', 'Data Science', 96893456789, 'salim@example.com');

CREATE TABLE Course (
    course_ID INT PRIMARY KEY,
    title VARCHAR(100),
    category VARCHAR(50),
    Dhr INT,  
    level VARCHAR(50)
);;

SELECT * FROM Course

INSERT INTO Course (course_id, title, category, Dhr, level) VALUES
(1, 'Database Fundamentals', 'Databases', 20, 'Beginner'),
(2, 'Web Development Basics', 'Web', 30, 'Beginner'),
(3, 'Data Science Introduction', 'Data Science', 25, 'Intermediate'),
(4, 'Advanced SQL Queries', 'Databases', 15, 'Advanced');

CREATE TABLE Schedule (
    schedule_ID INT PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    time_slot VARCHAR(50),
    course_ID INT,
    TR_ID INT,
    FOREIGN KEY (course_ID) REFERENCES Course(course_ID),
    FOREIGN KEY (TR_ID) REFERENCES Trainer(TR_ID)
);

SELECT * FROM Schedule

INSERT INTO Schedule (schedule_ID, course_id, TR_ID, start_date, end_date, time_slot) VALUES
(1, 1, 1, '2025-07-01', '2025-07-10', 'Morning'),
(2, 2, 2, '2025-07-05', '2025-07-20', 'Evening'),
(3, 3, 3, '2025-07-10', '2025-07-25', 'Weekend'),
(4, 4, 1, '2025-07-15', '2025-07-22', 'Morning');

CREATE TABLE Enrollment (
    enr_ID INT PRIMARY KEY,
    enr_date DATE,
    Train_ID INT,
    course_ID INT,
    FOREIGN KEY (Train_ID) REFERENCES Trainee(Train_ID),
    FOREIGN KEY (course_ID) REFERENCES Course(course_ID)
);

SELECT * FROM Enrollment

INSERT INTO Enrollment (enr_ID, train_id, course_id, enr_date) VALUES
(1, 1, 1, '2025-06-01'),
(2, 2, 1, '2025-06-02'),
(3, 3, 2, '2025-06-03'),
(4, 4, 3, '2025-06-04'),
(5, 5, 3, '2025-06-05'),
(6, 1, 4, '2025-06-06');