-- instructor
INSERT INTO
    instructor (
        ID,
        first_name,
        middle_initial,
        last_name,
        dept_name,
        salary,
        instructor_dob_day,
        instructor_dob_month,
        instructor_dob_year,
        phone_number,
        email,
        street,
        city,
        state,
        zip
    )
VALUES
    (
        '10007',
        'Giovanni',
        'X',
        'Herrera',
        'Comp. Sci.',
        12000.00,
        16,
        11,
        1996,
        '330-233-4557',
        'gvillalo@kent.edu',
        'Loop road',
        'Kent',
        'Ohio',
        '44240'
    );

SELECT
    instructor.ID,
    instructor.first_name
FROM
    instructor;

UPDATE instructor
set
    instructor.salary = 50000
WHERE
    instructor.ID = 10007;

DELETE FROM instructor
WHERE
    instructor.ID = 10007;

-- student
INSERT INTO
    student (
        ID,
        first_name,
        middle_initial,
        last_name,
        dept_name,
        student_dob_day,
        student_dob_month,
        student_dob_year,
        phone_number,
        email,
        street,
        city,
        state,
        zip
    )
VALUES
    (
        '20011',
        'Sumedh',
        'S',
        'Joshi',
        'Comp. Sci.',
        10,
        11,
        2000,
        '330-233-4557',
        'sjoshi17@kent.edu',
        'Ashton road',
        'Kent',
        'Ohio',
        '44240'
    );

SELECT
    student.ID,
    student.first_name
FROM
    student;

UPDATE student
set
    student.tot_cred = 96
WHERE
    student.ID = 20011;

DELETE FROM student
WHERE
    student.ID = 20011;

--Section
INSERT INTO
    section (
        course_id,
        sec_id,
        semester,
        section_year,
        building,
        room_number,
        time_slot_id
    )
VALUES
    (
        'CS30002',
        '1',
        'Summer',
        2025,
        'Bowman Hall',
        '205',
        'A'
    );

UPDATE section
set
    section.section_year = 2025
WHERE
    section.semester = 'Summer';

DELETE FROM section
WHERE
    section.semester = 'Summer';

-- Major transactions
-- Enroll
INSERT INTO
    takes (
        ID,
        course_id,
        sec_id,
        semester,
        takes_year,
        grade
    )
VALUES
    ('20010', 'PH10001', '1', 'Fall', 2026, 'A');

-- Assign instructor
-- Had to add a section to assign an instructors
INSERT INTO section(
    course_id,
    sec_id,
    semester,
    section_year
)
VALUES(
    'CS10001',
    '1',
    'Summer',
    2026
);

INSERT INTO teaches(
    ID,
    course_id,
    sec_id,
    semester,
    teaches_year
)
VALUES(
    '10001',
    'CS10001',
    '1',
    'Summer',
    2026
);

-- Withdraw
DELETE FROM takes
WHERE
    takes.ID = '20010'
    AND takes.sec_id = '1';

-- Grade to a student
UPDATE takes
SET
    takes.grade = 'A'
WHERE
    takes.ID = '20001'
    AND takes.semester = 'Fall';