create table user(
	id varchar(100) primary key,
    password varchar(1000) not null,
    
    user_name varchar(30),
    birth date,
    phone_number varchar(11),
    
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deactivation_date TIMESTAMP,
    
    benned boolean default false,
    ben_cause varchar(3000) default null,
    unben_cause varchar(3000) default null,
    ben_count int default 0
);

create table permanent_benned_user(
	user_name varchar(30) default '김경식',
    birth TIMESTAMP DEFAULT '1996-08-17',
    phone_number varchar(11) default '01038193018'
);

alter table user modify ben_cause varchar(3000);
alter table user modify birth date not null;
alter table user modify user_name varchar(30) not null;
alter table user modify phone_number varchar(11) unique not null;

describe user;

select * from user;
-- drop table user;
truncate user;

update user set is_benned = true  where id like '%ben%'; -- 그냥 임시리

describe user;

delete from user where id = 'tjdfyd0817';
delete from user where id = 'whatthe11';

-- ==================================================================================================================================================
create table administrator(
	id varchar(100) primary key,
    password varchar(1000) not null,
    
    admin_name varchar(30),
    admin_phone_number varchar(11),
    
    authority enum('admin','superAdmin','initAdmin') not null,
    
    latest_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

insert into administrator(id,password,admin_name,admin_phone_number,authority)
values('abcdefg11234567','uiernkv0898##!','김사무엘루','01014595148','admin'); -- uiernkv0898##!

select * from administrator;

-- truncate administrator;
-- drop table administrator;

create table admin_history(
	id varchar(100) primary key,
	action_type varchar(100),
    action_time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);