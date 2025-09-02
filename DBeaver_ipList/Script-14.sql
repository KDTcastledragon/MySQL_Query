create or replace view ext_dev_log_view as select * from (
select
	edl.log_id, edl.log_type, edl_dev_id,
	
	if(lag(edl.dev_type) over (partition by edl.dev_id order by edl.log_timestamp) = edl.dev_type,edl.dev_type,
	concat(ifnull(lag(edl.dev_type) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.dev_type) as dev_type,
	concat(ifnull(lag(edl.registered_dlp) over (partition by edl.dev_id order by edl.log_timestamp),''), ' ▶ ', edl.registered_dlp) as registered_dlp,
	concat(ifnull(lag(edl.controlled_dlp) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', l.controlled_dlp) as controlled_dlp,
	concat(ifnull(lag(edl.dev_status) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', l.dev_status) AS dev_status,
    concat(ifnull(lag(edl.emp_id) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', l.emp_id) AS emp_id,
    concat(ifnull(lag(edl.emp_name) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', l.emp_name) AS emp_name,
    concat(ifnull(lag(edl.dept_name) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', l.dept_name) AS dept_name,
    concat(ifnull(lag(edl.location) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', l.location) AS location,
    concat(ifnull(lag(edl.valid_date) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', l.valid_date) AS valid_date,
    concat(ifnull(lag(edl.usage_purpose) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', l.usage_purpose) AS usage_purpose,
    concat(ifnull(lag(edl.cmd_model) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', edl.cmd_model) AS cmd_model,
    concat(ifnull(lag(edl.cmd_serial_num) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', edl.cmd_serial_num) AS cmd_serial_num,
    concat(ifnull(lag(edl.dlp_model) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', edl.dlp_model) AS dlp_model,
    concat(ifnull(lag(edl.dlp_serial_num) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', edl.dlp_serial_num) AS dlp_serial_num,
    concat(ifnull(lag(edl.capacity) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', edl.capacity) AS capacity,
    concat(ifnull(lag(edl.manufacturer) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', edl.manufacturer) AS manufacturer,
    concat(ifnull(lag(edl.notes) over (partition by l.dev_id order by l.log_timestamp), ''), ' ▶ ', edl.notes) AS notes,
    
    edl.admin_id,
    edl.admin_name,
    edl.log_timestamp
    
from ext_dev_log edl ) sub order by sub.log_timestamp desc;

select * from ext_dev_log;
drop view ext_dev_log_view;
-- =====================================================================================================================
create or replace view ext_dev_log_view as
select *
from (
    select
        edl.log_id,
        edl.log_type,
        edl.dev_id,

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.dev_type) over (partition by edl.dev_id order by edl.log_timestamp) = edl.dev_type,
            edl.dev_type,
            concat(ifnull(lag(edl.dev_type) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.dev_type)
        ) as dev_type,

--        if(
--            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
--            or lag(edl.registered_dlp) over (partition by edl.dev_id order by edl.log_timestamp) = edl.registered_dlp,
--            edl.registered_dlp,
--            concat(ifnull(lag(edl.registered_dlp) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.registered_dlp)
--        ) as registered_dlp,
--
--        if(
--            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
--            or lag(edl.controlled_dlp) over (partition by edl.dev_id order by edl.log_timestamp) = edl.controlled_dlp,
--            edl.controlled_dlp,
--            concat(ifnull(lag(edl.controlled_dlp) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.controlled_dlp)
--        ) as controlled_dlp,
        
        if(
    		row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
    		or lag(edl.registered_dlp) over (partition by edl.dev_id order by edl.log_timestamp) = edl.registered_dlp,
    		if(edl.registered_dlp = 1, 'O', 'X'),
    		concat(
        		ifnull(if(lag(edl.registered_dlp) over (partition by edl.dev_id order by edl.log_timestamp) = 1, 'O', 'X'), ''),
        		' ▶ ',
        		if(edl.registered_dlp = 1, 'O', 'X')
    		)
		) as registered_dlp,

		if(
    		row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
    		or lag(edl.controlled_dlp) over (partition by edl.dev_id order by edl.log_timestamp) = edl.controlled_dlp,
    		if(edl.controlled_dlp = 1, 'O', 'X'),
    		concat(
        		ifnull(if(lag(edl.controlled_dlp) over (partition by edl.dev_id order by edl.log_timestamp) = 1, 'O', 'X'), ''),
        		' ▶ ',
        		if(edl.controlled_dlp = 1, 'O', 'X')
    		)
		) as controlled_dlp,
        

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.dev_status) over (partition by edl.dev_id order by edl.log_timestamp) = edl.dev_status,
            edl.dev_status,
            concat(ifnull(lag(edl.dev_status) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.dev_status)
        ) as dev_status,

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.emp_id) over (partition by edl.dev_id order by edl.log_timestamp) = edl.emp_id,
            edl.emp_id,
            concat(ifnull(lag(edl.emp_id) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.emp_id)
        ) as emp_id,

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.emp_name) over (partition by edl.dev_id order by edl.log_timestamp) = edl.emp_name,
            edl.emp_name,
            concat(ifnull(lag(edl.emp_name) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.emp_name)
        ) as emp_name,

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.dept_name) over (partition by edl.dev_id order by edl.log_timestamp) = edl.dept_name,
            edl.dept_name,
            concat(ifnull(lag(edl.dept_name) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.dept_name)
        ) as dept_name,

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.location) over (partition by edl.dev_id order by edl.log_timestamp) = edl.location,
            edl.location,
            concat(ifnull(lag(edl.location) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.location)
        ) as location,

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.valid_date) over (partition by edl.dev_id order by edl.log_timestamp) = edl.valid_date,
            edl.valid_date,
            concat(ifnull(lag(edl.valid_date) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.valid_date)
        ) as valid_date,

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.usage_purpose) over (partition by edl.dev_id order by edl.log_timestamp) = edl.usage_purpose,
            edl.usage_purpose,
            concat(ifnull(lag(edl.usage_purpose) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.usage_purpose)
        ) as usage_purpose,

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.cmd_model) over (partition by edl.dev_id order by edl.log_timestamp) = edl.cmd_model,
            edl.cmd_model,
            concat(ifnull(lag(edl.cmd_model) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.cmd_model)
        ) as cmd_model,

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.cmd_serial_num) over (partition by edl.dev_id order by edl.log_timestamp) = edl.cmd_serial_num,
            edl.cmd_serial_num,
            concat(ifnull(lag(edl.cmd_serial_num) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.cmd_serial_num)
        ) as cmd_serial_num,

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.dlp_model) over (partition by edl.dev_id order by edl.log_timestamp) = edl.dlp_model,
            edl.dlp_model,
            concat(ifnull(lag(edl.dlp_model) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.dlp_model)
        ) as dlp_model,

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.dlp_serial_num) over (partition by edl.dev_id order by edl.log_timestamp) = edl.dlp_serial_num,
            edl.dlp_serial_num,
            concat(ifnull(lag(edl.dlp_serial_num) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.dlp_serial_num)
        ) as dlp_serial_num,

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.capacity) over (partition by edl.dev_id order by edl.log_timestamp) = edl.capacity,
            edl.capacity,
            concat(ifnull(lag(edl.capacity) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.capacity)
        ) as capacity,

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.manufacturer) over (partition by edl.dev_id order by edl.log_timestamp) = edl.manufacturer,
            edl.manufacturer,
            concat(ifnull(lag(edl.manufacturer) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.manufacturer)
        ) as manufacturer,

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.notes) over (partition by edl.dev_id order by edl.log_timestamp) = edl.notes,
            edl.notes,
            concat(ifnull(lag(edl.notes) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.notes)
        ) as notes,

        edl.admin_id,
        edl.admin_name,
        edl.log_timestamp

    from ext_dev_log edl
) sub
order by sub.log_timestamp desc;

-- =====================================================================================================================
SELECT * FROM ext_dev_log;

delimiter $$
CREATE PROCEDURE search_ext_dev_log(
IN pkey varchar(30),
IN p_start_date datetime,
IN p_end_date datetime
)

BEGIN
	SELECT * FROM ext_dev_log_view 
	WHERE (pkey IS NULL 
	OR pkey =''
	OR dev_type LIKE concat('%',pkey,'%')
	OR dev_type LIKE concat('%',pkey,'%')
	OR dev_type LIKE concat('%',pkey,'%')
	OR dev_type LIKE concat('%',pkey,'%')
	OR dev_type LIKE concat('%',pkey,'%')
	OR dev_type LIKE concat('%',pkey,'%')
	OR dev_type LIKE concat('%',pkey,'%')
	)
END
delimiter;



