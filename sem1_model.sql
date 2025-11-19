DROP TABLE IF EXISTS employee_allocation CASCADE;
DROP TABLE IF EXISTS planned_activity CASCADE;
DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS course_instance CASCADE;
DROP TABLE IF EXISTS teaching_activity CASCADE;
DROP TABLE IF EXISTS department CASCADE;
DROP TABLE IF EXISTS person CASCADE;
DROP TABLE IF EXISTS course_layout CASCADE;

CREATE TABLE course_layout (
 id SERIAL NOT NULL,
 course_code   VARCHAR(10) NOT NULL,
 course_name VARCHAR(50) NOT NULL,
 min_students INT,
 max_students INT,
 hp DECIMAL(5) NOT NULL
);

ALTER TABLE course_layout ADD CONSTRAINT PK_course_layout PRIMARY KEY (id);


CREATE TABLE department (
 id SERIAL NOT NULL,
 department_name VARCHAR(50) NOT NULL,
 manager_id INT
);

ALTER TABLE department ADD CONSTRAINT PK_department PRIMARY KEY (id);


CREATE TABLE person (
 id SERIAL NOT NULL,
 personal_number VARCHAR(20) NOT NULL,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 phone_number VARCHAR(20),
 home_address VARCHAR(50),
 email VARCHAR(50)
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE teaching_activity (
 id SERIAL NOT NULL,
 activity_name VARCHAR(50) NOT NULL,
 factor DECIMAL(5) NOT NULL
);

ALTER TABLE teaching_activity ADD CONSTRAINT PK_teaching_activity PRIMARY KEY (id);


CREATE TABLE course_instance (
 id SERIAL NOT NULL,
 instance_id VARCHAR(20) NOT NULL,
 num_students INT,
 study_period CHAR(10),
 study_year VARCHAR(50),
 course_layout_id INT NOT NULL
);

ALTER TABLE course_instance ADD CONSTRAINT PK_course_instance PRIMARY KEY (id);


CREATE TABLE employee (
 id SERIAL NOT NULL,
 employment_id  INT NOT NULL,
 skill_set VARCHAR(50),
 salary DECIMAL(10),
 job_title VARCHAR(50),
 department_id INT NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE employee ADD CONSTRAINT PK_employee PRIMARY KEY (id);


CREATE TABLE employee_allocation (
 id SERIAL NOT NULL,
 hours_to_allocate DECIMAL(100),
 employee_id INT,
 teaching_activity_id INT,
 course_instance_id INT
);

ALTER TABLE employee_allocation ADD CONSTRAINT PK_employee_allocation PRIMARY KEY (id);


CREATE TABLE planned_activity (
 planned_hours INT,
 course_instance_id INT NOT NULL,
 teaching_activity_id INT NOT NULL
);


ALTER TABLE course_instance ADD CONSTRAINT FK_course_instance_0 FOREIGN KEY (course_layout_id) REFERENCES course_layout (id);


ALTER TABLE employee ADD CONSTRAINT FK_employee_0 FOREIGN KEY (department_id) REFERENCES department (id);
ALTER TABLE employee ADD CONSTRAINT FK_employee_1 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE employee_allocation ADD CONSTRAINT FK_employee_allocation_0 FOREIGN KEY (employee_id) REFERENCES employee (id);
ALTER TABLE employee_allocation ADD CONSTRAINT FK_employee_allocation_1 FOREIGN KEY (teaching_activity_id) REFERENCES teaching_activity (id);
ALTER TABLE employee_allocation ADD CONSTRAINT FK_employee_allocation_2 FOREIGN KEY (course_instance_id) REFERENCES course_instance (id);


ALTER TABLE planned_activity ADD CONSTRAINT FK_planned_activity_0 FOREIGN KEY (course_instance_id) REFERENCES course_instance (id);
ALTER TABLE planned_activity ADD CONSTRAINT FK_planned_activity_1 FOREIGN KEY (teaching_activity_id) REFERENCES teaching_activity (id);


