
INSERT INTO person (id, personal_number, first_name, last_name, phone_number, home_address, email)
VALUES
(1, '212106534071', 'Cyrus', 'Ingram', '0800 853637', '520–4193 Mollis. Road', 'dui.fusce.aliquam@outlook.ca'),
(2, '373037152362', 'Sacha', 'Tran', '0800 140129', '9373 Tellus Rd.', 'per.inceptos@outlook.org'),
(3, '282994200606', 'Lamar', 'Hendrix', '0800 346779', 'Ap #853–7437 Nunc Street', 'amet.luctus@aol.edu'),
(4, '285379934017', 'Jesse', 'Newman', '0800 548137', '537–3006 Curabitur St.', 'nascetur.ridiculus@yahoo.couk'),
(5, '267433804123', 'Sybill', 'Mckay', '0800 321534', 'Ap #574–1549 Consectetuer Rd.', 'dolor.dapibus@protonmail.ca');

INSERT INTO department (id, department_name, manager_id)
VALUES
(1, 'Computer Science',        100),
(2, 'Information Technology',  101),
(3, 'Mathematics',             102),
(4, 'Electrical Engineering',  103),
(5, 'Data Analytics',          104);


INSERT INTO employee (id, employment_id, skill_set, salary, job_title, department_id, person_id)
VALUES
(11, 200, 'SQL',              25385, 'Lecturer',            1, 1), --employee needs to point to correct person
(12, 201, 'Java',             20789, 'Senior Lecturer',     2, 2),
(13, 202, 'Python',           26899, 'Assistant Professor', 3, 3),
(14, 203, 'Data Analysis',    28314, 'Course Coordinator',  4, 4),
(15, 204, 'Machine Learning', 25844, 'Research Instructor', 5, 5);

INSERT INTO course_layout (id, course_code, course_name, min_students, max_students, hp)
VALUES
(16, 'IV1351', 'Data Storage Paradigms',      20, 120, 7.5),
(17, 'IX1500', 'Introduction to Programming', 30, 200, 7.5),
(18, 'ID2214', 'Advanced Machine Learning',   15, 150, 7.5),
(19, 'IV1350', 'Algorithms and Data Structures', 25, 180, 7.5),
(20, 'DD1337', 'Programming Paradigms',       20, 160, 6.0);

INSERT INTO course_instance (id, instance_id, num_students, study_period, study_year, course_layout_id)
VALUES
(21, '2025-50273', 120, 'P2', '2025', 16),  
(22, '2025-50413', 180, 'P1', '2025', 17),   
(23, '2025-50341', 90,  'P2', '2025', 18),  
(24, '2025-60104', 160, 'P3', '2025', 19),   
(25, '2025-50999', 140, 'P4', '2025', 20);   

INSERT INTO teaching_activity (id, activity_name, factor)
VALUES
(1, 'Lecture', 3.6),
(2, 'Lab', 2.4),
(3, 'Tutorial', 2.4),
(4, 'Seminar', 1.8),
(5, 'Other', 1.0);

INSERT INTO planned_activity (planned_hours, course_instance_id, teaching_activity_id)
VALUES
-- This is IV1351, 2025-50273,id 21
(20, 21, 1),   -- Lectures
(80, 21, 3),   -- Tutorials
(40, 21, 2),   -- Labs
(80, 21, 4),   -- Seminars
(650, 21, 5),  -- Other

-- IX1500
(44, 22, 1),
(0,  22, 3),
(0,  22, 2),
(0,  22, 4),
(200,22, 5),

-- ID2214
(44, 23, 1),
(36, 23, 3),
(0,  23, 2),
(0,  23, 4),
(40,  23, 5),

-- IV1350
(0,   24, 1),
(25,  24, 3),
(0,   24, 2),
(0,   24, 4),
(100, 24, 5),

--DD1337
(30, 25, 1),
(30, 25, 3),
(20, 25, 2),
(10, 25, 4),
(50, 25, 5);

INSERT INTO employee_allocation (id, hours_to_allocate, employee_id, teaching_activity_id, course_instance_id)
VALUES
-- IV1351
(1, 72, 11, 1, 21),  
(2, 64, 12, 4, 21),   
(3, 50, 14, 2, 21),   
(4, 50, 15, 2, 21),   


-- IX1500
-- Same Teacher being used here
(5, 159, 13, 1, 22),   
(6, 100, 13, 5, 22),   

-- ID2214
(7,  44, 13, 1, 23),   
(8,  36, 13, 3, 23),   
(9,  64, 13, 4, 23),  
(10, 40, 13, 5, 23),   

-- IV1350
(11, 25, 13, 3, 24),  
(12,100, 13, 5, 24);   
