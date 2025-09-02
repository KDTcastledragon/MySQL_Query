CREATE OR REPLACE VIEW ext_dev_log_view AS
SELECT *
FROM (
    SELECT
        l.log_id,
        l.log_type,
        l.dev_id,
        concat(ifnull(lag(l.dev_type) OVER (PARTITION BY l.dev_id ORDER BY l.log_timestamp), ''), ' ▶ ', l.dev_type) AS dev_type,
        concat(ifnull(lag(l.registered_dlp) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', l.registered_dlp) as registered_dlp,
        concat(ifnull(lag(l.controlled_dlp) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', l.controlled_dlp) as controlled_dlp,
        CONCAT(IFNULL(LAG(l.dev_status) OVER (PARTITION BY l.dev_id ORDER BY l.log_timestamp), ''), ' ▶ ', l.dev_status) AS dev_status,
        CONCAT(IFNULL(LAG(l.emp_id) OVER (PARTITION BY l.dev_id ORDER BY l.log_timestamp), ''), ' ▶ ', l.emp_id) AS emp_id,
        CONCAT(IFNULL(LAG(l.emp_name) OVER (PARTITION BY l.dev_id ORDER BY l.log_timestamp), ''), ' ▶ ', l.emp_name) AS emp_name,
        CONCAT(IFNULL(LAG(l.dept_name) OVER (PARTITION BY l.dev_id ORDER BY l.log_timestamp), ''), ' ▶ ', l.dept_name) AS dept_name,
        CONCAT(IFNULL(LAG(l.location) OVER (PARTITION BY l.dev_id ORDER BY l.log_timestamp), ''), ' ▶ ', l.location) AS location,
        CONCAT(IFNULL(LAG(l.valid_date) OVER (PARTITION BY l.dev_id ORDER BY l.log_timestamp), ''), ' ▶ ', l.valid_date) AS valid_date,
        CONCAT(IFNULL(LAG(l.usage_purpose) OVER (PARTITION BY l.dev_id ORDER BY l.log_timestamp), ''), ' ▶ ', l.usage_purpose) AS usage_purpose,
        CONCAT(IFNULL(LAG(l.cmd_model) OVER (PARTITION BY l.dev_id ORDER BY l.log_timestamp), ''), ' ▶ ', l.cmd_model) AS cmd_model,
        CONCAT(IFNULL(LAG(l.cmd_serial_num) OVER (PARTITION BY l.dev_id ORDER BY l.log_timestamp), ''), ' ▶ ', l.cmd_serial_num) AS cmd_serial_num,
        CONCAT(IFNULL(LAG(l.dlp_model) OVER (PARTITION BY l.dev_id ORDER BY l.log_timestamp), ''), ' ▶ ', l.dlp_model) AS dlp_model,
        CONCAT(IFNULL(LAG(l.dlp_serial_num) OVER (PARTITION BY l.dev_id ORDER BY l.log_timestamp), ''), ' ▶ ', l.dlp_serial_num) AS dlp_serial_num,
        CONCAT(IFNULL(LAG(l.capacity) OVER (PARTITION BY l.dev_id ORDER BY l.log_timestamp), ''), ' ▶ ', l.capacity) AS capacity,
        CONCAT(IFNULL(LAG(l.manufacturer) OVER (PARTITION BY l.dev_id ORDER BY l.log_timestamp), ''), ' ▶ ', l.manufacturer) AS manufacturer,
        CONCAT(IFNULL(LAG(l.notes) OVER (PARTITION BY l.dev_id ORDER BY l.log_timestamp), ''), ' ▶ ', l.notes) AS notes,
        l.admin_id,
        l.admin_name,
        l.log_timestamp
        
    FROM ext_dev_log l
) sub
ORDER BY sub.log_timestamp desc;

select * from ext_dev_log_view;
select * from ext_dev_log;

-- drop view ext_dev_log_view;
-- truncate ext_dev_log;
-- truncate ext_dev;
-- drop table ext_dev_log;