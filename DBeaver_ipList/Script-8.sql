
CREATE PROCEDURE modify_ext_dev2(
    IN p_dev_id VARCHAR(10),
    IN p_dev_type VARCHAR(10),
    IN p_registered_dlp TINYINT(1),
    IN p_controlled_dlp TINYINT(1),
    IN p_emp_id VARCHAR(8),
    IN p_emp_name VARCHAR(10),
    IN p_dept_id VARCHAR(15),
    IN p_dept_name VARCHAR(15),
    IN p_cmd_model VARCHAR(40),
    IN p_cmd_serial_num VARCHAR(40),
    IN p_dlp_model VARCHAR(40),
    IN p_dlp_serial_num VARCHAR(40),
    IN p_capacity INT,
    IN p_manufacturer VARCHAR(20),
    IN p_usage_purpose VARCHAR(100),
    IN p_location VARCHAR(20),
    IN p_valid_date DATE,
    IN p_notes VARCHAR(1000),
    IN p_status VARCHAR(10),
    IN p_admin_id VARCHAR(30),
    IN p_admin_name VARCHAR(20)
)
BEGIN
    DECLARE old_dev_type VARCHAR(10);
    DECLARE old_registered_dlp TINYINT(1);
    DECLARE old_controlled_dlp TINYINT(1);
    DECLARE old_emp_id VARCHAR(8);
    DECLARE old_emp_name VARCHAR(10);
    DECLARE old_dept_id VARCHAR(15);
    DECLARE old_dept_name VARCHAR(15);
    DECLARE old_cmd_model VARCHAR(40);
    DECLARE old_cmd_serial_num VARCHAR(40);
    DECLARE old_dlp_model VARCHAR(40);
    DECLARE old_dlp_serial_num VARCHAR(40);
    DECLARE old_capacity INT;
    DECLARE old_manufacturer VARCHAR(20);
    DECLARE old_usage_purpose VARCHAR(100);
    DECLARE old_location VARCHAR(20);
    DECLARE old_valid_date DATE;
    DECLARE old_notes VARCHAR(1000);
    DECLARE old_status VARCHAR(10);

    SELECT dev_type, registered_dlp, controlled_dlp, emp_id, emp_name,
           dept_id, dept_name, cmd_model, cmd_serial_num, dlp_model, dlp_serial_num,
           capacity, manufacturer, usage_purpose, location, valid_date, notes, status
    INTO old_dev_type, old_registered_dlp, old_controlled_dlp, old_emp_id, old_emp_name,
         old_dept_id, old_dept_name, old_cmd_model, old_cmd_serial_num, old_dlp_model, old_dlp_serial_num,
         old_capacity, old_manufacturer, old_usage_purpose, old_location, old_valid_date, old_notes, old_status
    FROM ext_dev
    WHERE dev_id = p_dev_id;

    UPDATE ext_dev
    SET dev_type = p_dev_type,
        registered_dlp = p_registered_dlp,
        controlled_dlp = p_controlled_dlp,
        emp_id = p_emp_id,
        emp_name = p_emp_name,
        dept_id = p_dept_id,
        dept_name = p_dept_name,
        cmd_model = p_cmd_model,
        cmd_serial_num = p_cmd_serial_num,
        dlp_model = p_dlp_model,
        dlp_serial_num = p_dlp_serial_num,
        capacity = p_capacity,
        manufacturer = p_manufacturer,
        usage_purpose = p_usage_purpose,
        location = p_location,
        valid_date = p_valid_date,
        notes = p_notes,
        status = p_status
    WHERE dev_id = p_dev_id;

    -- 로그 기록 (이전값 ▶ 새값)
    INSERT INTO ext_dev_log(
        log_type, dev_id, dev_type, registered_dlp, controlled_dlp,
        emp_id, emp_name, dept_id, dept_name, cmd_model, cmd_serial_num,
        dlp_model, dlp_serial_num, capacity, manufacturer,
        usage_purpose, location, valid_date, notes, status,
        admin_id, admin_name
    )
    VALUES (
        '수정', p_dev_id,
        CONCAT(old_dev_type, ' ▶ ', p_dev_type),
        CONCAT(old_registered_dlp, ' ▶ ', p_registered_dlp),
        CONCAT(old_controlled_dlp, ' ▶ ', p_controlled_dlp),
        CONCAT(old_emp_id, ' ▶ ', p_emp_id),
        CONCAT(old_emp_name, ' ▶ ', p_emp_name),
        CONCAT(old_dept_id, ' ▶ ', p_dept_id),
        CONCAT(old_dept_name, ' ▶ ', p_dept_name),
        CONCAT(old_cmd_model, ' ▶ ', p_cmd_model),
        CONCAT(old_cmd_serial_num, ' ▶ ', p_cmd_serial_num),
        CONCAT(old_dlp_model, ' ▶ ', p_dlp_model),
        CONCAT(old_dlp_serial_num, ' ▶ ', p_dlp_serial_num),
        CONCAT(old_capacity, ' ▶ ', p_capacity),
        CONCAT(old_manufacturer, ' ▶ ', p_manufacturer),
        CONCAT(old_usage_purpose, ' ▶ ', p_usage_purpose),
        CONCAT(old_location, ' ▶ ', p_location),
        CONCAT(old_valid_date, ' ▶ ', p_valid_date),
        CONCAT(old_notes, ' ▶ ', p_notes),
        CONCAT(old_status, ' ▶ ', p_status),
        p_admin_id,
        p_admin_name
    );

END



