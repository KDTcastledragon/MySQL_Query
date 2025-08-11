create database daelim;

select * from emp;
describe emp;

create table emp(
emp_id varchar(8) primary key,
emp_name varchar(30) not null unique,
birth date,
phone_number varchar(11) unique,
email varchar(20) unique,
salary int,
hire_date date,
resg_date date
);

create table dept(
dept_id varchar(3) primary key,
dept_name varchar(20) not null unique,
org_id varchar(3),
org_name varchar(20),
dept_loc varchar(10),
dept_desc varchar(1000)
-- constraint fk_org_id foreign key(org_id) references org(org_id)
);

create table org(
org_id varchar(3) primary key,
org_name varchar(20) not null unique,
org_desc varchar(1000)
);

create table pos(
pos_id varchar(3) primary key,
pos_name varchar(10) not null unique,
pos_grade int,
pos_salary int
);

create table assets(
assets_id varchar(30) primary key,
assets_type varchar(20),
grade varchar(10),
emp_id varchar(8),
emp_name varchar(30),
org_id varchar(3),
org_name varchar(20),
location varchar(30),
pur_date date,
exp_date date,
owns_type varchar(10),
cost int,
ip_address varchar(45),
usage_type varchar(10),
model varchar(50),
serial_num varchar(50),
repl_date date,
notes varchar(1000)
-- constraint fk_emp_id foreign key(emp_id) references emp (emp_id),
-- constraint fk_org_id foreign key(org_id) references org (org_id)
);

create table management_log(
log_id varchar(100) primary key,
assets_id varchar(30),
mod_opt varchar(20),
mod_datetime timestamp default current_timestamp,
admin_id varchar(30),
log_desc varchar(1000)
-- constraint fk_assets_id foreign key(assets_id) references assets(assets_id)
);

drop table assets;





