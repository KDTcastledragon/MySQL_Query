
   create table member(
   id varchar(10) primary key,
   password varchar(10) not null,
   name varchar(30),
   age int not null,
   jno int,
   info varchar(30),
   point double,
   birthday varchar(10),
   rid varchar(10)
   );

insert into member(id,password,name,age,jno,info,point,birthday,rid)
values('bae87','12345!','배정현',26,2,'준우 아빠',311,'1997-09-08','abc'),
('csh98','12345!','최승호',26,2,'1조',333,'1997-09-08','abc'),
('ezirenge','12345!','김이지렁이',26,2,'햄스터',333,'1997-09-08','abc'),
('haerim','12345!','김해림',26,2,'inㄷㅈㄹfo',111,'1789-12-31','abc'),
('hyejin11','12345!','신혜진',26,2,'iㄹㄷㅈnfo',111,'1789-12-31','abc'),
('jekichan','12345!','이성룡',26,2,'in3ㅈㄷㄻㅈㄷ24fo',111,'1996-08-17','abc'),
('jeseung','12345!','연제승',26,2,'inㄻㄷf324o',111,'1789-12-31','abc'),
('kongbori','12345!','조현주',26,2,'inf234ㄻㄷㅈo',111,'1789-12-31','abc'),
('memoire','12345!','이진기',26,2,'info243',111,'1boardjojo789-12-31','abc'),
('nameground','12345!','김진휘',26,2,'info3434',111,'1789-12-31','abc');

select host, user, authentication_string from root;

create table board(
seq int not null primary key auto_increment,
id varchar(10) not null,
title varchar(100) not null,
content text,
regdate datetime default current_timestamp on update current_timestamp,
cnt int default 0,
root int default 0,
step int default 0,
indent int default 0
);

create table jo(
jno int not null primary key,
jname varchar(10) not null,
id varchar(10) not null,
project varchar(10) not null,
slogan varchar(30) not null
);

insert into jo(jno,jname,id,project,slogan)
values(1,'119','bae87','펫밀리','애완동물을 위한 홈페이지'),
(2,'여우','haerim','여우책방','책으로 마음의 양식'),
(3,'i4','jeseung','단Dog','반려동물 한마리 한마리 소듕'),
(4,'최고조','ezirenge','tbtConcept','열정빼면 시체다'),
(5,'오조','wonee512','Ojoa','완주 아니면 죽어'),
(7,'칠면조','admin','관리팀','두잇썸띵');








