create table asset(
asset_id varchar(30) primary key,
asset_type varchar(20),
grade varchar(10),
emp_id varchar(8),
emp_name varchar(30),
org_id varchar(3),
org_name varchar(10),
dept_id varchar(3),
dept_name varchar(20),
location varchar(30),
pur_date date,
exp_date date,
owns_type varchar(10),
cost int,
ipv4_octet1 varchar(3),
ipv4_octet2 varchar(3),
ipv4_octet3 varchar(3),
ipv4_octet4 varchar(3),
usage_type varchar(10),
model varchar(50),
serial_num varchar(50),
repl_date date,
notes varchar(1000)
-- constraint fk_emp_id foreign key(emp_id) references emp (emp_id),
-- constraint fk_dept_id foreign key(dept_id) references dept (dept_id)
);

describe emp;