select seq,id,title from board order by root desc , step asc limit 10,5;

create table student(
id varchar(30),
password varchar(30),
name varchar(30),
age int,
jno int,
info varchar(30),
point Double,
birthday varchar(30),
rid varchar(30)
);

insert into student(id,password,name,age,jno,info,point,birthday,rid)
values
('scv','12345!','scv',33,1,'scvready',1.1,'1997-02-10','terren'),
('marine','12345!','marine',29,2,'gogogo',2.3,'1997-03-10','terren'),
('marauder','12345!','marauder',31,2,'gogo',3.7,'1997-05-10','terren'),
('ghost','12345!','ghost',22,2,'execution',4.9,'1997-06-10','terren'),
('siegetank','12345!','siegetank',33,3,'yessir',33.7,'1997-02-11','terren'),
('hellion','12345!','hellion',33,3,'burnIt',13.3,'1997-02-15','terren'),
('widowmine','12345!','widowmine',2,3,'ggigigik',11.1,'1997-09-3','terren'),
('cyclone','12345!','cyclone',33,3,'cycloneready',15.9,'1997-02-14','terren'),
('thor','12345!','thor',43,3,'thorIsHere',75.3,'1997-08-10','terren'),
('viking','12345!','viking',31,4,'okdk',28.9,'1997-08-10','terren'),
('medivac','12345!','medivac',32,4,'in the pipe five by five',22.2,'1997-08-10','terren'),
('banshee','12345!','banshee',32,4,'engineGood',41.7,'1997-09-3','terren'),
('raven','12345!','raven',41,4,'ravenOperate',88.8,'1997-09-3','terren'),
('battlecruiser','12345!','battlecruiser',66,5,'battlecruiserOperation',100.0,'1997-09-3','terren'),
('raynor','12345!','raynor',30,7,'theHero',999.3,'1997-09-3','terren');

select * from member;