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


create table administrator(
admin_id varchar(30) primary key,
admin_pw varchar(1000) not null,
admin_name varchar(20),
admin_code varchar(30) default 'admin',
authority int default 1,
latest_logined datetime default null
);

INSERT INTO administrator (admin_id, admin_pw, admin_name, admin_code, authority)
VALUES
('22510231', '22510231!', '이성룡', 'admin', 3),
('admin1', '22510231!', '김철수', 'admin', 1),
('admin2', '22510231!', '이영희', 'admin', 1);

alter table administrator modify latest_logined datetime default null;
alter table administrator modify latest_logined datetime not null;

describe administrator;
select * from administrator;

show tables;