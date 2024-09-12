create database project;
use project;

create table member_payment (
   member_payment_code int auto_increment primary key,
   id varchar(30),
   payment_date date not null,
   payment_option varchar(100),
   product_amount int,
   origin_price int not null,
   discount_coupon int,
   discount_event int,
   final_price int,
   recipient varchar(30),
   recipient_phone_number varchar(11),
   address_zip varchar(20),
   address varchar(100),
   address_detail varchar(50),
   delivery_state varchar(10),
   arrive_date date
);

create table non_member_payment (
   non_member_payment_code int auto_increment primary key,
   phone_number varchar(11),
   payment_date date not null,
   payment_option varchar(100),
   product_amount int,
   origin_price int not null,
   final_price int,
   recipient varchar(30),
   recipient_phone_number varchar(11),
   address_zip varchar(20),
   address varchar(100),
   address_detail varchar(50),
   delivery_state varchar(10),
   arrive_date date
);

create table review (
   review_code int auto_increment primary key,
   product_code varchar(100) not null,
   id varchar(30),
   star_count int not null,
   regdate date not null,
   content varchar(1000) not null,
   image varchar(2000)
);

create table coupon(
coupon_code int primary key auto_increment,
title varchar(30) not null,
discount_rate int(2),
max int(5),
start date not null,
end date not null
);

create table customer_coupon(
id varchar(30),
coupon_code int
);

create table event(
event_code int primary key auto_increment,
title varchar(30) not null,
content varchar(1000) not null,
image varchar(2000),
discount_rate int(2),
start date,
end date
);

create table notice(
notice_code int primary key auto_increment,
category varchar(10) not null,
title varchar(100) not null,
content varchar(1000) not null,
image varchar(2000),
regdate date,
view int default 0
);

create table faq(
faq_code int primary key auto_increment,
category varchar(10) not null,
title varchar(100) not null,
content varchar(1000) not null,
regdate date
);

create table inquiry(
inquiry_code int primary key auto_increment,
id varchar(30),
category varchar(20) not null,
title varchar(100) not null,
content varchar(1000) not null,
attached_data varchar(100),
inquiry_regdate date,
answer_check boolean default 0,
answer varchar(100),
answer_regdate date
);


create table member_payment_detail(
member_payment_code int,
id varchar(30) not null,
product_code varchar(30),
amount int
);

create table non_member_payment_detail(
non_member_payment_code int ,
phone_number varchar(11) not null,
product_code varchar(30),
amount int
);

create table user (
   id Varchar(30) Primary key,
   password Varchar(100) Not null,
   name Varchar(30) Not null,
   phone_number Varchar(11) Not null,
   birthday date Not null,
   address_zip Varchar(20),
   address Varchar(100),
   address_detail Varchar(50),
   profile_image Varchar(300),
   nickname Varchar(10),
   terms_of_service Boolean Default 0 Not null,
   ad_check_email Boolean Default 0 Not null,
   ad_check_sms Boolean Default 0 Not null,
   point Int(7) Default 0,
   join_date Date,
   delete_date Date
);

create table non_member (
   phone_number Varchar(11) Primary key,
   name Varchar(30) Not null,
   address_zip Varchar(20) Not null,
   address Varchar(100) Not null,
   address_detail Varchar(50) Not null,
   password Int(4) Not null
);

create table delivery_address (
   address_code Int Auto_increment Primary key,
   user_id Varchar(30) Not null,
   name Varchar(30),
   address_zip Varchar(20) Not null,
   address Varchar(100) Not null,
   address_detail Varchar(50) Not null,
   address_as Varchar(10) Not null
);


create table bookmark(
bookmark_code int primary key auto_increment,
id varchar(30),
product_code Int not null,
protype int not null,
domestic int not null,
title Varchar(100) Not null,
image Varchar(2000),
price Int Not null
);

desc bookmark;


create table cart(
cart_code int primary key auto_increment,
id varchar(30),
product_code Int not null,
protype int not null,
domestic int not null,
title Varchar(100) Not null,
image Varchar(2000),
proamount int not null default 1,
price Int Not null
);
desc cart;

create table product (
   product_code Int Auto_increment Primary key,
   protype varchar(2) not null default 1,
   domestic varchar(2),
   writer varchar(30),
   title Varchar(100) Not null,
   translator Varchar(30),
   publisher Varchar(30) Not null,
   publish_date varchar(255) Not null,
   category Varchar(10),
   genre Varchar(10),
   summary Varchar(1000),
   image Varchar(2000),
   intro_image Varchar(2000),
   content Varchar(1000),
   price Int Not null,
   stack Int not null,
   sellcount int not null default 0,
   gradeavg double,
   viewcount int,
   regdate date,
   moddate date
);

desc product;
alter table product modify publish_date varchar(255) not null;

ALTER TABLE product
change COLUMN sell_count sellcount INT NOT NULL;



desc product;
desc writer;

SELECT * FROM product p ORDER BY p.sellcount DESC limit 3;

select * from product;


-- alter user 'root'@'localhost' identified with mysql_native_password by 'fox';

create table writer (
   writer_code int auto_increment primary key,
   writer varchar(30) default '작자미상',
   birthday date,
   major_work varchar(100),
   introduction varchar(2000)
);      

-- alter table user modify terms_of_service boolean default 0;
-- alter table user modify ad_check_email boolean default 0;
-- alter table user modify ad_check_sms boolean default 0;

desc recentview;

 update product set sell_count=0 where sell_count is Null;
 alter table product modify sell_count int not null default 0;
alter table product modify product_type varchar(4) not null default 'book';

alter table product modify protype varchar(2) not null;
alter table product modify domestic varchar(2) not null;

update product set gradeavg=0 where gradeavg is Null;
update product set viewcount=0 where viewcount is Null;


desc cart;
desc product;
select * from product;
select * from cart;

alter table delivery_address add basic_address boolean default false;

SELECT * FROM Product WHERE domestic = '1' AND category IS NULL OR category = 'novel'
		AND genre IS NULL OR genre = 'melo';
        
SELECT * FROM Product WHERE writer = '히가시노게이고' and domestic = '1' AND category = 'novel'
AND genre = 'fantasy';

select * from product;

select * from recentview;
 
desc product;

select * from product where domestic = 1 and price between 7000 and 26000;

alter table user modify birthday int not null;

select * from user;

select * from recentview;

ALTER TABLE Product
ADD COLUMN gradeavg double,
ADD COLUMN viewcount INT;

ALTER TABLE Product
ADD COLUMN regdate date,
add column moddate date;

create table recentview (
	rvcode int primary key auto_increment,
	id Varchar(30),
	product_code int,
	protype varchar(2),
	title Varchar(100),
	image Varchar(2000),
	price Int,
    regdate date,
    moddate date
);

desc recentview;

create table member_payment (
   member_payment_code int auto_increment primary key,
   id varchar(30),
   payment_date date not null,
   payment_option varchar(100),
   payment_option_detail varchar(100),
   product_amount int,
   origin_price int not null,
   discount_coupon int,
   discount_point int,
   final_price int,
   recipient varchar(30),
   recipient_phone_number varchar(11),
   address_zip varchar(20),
   address varchar(100),
   address_detail varchar(50),
   delivery_state varchar(10),
   arrive_date date,
   payment_cancel int not null default 1
);


create table member_payment_detail(
member_payment_code int,
id varchar(30) not null,
product_code int,
proamount int
);

desc member_payment;
select * from member_payment;

desc member_payment_detail;
select * from member_payment_detail;

desc product;

drop table member_payment_detail;

create table member_payment_detail(
member_payment_detail_code int primary key auto_increment,
member_payment_code int,
id varchar(30) not null,
product_code int,
proamount int,
payment_date date,
origin_price int,
final_price int,
delivery_state varchar(10),
arrive_date date,
protype varchar(2),
domestic varchar(2),
title varchar(100),
image varchar(2000),
price int
);

drop table member_payment;

create table member_payment (
   member_payment_code int auto_increment primary key,
   id varchar(30),
   payment_date date not null,
   payment_option varchar(100),
   payment_option_detail varchar(100),
   product_amount int,
   origin_price int not null,
   coupon_code int,
   discount_coupon int,
   discount_point int,
   final_price int,
   recipient varchar(30),
   recipient_phone_number varchar(11),
   address_zip varchar(20),
   address varchar(100),
   address_detail varchar(50),
   delivery_state varchar(10),
   arrive_date date,
   payment_cancel int not null default 1
);


select * from user;

truncate user;


ALTER TABLE inquiry
ADD COLUMN moddate DATE;

ALTER TABLE inquiry
ADD COLUMN regdate DATE;

select * from user;

desc inquiry;
