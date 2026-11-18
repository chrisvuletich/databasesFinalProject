CREATE TABLE
    department (
        dept_name VARCHAR(20) NOT NULL,
        building VARCHAR(15) NOT NULL,
        budget NUMERIC(12, 2) NOT NULL CHECK (budget > 0),
        college VARCHAR(60) NOT NULL,
        phone VARCHAR(12) NOT NULL,
        PRIMARY KEY (dept_name)
    );

CREATE TABLE
    classroom (
        building VARCHAR(15) NOT NULL,
        room_number VARCHAR(7) NOT NULL,
        capacity NUMERIC(4),
        PRIMARY KEY (building, room_number)
    );

CREATE TABLE
    time_slot (
        time_slot_id VARCHAR(4) NOT NULL,
        time_slot_day VARCHAR(1) NOT NULL,
        start_hr NUMERIC(2) CHECK (
            start_hr >= 0
            AND start_hr < 24
        ),
        start_min NUMERIC(2) CHECK (
            start_min >= 0
            AND start_min < 60
        ),
        end_hr NUMERIC(2) CHECK (
            end_hr >= 0
            AND end_hr < 24
        ),
        end_min NUMERIC(2) CHECK (
            end_min >= 0
            AND end_min < 60
        ),
        PRIMARY KEY (time_slot_id, time_slot_day, start_hr, start_min)
    );

CREATE TABLE
    course (
        course_id VARCHAR(8) NOT NULL,
        title VARCHAR(50) NOT NULL,
        dept_name VARCHAR(20),
        credits NUMERIC(2, 0) CHECK (credits > 0),
        PRIMARY KEY (course_id),
        FOREIGN KEY (dept_name) REFERENCES department (dept_name) ON DELETE SET NULL
    );

CREATE TABLE
    instructor (
        ID VARCHAR(5) NOT NULL,
        first_name VARCHAR(20) NOT NULL,
        middle_initial CHAR(1),
        last_name VARCHAR(20) NOT NULL,
        dept_name VARCHAR(20),
        salary NUMERIC(8, 2) CHECK (salary > 10000),
        instructor_dob_day NUMERIC(2) NOT NULL CHECK (instructor_dob_day BETWEEN 1 AND 31),
        instructor_dob_month NUMERIC(2) NOT NULL CHECK (instructor_dob_month BETWEEN 1 AND 12),
        instructor_dob_year NUMERIC(4) NOT NULL CHECK (instructor_dob_year > 1900),
        phone_number VARCHAR(12),
        email VARCHAR(40) NOT NULL,
        street VARCHAR(20) NOT NULL,
        city VARCHAR(20) NOT NULL,
        state VARCHAR(20) NOT NULL,
        zip VARCHAR(20) NOT NULL,
        PRIMARY KEY (ID),
        FOREIGN KEY (dept_name) REFERENCES department (dept_name) ON DELETE SET NULL
    );

CREATE TABLE
    student (
        ID VARCHAR(5) NOT NULL,
        first_name VARCHAR(20) NOT NULL,
        middle_initial CHAR(1),
        last_name VARCHAR(20) NOT NULL,
        dept_name VARCHAR(20),
        tot_cred NUMERIC(3, 0) CHECK (tot_cred >= 0),
        student_dob_day NUMERIC(2) NOT NULL CHECK (student_dob_day BETWEEN 1 AND 31),
        student_dob_month NUMERIC(2) NOT NULL CHECK (student_dob_month BETWEEN 1 AND 12),
        student_dob_year NUMERIC(4) NOT NULL CHECK (student_dob_year > 1900),
        phone_number VARCHAR(12),
        email VARCHAR(40) NOT NULL,
        street VARCHAR(20) NOT NULL,
        city VARCHAR(20) NOT NULL,
        state VARCHAR(20) NOT NULL,
        zip VARCHAR(20) NOT NULL,
        PRIMARY KEY (ID),
        FOREIGN KEY (dept_name) REFERENCES department (dept_name) ON DELETE SET NULL
    );

CREATE TABLE
    prereq (
        course_id VARCHAR(8) NOT NULL,
        prereq_id VARCHAR(8) NOT NULL,
        PRIMARY KEY (course_id, prereq_id),
        FOREIGN KEY (course_id) REFERENCES course (course_id) ON DELETE CASCADE,
        FOREIGN KEY (prereq_id) REFERENCES course (course_id)
    );

CREATE TABLE
    section (
        course_id VARCHAR(8) NOT NULL,
        sec_id VARCHAR(8) NOT NULL,
        semester VARCHAR(6) NOT NULL CHECK (
            semester IN ('Fall', 'Winter', 'Spring', 'Summer')
        ),
        section_year NUMERIC(4, 0) NOT NULL CHECK (
            section_year > 1701
            AND section_year < 2100
        ),
        building VARCHAR(15),
        room_number VARCHAR(7),
        time_slot_id VARCHAR(4),
        PRIMARY KEY (course_id, sec_id, semester, section_year),
        FOREIGN KEY (course_id) REFERENCES course (course_id) ON DELETE CASCADE,
        FOREIGN KEY (building, room_number) REFERENCES classroom (building, room_number) ON DELETE SET NULL
    );

CREATE TABLE
    teaches (
        ID VARCHAR(5) NOT NULL,
        course_id VARCHAR(8) NOT NULL,
        sec_id VARCHAR(8) NOT NULL,
        semester VARCHAR(6) NOT NULL,
        teaches_year NUMERIC(4) NOT NULL,
        PRIMARY KEY (ID, course_id, sec_id, semester, teaches_year),
        FOREIGN KEY (course_id, sec_id, semester, teaches_year) REFERENCES section (course_id, sec_id, semester, section_year) ON DELETE CASCADE,
        FOREIGN KEY (ID) REFERENCES instructor (ID) ON DELETE CASCADE
    );

CREATE TABLE
    takes (
        ID VARCHAR(5) NOT NULL,
        course_id VARCHAR(8) NOT NULL,
        sec_id VARCHAR(8) NOT NULL,
        semester VARCHAR(6) NOT NULL,
        takes_year NUMERIC(4) NOT NULL,
        grade VARCHAR(2),
        PRIMARY KEY (ID, course_id, sec_id, semester, takes_year),
        FOREIGN KEY (course_id, sec_id, semester, takes_year) REFERENCES section (course_id, sec_id, semester, section_year) ON DELETE CASCADE,
        FOREIGN KEY (ID) REFERENCES student (ID) ON DELETE CASCADE
    );

CREATE TABLE
    advisor (
        s_ID VARCHAR(5) NOT NULL,
        i_ID VARCHAR(5),
        PRIMARY KEY (s_ID),
        FOREIGN KEY (i_ID) REFERENCES instructor (ID) ON DELETE SET NULL,
        FOREIGN KEY (s_ID) REFERENCES student (ID) ON DELETE CASCADE
    );