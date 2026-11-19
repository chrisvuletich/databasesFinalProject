-- DEPARTMENT
INSERT INTO
    department (dept_name, building, budget, college, phone)
VALUES
    (
        'Comp. Sci.',
        'Bowman Hall',
        500000.00,
        'College of Arts and Sciences',
        '330-672-2000'
    ),
    (
        'Mathematics',
        'Science Bldg',
        350000.00,
        'College of Arts and Sciences',
        '330-672-2001'
    ),
    (
        'Physics',
        'Cunningham',
        400000.00,
        'College of Arts and Sciences',
        '330-672-2002'
    ),
    (
        'English',
        'Satterfield',
        200000.00,
        'College of Arts and Sciences',
        '330-672-2003'
    ),
    (
        'Business',
        'Business Bldg',
        600000.00,
        'College of Business',
        '330-672-2004'
    );

-- CLASSROOM
INSERT INTO
    classroom (building, room_number, capacity)
VALUES
    ('Bowman Hall', '101', 30),
    ('Bowman Hall', '205', 50),
    ('Science Bldg', '110', 40),
    ('Science Bldg', '215', 25),
    ('Cunningham', '101', 35),
    ('Cunningham', '202', 60),
    ('Satterfield', '105', 45),
    ('Business Bldg', '301', 80);

-- TIME_SLOT  
-- A: MWF  9:00 – 9:50
-- B: MWF 11:00 –11:50
-- C: TR   9:30 –10:45
-- D: TR  12:30 –13:45
-- E: MWF 14:00 –14:50
INSERT INTO
    time_slot (
        time_slot_id,
        time_slot_day,
        start_hr,
        start_min,
        end_hr,
        end_min
    )
VALUES
    ('A', 'M', 9, 0, 9, 50),
    ('A', 'W', 9, 0, 9, 50),
    ('A', 'F', 9, 0, 9, 50),
    ('B', 'M', 11, 0, 11, 50),
    ('B', 'W', 11, 0, 11, 50),
    ('B', 'F', 11, 0, 11, 50),
    ('C', 'T', 9, 30, 10, 45),
    ('C', 'R', 9, 30, 10, 45),
    ('D', 'T', 12, 30, 13, 45),
    ('D', 'R', 12, 30, 13, 45),
    ('E', 'M', 14, 0, 14, 50),
    ('E', 'W', 14, 0, 14, 50),
    ('E', 'F', 14, 0, 14, 50);

-- COURSE
INSERT INTO
    course (course_id, title, dept_name, credits)
VALUES
    (
        'CS10001',
        'Intro to Programming',
        'Comp. Sci.',
        3
    ),
    ('CS20001', 'Data Structures', 'Comp. Sci.', 3),
    ('CS30001', 'Algorithms', 'Comp. Sci.', 3),
    ('CS30002', 'Database Systems', 'Comp. Sci.', 3),
    ('CS40001', 'Operating Systems', 'Comp. Sci.', 3),
    ('MA10001', 'Calculus I', 'Mathematics', 4),
    ('MA20001', 'Linear Algebra', 'Mathematics', 3),
    ('PH10001', 'General Physics I', 'Physics', 4),
    ('EN10001', 'Composition I', 'English', 3),
    ('BU20001', 'Principles of Mgmt', 'Business', 3);

-- PREREQ
INSERT INTO
    prereq (course_id, prereq_id)
VALUES
    ('CS20001', 'CS10001'),
    ('CS30001', 'CS20001'),
    ('CS30002', 'CS20001'),
    ('CS40001', 'CS30001'),
    ('MA20001', 'MA10001');

-- INSTRUCTOR
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
        '10001',
        'Alice',
        'M',
        'Johnson',
        'Comp. Sci.',
        85000.00,
        15,
        3,
        1978,
        '330-555-0101',
        'ajohnson@kent.edu',
        '123 Oak St',
        'Kent',
        'Ohio',
        '44240'
    ),
    (
        '10002',
        'Robert',
        'J',
        'Smith',
        'Comp. Sci.',
        92000.00,
        22,
        7,
        1972,
        '330-555-0102',
        'rjsmith@kent.edu',
        '456 Maple Ave',
        'Kent',
        'Ohio',
        '44240'
    ),
    (
        '10003',
        'Maria',
        'L',
        'Garcia',
        'Mathematics',
        78000.00,
        10,
        11,
        1980,
        '330-555-0103',
        'mlgarcia@kent.edu',
        '789 Pine Rd',
        'Stow',
        'Ohio',
        '44224'
    ),
    (
        '10004',
        'James',
        'R',
        'Wilson',
        'Physics',
        88000.00,
        5,
        2,
        1975,
        '330-555-0104',
        'jrwilson@kent.edu',
        '321 Elm St',
        'Akron',
        'Ohio',
        '44301'
    ),
    (
        '10005',
        'Sarah',
        'K',
        'Brown',
        'English',
        72000.00,
        30,
        9,
        1983,
        '330-555-0105',
        'skbrown@kent.edu',
        '654 Cedar Ln',
        'Kent',
        'Ohio',
        '44240'
    ),
    (
        '10006',
        'David',
        'A',
        'Lee',
        'Business',
        95000.00,
        18,
        6,
        1969,
        '330-555-0106',
        'dalee@kent.edu',
        '987 Birch Dr',
        'Stow',
        'Ohio',
        '44224'
    );

-- STUDENT
INSERT INTO
    student (
        ID,
        first_name,
        middle_initial,
        last_name,
        dept_name,
        tot_cred,
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
        '20001',
        'Emma',
        'J',
        'Taylor',
        'Comp. Sci.',
        60,
        12,
        4,
        2004,
        '330-555-1001',
        'etaylor@kent.edu',
        '11 College Ave',
        'Kent',
        'Ohio',
        '44240'
    ),
    (
        '20002',
        'Noah',
        'A',
        'Martinez',
        'Comp. Sci.',
        45,
        8,
        9,
        2003,
        '330-555-1002',
        'namartinez@kent.edu',
        '22 Summit St',
        'Kent',
        'Ohio',
        '44240'
    ),
    (
        '20003',
        'Olivia',
        'R',
        'Anderson',
        'Mathematics',
        75,
        25,
        1,
        2003,
        '330-555-1003',
        'oranderson@kent.edu',
        '33 Park Dr',
        'Akron',
        'Ohio',
        '44301'
    ),
    (
        '20004',
        'Liam',
        'T',
        'Thomas',
        'Comp. Sci.',
        30,
        17,
        6,
        2005,
        '330-555-1004',
        'ltthomas@kent.edu',
        '44 River Rd',
        'Kent',
        'Ohio',
        '44240'
    ),
    (
        '20005',
        'Ava',
        'N',
        'Jackson',
        'Physics',
        90,
        3,
        12,
        2002,
        '330-555-1005',
        'anjackson@kent.edu',
        '55 Lake Ave',
        'Stow',
        'Ohio',
        '44224'
    ),
    (
        '20006',
        'William',
        'B',
        'White',
        'Business',
        60,
        20,
        8,
        2003,
        '330-555-1006',
        'wbwhite@kent.edu',
        '66 Main St',
        'Kent',
        'Ohio',
        '44240'
    ),
    (
        '20007',
        'Sophia',
        'C',
        'Harris',
        'English',
        45,
        14,
        3,
        2004,
        '330-555-1007',
        'scharris@kent.edu',
        '77 High St',
        'Stow',
        'Ohio',
        '44224'
    ),
    (
        '20008',
        'James',
        'D',
        'Clark',
        'Comp. Sci.',
        90,
        9,
        11,
        2002,
        '330-555-1008',
        'jdclark@kent.edu',
        '88 Elm Ave',
        'Akron',
        'Ohio',
        '44301'
    ),
    (
        '20009',
        'Isabella',
        'E',
        'Lewis',
        'Mathematics',
        30,
        27,
        5,
        2005,
        '330-555-1009',
        'ielewis@kent.edu',
        '99 Oak Blvd',
        'Kent',
        'Ohio',
        '44240'
    ),
    (
        '20010',
        'Oliver',
        'F',
        'Robinson',
        'Business',
        15,
        11,
        7,
        2005,
        '330-555-1010',
        'ofrobinson@kent.edu',
        '10 Vine St',
        'Kent',
        'Ohio',
        '44240'
    );

-- SECTION
INSERT INTO section (
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
        'CS10001',
        '1',
        'Fall',
        2026,
        'Bowman Hall',
        '205',
        'A'
    ),
    (
        'CS10001',
        '2',
        'Fall',
        2026,
        'Bowman Hall',
        '101',
        'B'
    ),
    (
        'CS20001',
        '1',
        'Fall',
        2026,
        'Bowman Hall',
        '101',
        'C'
    ),
    (
        'CS30001',
        '1',
        'Fall',
        2026,
        'Bowman Hall',
        '101',
        'D'
    ),
    (
        'CS30002',
        '1',
        'Fall',
        2026,
        'Bowman Hall',
        '205',
        'C'
    ),
    (
        'MA10001',
        '1',
        'Fall',
        2026,
        'Science Bldg',
        '110',
        'A'
    ),
    (
        'MA10001',
        '2',
        'Fall',
        2026,
        'Science Bldg',
        '215',
        'E'
    ),
    (
        'PH10001',
        '1',
        'Fall',
        2026,
        'Cunningham',
        '202',
        'B'
    ),
    (
        'EN10001',
        '1',
        'Fall',
        2026,
        'Satterfield',
        '105',
        'D'
    ),
    (
        'BU20001',
        '1',
        'Fall',
        2026,
        'Business Bldg',
        '301',
        'C'
    ),
    (
        'CS10001',
        '1',
        'Spring',
        2026,
        'Bowman Hall',
        '205',
        'B'
    ),
    (
        'MA20001',
        '1',
        'Spring',
        2026,
        'Science Bldg',
        '110',
        'C'
    );

-- TEACHES
INSERT INTO
    teaches (ID, course_id, sec_id, semester, teaches_year)
VALUES
    ('10001', 'CS10001', '1', 'Fall', 2026),
    ('10001', 'CS10001', '2', 'Fall', 2026),
    ('10002', 'CS20001', '1', 'Fall', 2026),
    ('10002', 'CS30001', '1', 'Fall', 2026),
    ('10001', 'CS30002', '1', 'Fall', 2026),
    ('10003', 'MA10001', '1', 'Fall', 2026),
    ('10003', 'MA10001', '2', 'Fall', 2026),
    ('10004', 'PH10001', '1', 'Fall', 2026),
    ('10005', 'EN10001', '1', 'Fall', 2026),
    ('10006', 'BU20001', '1', 'Fall', 2026),
    ('10001', 'CS10001', '1', 'Spring', 2026),
    ('10003', 'MA20001', '1', 'Spring', 2026);

-- TAKES
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
    ('20001', 'CS10001', '1', 'Fall', 2026, NULL),
    ('20002', 'CS10001', '2', 'Fall', 2026, NULL),
    ('20004', 'CS10001', '1', 'Fall', 2026, NULL),
    ('20008', 'CS20001', '1', 'Fall', 2026, NULL),
    ('20001', 'CS30002', '1', 'Fall', 2026, NULL),
    ('20003', 'MA10001', '1', 'Fall', 2026, NULL),
    ('20009', 'MA10001', '2', 'Fall', 2026, NULL),
    ('20005', 'PH10001', '1', 'Fall', 2026, NULL),
    ('20007', 'EN10001', '1', 'Fall', 2026, NULL),
    ('20006', 'BU20001', '1', 'Fall', 2026, NULL),
    ('20010', 'BU20001', '1', 'Fall', 2026, NULL),
    -- Spring 2026 (completed)
    ('20008', 'CS10001', '1', 'Spring', 2026, 'A'),
    ('20003', 'MA20001', '1', 'Spring', 2026, 'B+');

-- ADVISOR
INSERT INTO
    advisor (s_ID, i_ID)
VALUES
    ('20001', '10001'),
    ('20002', '10001'),
    ('20003', '10003'),
    ('20004', '10002'),
    ('20005', '10004'),
    ('20006', '10006'),
    ('20007', '10005'),
    ('20008', '10002'),
    ('20009', '10003'),
    ('20010', '10006');