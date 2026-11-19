
DELIMITER //

DROP PROCEDURE IF EXISTS create_instructor//

CREATE PROCEDURE create_instructor(
    IN p_id VARCHAR(5),
    IN p_first_name VARCHAR(20),
    IN p_middle_initial CHAR(1),
    IN p_last_name VARCHAR(20),
    IN p_dept_name VARCHAR(20),
    IN p_salary DECIMAL(8,2),
    IN p_dob_day INT,
    IN p_dob_month INT,
    IN p_dob_year INT,
    IN p_phone VARCHAR(12),
    IN p_email VARCHAR(40),
    IN p_street VARCHAR(20),
    IN p_city VARCHAR(20),
    IN p_state VARCHAR(20),
    IN p_zip VARCHAR(20)
)
BEGIN
    INSERT INTO instructor (
        ID, first_name, middle_initial, last_name,
        dept_name, salary,
        instructor_dob_day, instructor_dob_month,
        instructor_dob_year, phone_number, email,
        street, city, state, zip
    )
    VALUES (
        p_id, p_first_name, p_middle_initial,
        p_last_name, p_dept_name, p_salary,
        p_dob_day, p_dob_month, p_dob_year,
        p_phone, p_email, p_street,
        p_city, p_state, p_zip
    );
END//

DROP PROCEDURE IF EXISTS read_instructor//

CREATE PROCEDURE read_instructor(
    IN p_id VARCHAR(5)
)
BEGIN
    SELECT *
    FROM instructor
    WHERE ID = p_id;
END//

DROP PROCEDURE IF EXISTS update_instructor_salary//

CREATE PROCEDURE update_instructor_salary(
    IN p_id VARCHAR(5),
    IN p_salary DECIMAL(8,2)
)
BEGIN
    UPDATE instructor
    SET salary = p_salary
    WHERE ID = p_id;
END//

DROP PROCEDURE IF EXISTS delete_instructor//

CREATE PROCEDURE delete_instructor(
    IN p_id VARCHAR(5)
)
BEGIN
    IF EXISTS (
        SELECT 1 FROM teaches WHERE ID = p_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Cannot delete instructor teaching a section';
    ELSE
        DELETE FROM instructor
        WHERE ID = p_id;
    END IF;
END//

DROP PROCEDURE IF EXISTS create_student//

CREATE PROCEDURE create_student(
    IN p_id VARCHAR(5),
    IN p_first_name VARCHAR(20),
    IN p_middle_initial CHAR(1),
    IN p_last_name VARCHAR(20),
    IN p_dept_name VARCHAR(20),
    IN p_tot_cred INT,
    IN p_dob_day INT,
    IN p_dob_month INT,
    IN p_dob_year INT,
    IN p_phone VARCHAR(12),
    IN p_email VARCHAR(40),
    IN p_street VARCHAR(20),
    IN p_city VARCHAR(20),
    IN p_state VARCHAR(20),
    IN p_zip VARCHAR(20)
)
BEGIN
    INSERT INTO student (
        ID, first_name, middle_initial, last_name,
        dept_name, tot_cred,
        student_dob_day, student_dob_month,
        student_dob_year, phone_number, email,
        street, city, state, zip
    )
    VALUES (
        p_id, p_first_name, p_middle_initial,
        p_last_name, p_dept_name, p_tot_cred,
        p_dob_day, p_dob_month, p_dob_year,
        p_phone, p_email, p_street,
        p_city, p_state, p_zip
    );
END//

DROP PROCEDURE IF EXISTS read_student//

CREATE PROCEDURE read_student(
    IN p_id VARCHAR(5)
)
BEGIN
    SELECT *
    FROM student
    WHERE ID = p_id;
END//

DROP PROCEDURE IF EXISTS update_student_credits//

CREATE PROCEDURE update_student_credits(
    IN p_id VARCHAR(5),
    IN p_tot_cred INT
)
BEGIN
    UPDATE student
    SET tot_cred = p_tot_cred
    WHERE ID = p_id;
END//

DROP PROCEDURE IF EXISTS delete_student//

CREATE PROCEDURE delete_student(
    IN p_id VARCHAR(5)
)
BEGIN
    IF EXISTS (
        SELECT 1 FROM takes WHERE ID = p_id
    ) OR EXISTS (
        SELECT 1 FROM advisor WHERE s_ID = p_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Cannot delete student with active records';
    ELSE
        DELETE FROM student
        WHERE ID = p_id;
    END IF;
END//

DROP PROCEDURE IF EXISTS create_section//

CREATE PROCEDURE create_section(
    IN p_course_id VARCHAR(8),
    IN p_sec_id VARCHAR(8),
    IN p_semester VARCHAR(6),
    IN p_year INT,
    IN p_building VARCHAR(15),
    IN p_room_number VARCHAR(7),
    IN p_time_slot_id VARCHAR(4)
)
BEGIN
    INSERT INTO section (
        course_id, sec_id, semester,
        section_year, building, room_number,
        time_slot_id
    )
    VALUES (
        p_course_id, p_sec_id, p_semester,
        p_year, p_building, p_room_number,
        p_time_slot_id
    );
END//

DROP PROCEDURE IF EXISTS read_section//

CREATE PROCEDURE read_section(
    IN p_course_id VARCHAR(8),
    IN p_sec_id VARCHAR(8),
    IN p_semester VARCHAR(6),
    IN p_year INT
)
BEGIN
    SELECT *
    FROM section
    WHERE course_id = p_course_id
      AND sec_id = p_sec_id
      AND semester = p_semester
      AND section_year = p_year;
END//

DROP PROCEDURE IF EXISTS update_section_room//

CREATE PROCEDURE update_section_room(
    IN p_course_id VARCHAR(8),
    IN p_sec_id VARCHAR(8),
    IN p_semester VARCHAR(6),
    IN p_year INT,
    IN p_building VARCHAR(15),
    IN p_room_number VARCHAR(7)
)
BEGIN
    UPDATE section
    SET building = p_building,
        room_number = p_room_number
    WHERE course_id = p_course_id
      AND sec_id = p_sec_id
      AND semester = p_semester
      AND section_year = p_year;
END//

DROP PROCEDURE IF EXISTS delete_section//

CREATE PROCEDURE delete_section(
    IN p_course_id VARCHAR(8),
    IN p_sec_id VARCHAR(8),
    IN p_semester VARCHAR(6),
    IN p_year INT
)
BEGIN
    IF EXISTS (
        SELECT 1 FROM takes
        WHERE course_id = p_course_id
          AND sec_id = p_sec_id
          AND semester = p_semester
          AND takes_year = p_year
    ) OR EXISTS (
        SELECT 1 FROM teaches
        WHERE course_id = p_course_id
          AND sec_id = p_sec_id
          AND semester = p_semester
          AND teaches_year = p_year
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Cannot delete section with active records';
    ELSE
        DELETE FROM section
        WHERE course_id = p_course_id
          AND sec_id = p_sec_id
          AND semester = p_semester
          AND section_year = p_year;
    END IF;
END//

DROP PROCEDURE IF EXISTS enroll_student//

CREATE PROCEDURE enroll_student(
    IN p_student_id VARCHAR(5),
    IN p_course_id VARCHAR(8),
    IN p_sec_id VARCHAR(8),
    IN p_semester VARCHAR(6),
    IN p_year INT
)
BEGIN
    INSERT INTO takes (
        ID, course_id, sec_id, semester,
        takes_year, grade
    )
    VALUES (
        p_student_id, p_course_id,
        p_sec_id, p_semester, p_year, NULL
    );
END//

DROP PROCEDURE IF EXISTS assign_instructor//

CREATE PROCEDURE assign_instructor(
    IN p_instructor_id VARCHAR(5),
    IN p_course_id VARCHAR(8),
    IN p_sec_id VARCHAR(8),
    IN p_semester VARCHAR(6),
    IN p_year INT
)
BEGIN
    INSERT INTO teaches (
        ID, course_id, sec_id,
        semester, teaches_year
    )
    VALUES (
        p_instructor_id, p_course_id,
        p_sec_id, p_semester, p_year
    );
END//

DROP PROCEDURE IF EXISTS withdraw_student//

CREATE PROCEDURE withdraw_student(
    IN p_student_id VARCHAR(5),
    IN p_course_id VARCHAR(8),
    IN p_sec_id VARCHAR(8),
    IN p_semester VARCHAR(6),
    IN p_year INT
)
BEGIN
    DELETE FROM takes
    WHERE ID = p_student_id
      AND course_id = p_course_id
      AND sec_id = p_sec_id
      AND semester = p_semester
      AND takes_year = p_year;
END//

DROP PROCEDURE IF EXISTS record_grade//

CREATE PROCEDURE record_grade(
    IN p_student_id VARCHAR(5),
    IN p_course_id VARCHAR(8),
    IN p_sec_id VARCHAR(8),
    IN p_semester VARCHAR(6),
    IN p_year INT,
    IN p_grade VARCHAR(2)
)
BEGIN
    UPDATE takes
    SET grade = p_grade
    WHERE ID = p_student_id
      AND course_id = p_course_id
      AND sec_id = p_sec_id
      AND semester = p_semester
      AND takes_year = p_year;
END//

DELIMITER ;