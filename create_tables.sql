CREATE TABLE
    department (
        dept_name VARCHAR(20) NOT NULL,
        building VARCHAR(15) NOT NULL,
        budget NUMERIC(12, 2) NOT NULL,
        college varchar(60) NOT NULL,
        phone VARCHAR(12) NOT NULL,
        PRIMARY KEY (dept_name)
    );

CREATE TABLE
    classroom (
        building VARCHAR(15) NOT NULL,
        room_number VARCHAR(7) NOT NULL,
        capacity NUMERIC(10),
        PRIMARY KEY (building, room_number)
    );

CREATE TABLE
    time_slot (
        time_slot_id VARCHAR(4) NOT NULL,
        PRIMARY KEY (time_slot_id)
    );

CREATE TABLE
    time_slot_detail (
        time_slot_id VARCHAR(4) NOT NULL,
        time_slot_day CHAR(1) NOT NULL,
        start_hr NUMERIC(2),
        start_min NUMERIC(2),
        end_hr NUMERIC(2),
        end_min NUMERIC(2),
        PRIMARY KEY (time_slot_id, time_slot_day, start_hr, start_min),
        FOREIGN KEY (time_slot_id) REFERENCES time_slot (time_slot_id)
    );

CREATE TABLE
    course (
        course_id VARCHAR(8) NOT NULL,
        title VARCHAR(50) NOT NULL,
        dept_name VARCHAR(20),
        credits NUMERIC(2),
        PRIMARY KEY (course_id),
        FOREIGN KEY (dept_name) REFERENCES department (dept_name)
    );

CREATE TABLE
    instructor (
        ID VARCHAR(5) NOT NULL,
        first_name VARCHAR(20) NOT NULL,
        middle_initial CHAR(1),
        last_name VARCHAR(20) NOT NULL,
        dept_name VARCHAR(20),
        salary NUMERIC(8, 2),
        instructor_dob_day NUMERIC(2) NOT NULL,
        instructor_dob_month NUMERIC(2) NOT NULL,
        instructor_dob_year NUMERIC(4) NOT NULL,
        phone_number varchar(12),
        email varchar(40) NOT NULL,
        street varchar(20) NOT NULL,
        city varchar(20) NOT NULL,
        state varchar(20) NOT NULL,
        zip varchar(20) NOT NULL,
        PRIMARY KEY (ID),
        FOREIGN KEY (dept_name) REFERENCES department (dept_name)
    );

CREATE TABLE
    student (
        ID VARCHAR(5) NOT NULL,
        first_name VARCHAR(20) NOT NULL,
        middle_initial CHAR(1),
        last_name VARCHAR(20) NOT NULL,
        dept_name VARCHAR(20),
        tot_cred NUMERIC(4),
        student_dob_day NUMERIC(2) NOT NULL,
        student_dob_month NUMERIC(2) NOT NULL,
        student_dob_year NUMERIC(4) NOT NULL,
        phone_number varchar(12),
        email varchar(40) NOT NULL,
        street varchar(20) NOT NULL,
        city varchar(20) NOT NULL,
        state varchar(20) NOT NULL,
        zip varchar(20) NOT NULL,
        PRIMARY KEY (ID),
        FOREIGN KEY (dept_name) REFERENCES department (dept_name)
    );

CREATE TABLE
    prereq (
        course_id VARCHAR(8) NOT NULL,
        prereq_id VARCHAR(8) NOT NULL,
        PRIMARY KEY (course_id, prereq_id),
        FOREIGN KEY (course_id) REFERENCES course (course_id),
        FOREIGN KEY (prereq_id) REFERENCES course (course_id)
    );

CREATE TABLE
    section (
        course_id VARCHAR(8) NOT NULL,
        sec_id VARCHAR(8) NOT NULL,
        semester VARCHAR(6) NOT NULL,
        section_year NUMERIC(4) NOT NULL,
        building VARCHAR(15),
        room_number VARCHAR(7),
        time_slot_id VARCHAR(4),
        PRIMARY KEY (course_id, sec_id, semester, section_year),
        FOREIGN KEY (course_id) REFERENCES course (course_id),
        FOREIGN KEY (building, room_number) REFERENCES classroom (building, room_number),
        FOREIGN KEY (time_slot_id) REFERENCES time_slot (time_slot_id)
    );

CREATE TABLE
    teaches (
        ID VARCHAR(5) NOT NULL,
        course_id VARCHAR(8) NOT NULL,
        sec_id VARCHAR(8) NOT NULL,
        semester VARCHAR(6) NOT NULL,
        teaches_year NUMERIC(4) NOT NULL,
        PRIMARY KEY (ID, course_id, sec_id, semester, teaches_year),
        FOREIGN KEY (course_id, sec_id, semester, teaches_year) REFERENCES section (course_id, sec_id, semester, section_year),
        FOREIGN KEY (ID) REFERENCES instructor (ID)
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
        FOREIGN KEY (course_id, sec_id, semester, takes_year) REFERENCES section (course_id, sec_id, semester, section_year),
        FOREIGN KEY (ID) REFERENCES student (ID)
    );

CREATE TABLE
    advisor (
        s_ID VARCHAR(5) NOT NULL,
        i_ID VARCHAR(5),
        PRIMARY KEY (s_ID),
        FOREIGN KEY (s_ID) REFERENCES student (ID),
        FOREIGN KEY (i_ID) REFERENCES instructor (ID)
    );