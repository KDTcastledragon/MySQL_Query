create table ext_dev (
dev_id varchar(20) primary key,
dev_type varchar(20) not null,
registered_dlp boolean default false,
controlled_dlp boolean default false,
dev_status varchar(10) default '보관',
emp_id varchar(8),
emp_name varchar(40),
dept_id varchar(15),
dept_name varchar(15),
location varchar(20),
valid_date date,
usage_purpose varchar(1000),
cmd_model varchar(40),
cmd_serial_num varchar(40),
dlp_model varchar(40),
dlp_serial_num varchar(40),
capacity int,
manufacturer varchar(40),
notes varchar(1000)
);

alter table ext_dev modify manufacturer varchar(40);
-- alter table ext_dev change status dev_status varchar(10);

-- alter table ext_dev add column status varchar(10) default '보관';
-- alter table ext_dev modify status varchar(10);

describe ext_dev;
drop procedure modify_ext_dev2;
show procedure status;
show tables;
describe ext_dev_log;