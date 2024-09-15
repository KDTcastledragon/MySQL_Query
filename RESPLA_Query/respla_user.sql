create table user(
	id varchar(100) primary key,
    password varchar(1000) not null default 'tjdfyd123!',
    
    user_name varchar(30) default '김경식',
    birth TIMESTAMP DEFAULT '1996-08-17',
    phone_number varchar(11) default '01038193018',
    
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
describe user;

select * from user;
drop table user;

insert into user(id)
values('weaecwebrc'),('krbepg'),('losrebtArk'),('130beben'),('ben1139'),('imben0013'),('abcdefghabcdefgh')
,('magic34'),('warcraft3'),('lostromm'),('666beben'),('ben77777'),('imben001311'),('abcdefghabcdefgh2')
,('chase777'),('wow'),('isaman'),('999beben'),('bwef39'),('imbbbbbb3'),('565654dfsgh'),('admin');

update user set is_benned = true  where id like '%ben%'; -- 그냥 임시리

describe user;

