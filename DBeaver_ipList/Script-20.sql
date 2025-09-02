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

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.registered_dlp) over (partition by edl.dev_id order by edl.log_timestamp) = edl.registered_dlp,
            edl.registered_dlp,
            concat(ifnull(lag(edl.registered_dlp) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.registered_dlp)
        ) as registered_dlp,

        if(
            row_number() over (partition by edl.dev_id order by edl.log_timestamp) = 1
            or lag(edl.controlled_dlp) over (partition by edl.dev_id order by edl.log_timestamp) = edl.controlled_dlp,
            edl.controlled_dlp,
            concat(ifnull(lag(edl.controlled_dlp) over (partition by edl.dev_id order by edl.log_timestamp), ''), ' ▶ ', edl.controlled_dlp)
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
show procedure status;
drop procedure search_ext_dev_log;
describe ext_dev_log;
-- =====================================================================================================================
drop procedure if exists filter_ext_dev_log;
delimiter $$
CREATE PROCEDURE filter_ext_dev_log(
IN p_start_date datetime,
IN p_end_date datetime,
in p_opt varchar(20),
IN pkey varchar(40)

)

BEGIN
	SELECT * FROM ext_dev_log_view 
	WHERE (
	nullif(pkey,'') is null -- pkey가 ''이면 null / null일 경우 true로 판별하여, 밑의 or행들 전부 pass
	or dev_id like concat('%',pkey,'%')
	OR dev_type LIKE concat('%',pkey,'%')
	OR dev_status LIKE concat('%',pkey,'%')
	OR emp_id LIKE concat('%',pkey,'%')
	OR emp_name LIKE concat('%',pkey,'%')
	OR dept_name LIKE concat('%',pkey,'%')
	OR usage_purpose LIKE concat('%',pkey,'%')
	OR cmd_model LIKE concat('%',pkey,'%')
	OR cmd_serial_num LIKE concat('%',pkey,'%')
	OR dlp_model LIKE concat('%',pkey,'%')
	OR dlp_serial_num LIKE concat('%',pkey,'%')
	OR manufacturer LIKE concat('%',pkey,'%')
	OR notes LIKE concat('%',pkey,'%')
	OR admin_id LIKE concat('%',pkey,'%')
	) -- 검색어 기준 / where끝.
	
	and (
	p_start_date is null
	or p_end_date is null
	or (log_timestamp >=p_start_date and log_timestamp < date_add(p_end_date, interval 1 day)) 
	) -- 날짜 기준 / and끝.
	
	and (
	nullif(p_opt,'') is null
	or dev_type = p_opt
	) -- 장비 타입 기준 / and끝.
	
	order by log_timestamp desc;
END
delimiter;

use daelim;

-- =====================================================================================================================
create procedure search_ext_dev (
in p_word varchar(40),
in p_type varchar(20)
)

begin
	select * from ext_dev
	where (
	p_word is null
	or p_word = ''
	if(p_word === 'ONLY_DISCARDED_EXT_DEV_SEARCH' ) {dev_status = '폐기'}
	OR dev_id LIKE CONCAT('%', p_word, '%')
    OR dev_type LIKE CONCAT('%', p_word, '%')
    OR emp_name LIKE CONCAT('%', p_word, '%')
    OR dept_name LIKE CONCAT('%', p_word, '%')
    OR cmd_model LIKE CONCAT('%', p_word, '%')
    OR cmd_serial_num LIKE CONCAT('%', p_word, '%')
    OR dlp_model LIKE CONCAT('%', p_word, '%')
    OR dlp_serial_num LIKE CONCAT('%', p_word, '%')
    OR usage_purpose LIKE CONCAT('%', p_word, '%')
    OR location LIKE CONCAT('%', p_word, '%')
	) -- 검색어 끝.
	and (
	p_type is null
	or p_type =''
	or dev_type = p_type
	); -- 장비타입 끝.
end




