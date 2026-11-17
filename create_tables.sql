CREATE TABLE
    department (
        dept_name VARCHAR(20) NOT NULL,
        building VARCHAR(15) NOT NULL,
        budget NUMERIC(12, 2) NOT NULL,
        college varchar(60) NOT NULL,
        phone NUMERIC(12) NOT NULL,
        PRIMARY KEY (dept_name)
    );

CREATE TABLE
    classroom (
        building VARCHAR(15) NOT NULL,
        room_number VARCHAR(7) NOT NULL,
        capacity NUMERIC(4),
        PRIMARY KEY (building, room_number)
    );

create table
    department (
        dept_name varchar(20),
        building varchar(15),
        budget numeric(12, 2) check (budget > 0),
        college varchar(60) NOT NULL,
        phone VARCHAR(12) NOT NULL,
        PRIMARY KEY (dept_name) primary key (dept_name)
    );

create table
    time_slot (
        time_slot_id varchar(4),
        day varchar(1),
        start_hr numeric(2) check (
            start_hr >= 0
            and start_hr < 24
        ),
        start_min numeric(2) check (
            start_min >= 0
            and start_min < 60
        ),
        end_hr numeric(2) check (
            end_hr >= 0
            and end_hr < 24
        ),
        end_min numeric(2) check (
            end_min >= 0
            and end_min < 60
        ),
        primary key (time_slot_id, day, start_hr, start_min)
    );

create table
    course (
        course_id varchar(8),
        title varchar(50),
        dept_name varchar(20),
        credits numeric(2, 0) check (credits > 0),
        primary key (course_id),
        foreign key (dept_name) references department (dept_name) on delete set null
    );

CREATE TABLE
    instructor (
        ID VARCHAR(5) NOT NULL,
        first_name VARCHAR(20) NOT NULL,
        middle_initial CHAR(1),
        last_name VARCHAR(20) NOT NULL,
        dept_name VARCHAR(20),
        salary numeric(8, 2) check (salary > 10000),
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
        foreign key (dept_name) references department (dept_name) on delete set null
    );

CREATE TABLE
    student (
        ID VARCHAR(5) NOT NULL,
        first_name VARCHAR(20) NOT NULL,
        middle_initial CHAR(1),
        last_name VARCHAR(20) NOT NULL,
        dept_name VARCHAR(20),
		tot_cred numeric(3, 0) check (tot_cred >= 0),
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
		foreign key (dept_name) references department (dept_name) on delete set null
    );

create table
	prereq (
		course_id varchar(8),
		prereq_id varchar(8),
		primary key (course_id, prereq_id),
		foreign key (course_id) references course (course_id) on delete cascade,
		foreign key (prereq_id) references course (course_id)
	);

CREATE TABLE
    section (
        course_id VARCHAR(8) NOT NULL,
        sec_id VARCHAR(8) NOT NULL,
        check (
            semester in ('Fall', 'Winter', 'Spring', 'Summer')
        ),
        year numeric(4, 0) check (
            year > 1701
            and year < 2100
        ),
        building VARCHAR(15),
        room_number VARCHAR(7),
        time_slot_id VARCHAR(4),
        primary key (course_id, sec_id, semester, year),
        foreign key (course_id) references course (course_id) on delete cascade,
        foreign key (building, room_number) references classroom (building, room_number) on delete set null
    );

CREATE TABLE
    teaches (
        ID VARCHAR(5) NOT NULL,
        course_id VARCHAR(8) NOT NULL,
        sec_id VARCHAR(8) NOT NULL,
        semester VARCHAR(6) NOT NULL,
        year NUMERIC(4) NOT NULL,
        PRIMARY KEY (ID, course_id, sec_id, semester, year),
        FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section (course_id, sec_id, semester, year),
        FOREIGN KEY (ID) REFERENCES instructor (ID)
    );

CREATE TABLE
    takes (
        ID VARCHAR(5) NOT NULL,
        course_id VARCHAR(8) NOT NULL,
        sec_id VARCHAR(8) NOT NULL,
        semester VARCHAR(6) NOT NULL,
        year NUMERIC(4) NOT NULL,
        grade VARCHAR(2),
        PRIMARY KEY (ID, course_id, sec_id, semester, year),
        FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section (course_id, sec_id, semester, year),
        FOREIGN KEY (ID) REFERENCES student (ID)
    );

create table
	advisor (
		s_ID varchar(5),
		i_ID varchar(5),
		primary key (s_ID),
		foreign key (i_ID) references instructor (ID) on delete set null,
		foreign key (s_ID) references student (ID) on delete cascade
	);