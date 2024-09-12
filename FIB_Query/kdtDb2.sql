create database kdt2;

create table member(
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

insert into member(id,password,name,age,jno,info,point,birthday,rid)
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


create table student(
sno int,
name varchar(30),
age int,
jno int,
info varchar(30),
point Double,
birthday varchar(30)
);

insert into student(sno,name,age,jno,info,point,birthday)
values
(1,'scv',33,1,'scvready',1.1,'1997-02-10'),
(2,'marine',29,2,'gogogo',2.3,'1997-03-10'),
(3,'marauder',31,2,'gogo',3.7,'1997-05-10'),
(4,'ghost',22,2,'execution',4.9,'1997-06-10'),
(5,'siegetank',33,3,'yessir',33.7,'1997-02-11'),
(6,'hellion',33,3,'burnIt',13.3,'1997-02-15'),
(7,'widowmine',2,3,'ggigigik',11.1,'1997-09-3'),
(8,'cyclone',33,3,'cycloneready',15.9,'1997-02-14'),
(9,'thor',43,3,'thorIsHere',75.3,'1997-08-10'),
(10,'viking',31,4,'okdk',28.9,'1997-08-10'),
(11,'medivac',32,4,'in the pipe five by five',22.2,'1997-08-10'),
(12,'banshee',32,4,'engineGood',41.7,'1997-09-3'),
(13,'raven',41,4,'ravenOperate',88.8,'1997-09-3'),
(14,'battlecruiser',66,5,'battlecruiserOperation',100.0,'1997-09-3'),
(15,'raynor',30,7,'theHero',999.3,'1997-09-3');

create table product (
   product_code Int Auto_increment Primary key,
   writer_code Int Not null,
   product_type Varchar(2) Not null,
   title Varchar(100) Not null,
   translator Varchar(30),
   publisher Varchar(30) Not null,
   publish_date Date Not null,
   domestic boolean Default 1 Not null,
   category Varchar(10) Not null,
   genre Varchar(10) Not null,
   summary Varchar(1000),
   image Varchar(2000),
   intro_image Varchar(2000),
   content Varchar(1000),
   price Int Not null,
   stack Int Default 100,
   sell_count Int Default 0
);

create table member_payment_detail(
member_payment_code int,
id varchar(30) not null,
product_code int,
amount int
);

create table non_member_payment_detail(
non_member_payment_code int ,
phone_number varchar(11) not null,
product_code int,
amount int
);

drop table customer_coupon;

create table customer_coupon(
customer_coupon_code int primary key auto_increment,
id varchar(30),
coupon_code int
);

show tables;
desc customer_coupon;

-- need update from admin : product , coupon , notice , user , writer , review 