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