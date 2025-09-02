CREATE TABLE ext_dev_log (
    log_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- Java Long 타입.
	log_type varchar(10) not null,
    dev_id VARCHAR(20) NOT NULL,              
    dev_type VARCHAR(20) NOT NULL,            
    registered_dlp BOOLEAN NOT NULL,          
    controlled_dlp BOOLEAN NOT NULL,   
    dev_status VARCHAR(10), 
    emp_id VARCHAR(8),                        
    emp_name VARCHAR(40),                    
    dept_id VARCHAR(15),                      
    dept_name VARCHAR(15),        
    location VARCHAR(20),
    valid_date DATE,
    usage_purpose VARCHAR(1000),  
    cmd_model VARCHAR(40),                    
    cmd_serial_num VARCHAR(40),               
    dlp_model VARCHAR(40),                    
    dlp_serial_num VARCHAR(40),               
    capacity INT,                            
    manufacturer VARCHAR(40),                                  
    notes VARCHAR(1000),                                           
    admin_id VARCHAR(30),                     
    admin_name VARCHAR(20),                   
    log_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

describe administrator;
SELECT * FROM administrator;
insert into administrator(admin_id,admin_pw,admin_name,admin_code,authority)
values('22210481','22210481!','장재민','admin',3),('21710581','21710581!','곽준규','admin',3);

describe ext_dev_log;
describe ext_dev;
drop table ext_dev_log;
drop procedure add_ext_dev;
show procedure status;
select * from ext_dev;

-- =============[수정 procedure]==============================================================================================================================
CREATE PROCEDURE modify_ext_dev (
    IN p_dev_id VARCHAR(20),
    IN p_dev_type VARCHAR(20),
    IN p_registered_dlp BOOLEAN,
    IN p_controlled_dlp BOOLEAN,
    IN p_dev_status VARCHAR(10),
    IN p_emp_id VARCHAR(8),
    IN p_emp_name VARCHAR(40),
    IN p_dept_id VARCHAR(15),
    IN p_dept_name VARCHAR(15),
    IN p_location VARCHAR(20),
    IN p_valid_date DATE,
    IN p_usage_purpose VARCHAR(1000),
    IN p_cmd_model VARCHAR(40),
    IN p_cmd_serial_num VARCHAR(40),
    IN p_dlp_model VARCHAR(40),
    IN p_dlp_serial_num VARCHAR(40),
    IN p_capacity INT,
    IN p_manufacturer VARCHAR(40),
    IN p_notes VARCHAR(1000),
    IN p_admin_id VARCHAR(30),
    IN p_admin_name VARCHAR(20)
)
BEGIN
	-- 1. 외부장치 테이블 접근 ▶ 수정값 업데이트
    UPDATE ext_dev
    SET 
        dev_type = p_dev_type,
        registered_dlp = p_registered_dlp,
        controlled_dlp = p_controlled_dlp,
        dev_status = p_dev_status,
        emp_id = p_emp_id,
        emp_name = p_emp_name,
        dept_id = p_dept_id,
        dept_name = p_dept_name,
        location = p_location,
        valid_date = p_valid_date,
        usage_purpose = p_usage_purpose,
        cmd_model = p_cmd_model,
        cmd_serial_num = p_cmd_serial_num,
        dlp_model = p_dlp_model,
        dlp_serial_num = p_dlp_serial_num,
        capacity = p_capacity,
        manufacturer = p_manufacturer,
        notes = p_notes
    where dev_id = p_dev_id;

    -- 2. 로그 테이블 ▶ 기록
    INSERT INTO ext_dev_log (
        log_type, dev_id, dev_type, registered_dlp, controlled_dlp, dev_status,
        emp_id, emp_name, dept_id, dept_name,location, valid_date,usage_purpose,
        cmd_model, cmd_serial_num, dlp_model, dlp_serial_num,
        capacity, manufacturer, notes, admin_id, admin_name
    ) VALUES (
	'수정', p_dev_id, p_dev_type, p_registered_dlp, p_controlled_dlp, p_dev_status,
    p_emp_id, p_emp_name, p_dept_id, p_dept_name, p_location, p_valid_date, p_usage_purpose,
    p_cmd_model, p_cmd_serial_num, p_dlp_model, p_dlp_serial_num,
    p_capacity, p_manufacturer, p_notes, p_admin_id, p_admin_name
    );
END
-- =============[장비추가 procedure]==============================================================================================================================
CREATE PROCEDURE add_ext_dev (
    IN p_dev_id VARCHAR(20),
    IN p_dev_type VARCHAR(20),
    IN p_registered_dlp BOOLEAN,
    IN p_controlled_dlp BOOLEAN,
    IN p_dev_status VARCHAR(10),
    IN p_emp_id VARCHAR(8),
    IN p_emp_name VARCHAR(40),
    IN p_dept_id VARCHAR(15),
    IN p_dept_name VARCHAR(15),
    IN p_location VARCHAR(20),
    IN p_valid_date DATE,
    IN p_usage_purpose VARCHAR(1000),
    IN p_cmd_model VARCHAR(40),
    IN p_cmd_serial_num VARCHAR(40),
    IN p_dlp_model VARCHAR(40),
    IN p_dlp_serial_num VARCHAR(40),
    IN p_capacity INT,
    IN p_manufacturer VARCHAR(40),
    IN p_notes VARCHAR(1000),
    IN p_admin_id VARCHAR(30),
    IN p_admin_name VARCHAR(20)
)
BEGIN
    -- 1. 외부장치 테이블 ▶ 새 장비 데이터 insert
    INSERT INTO ext_dev (
        dev_id, dev_type, registered_dlp, controlled_dlp,dev_status,
        emp_id, emp_name, dept_id, dept_name,location,valid_date,usage_purpose,
        cmd_model, cmd_serial_num, dlp_model, dlp_serial_num,
        capacity, manufacturer, notes
    ) VALUES (
 	p_dev_id, p_dev_type, p_registered_dlp, p_controlled_dlp, p_dev_status,
    p_emp_id, p_emp_name, p_dept_id, p_dept_name, p_location, p_valid_date, p_usage_purpose,
    p_cmd_model, p_cmd_serial_num, p_dlp_model, p_dlp_serial_num,
    p_capacity, p_manufacturer, p_notes
    );

    -- 2. 로그 테이블 ▶ 기록
    INSERT INTO ext_dev_log (
        log_type, dev_id, dev_type, registered_dlp, controlled_dlp, dev_status,
        emp_id, emp_name, dept_id, dept_name,location, valid_date,usage_purpose,
        cmd_model, cmd_serial_num, dlp_model, dlp_serial_num,
        capacity, manufacturer, notes, admin_id, admin_name
    ) VALUES (
	'장비추가', p_dev_id, p_dev_type, p_registered_dlp, p_controlled_dlp, p_dev_status,
    p_emp_id, p_emp_name, p_dept_id, p_dept_name, p_location, p_valid_date, p_usage_purpose,
    p_cmd_model, p_cmd_serial_num, p_dlp_model, p_dlp_serial_num,
    p_capacity, p_manufacturer, p_notes, p_admin_id, p_admin_name
    );
END