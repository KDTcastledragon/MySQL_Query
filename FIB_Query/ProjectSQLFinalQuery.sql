drop table user;

drop table non_member;
drop table non_member_payment;
drop table non_member_payment_detail;

create table user  (
id varchar(100) primary key,
password varchar(100) not null,
name varchar(30) not null,
phone_number varchar(11) not null,
birthday varchar(8),
address_zip varchar(20),
address varchar(100),
address_detail varchar(100),
profile_image varchar(2000),
nickname varchar(10),
ad_check_email boolean not null default false,
ad_check_sms boolean not null default false,
point int default 0,
join_date date ,
delete_date date
);

drop table delivery_address;

create table delivery_address (
address_code int auto_increment primary key,
user_id varchar(100) not null,
name varchar(30),
address_zip varchar(20) not null,
address varchar(100) not null,
address_detail varchar(100) not null,
address_as varchar(20),
basic_address boolean not null default false,
phone_number varchar(11)
);

drop table coupon;

create table coupon(
coupon_code int primary key auto_increment,
category varchar(20) not null,
title varchar(30) not null,
discount_rate int(2),
max int(5),
image varchar(2000),
start varchar(20),
end varchar(20),
regdate varchar(20),
moddate varchar(20)
);

drop table user_coupon;

create table user_coupon(
id varchar(100),
coupon_code int,
start varchar(20),
end varchar(20),
use_check boolean not null default 0,
PRIMARY KEY (id, coupon_code)
);

drop table notice;

create table notice(
notice_code int primary key auto_increment,
category varchar(20) not null,
title varchar(100) not null,
content varchar(1000) not null,
image varchar(2000),
view int not null default 0,
regdate date
);

drop table faq;

create table faq(
faq_code int primary key auto_increment,
category varchar(20) not null,
title varchar(100) not null,
content varchar(1000) not null
);

drop table inquiry;

create table inquiry(
inquiry_code int primary key auto_increment,
id varchar(100),
category varchar(20) not null,
title varchar(100) not null,
content varchar(1000) not null,
attached_data varchar(1000),
inquiry_regdate date,
answer_check boolean not null default 0,
answer varchar(1000),
answer_regdate date
);

select * from product;

drop table product;

create table product (
   product_code Int Auto_increment Primary key,
   protype varchar(2) not null default 1,
   domestic varchar(2),
   writer varchar(30),
   title Varchar(100) Not null,
   translator Varchar(30),
   publisher Varchar(30) Not null,
   publish_date varchar(20) Not null,
   category Varchar(20),
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
   regdate varchar(20),
   moddate varchar(20)
);

drop table bookmark;

create table bookmark(
   bookmark_code int primary key auto_increment,
   id varchar(100),
   product_code Int not null,
   protype varchar(2) not null,
   domestic varchar(2) not null,
   title Varchar(100) Not null,
   image Varchar(2000),
   price Int Not null
);

drop table cart;

create table cart(
   cart_code int primary key auto_increment,
   id varchar(100),
   product_code Int not null,
   protype varchar(2) not null,
   domestic varchar(2) not null,
   title Varchar(100) Not null,
   image Varchar(2000),
   proamount int not null default 1,
   price Int Not null
);

drop table recentview;

create table recentview (
   rvcode int primary key auto_increment,
   id Varchar(100),
   product_code int,
   protype varchar(2),
   title Varchar(100),
   image Varchar(2000),
   price Int,
	regdate date,
    moddate date
);

drop table member_payment;

create table member_payment (
   member_payment_code int auto_increment primary key,
   id varchar(100),
   payment_date varchar(20),
   payment_option varchar(100),
   payment_option_detail varchar(100),
   product_amount int,
   origin_price int,
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
   arrive_date varchar(20),
   payment_cancel int not null default 0
);

drop table member_payment_detail;

desc member_payment_detail;

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
price int,
payment_cancel int not null default 0,
orderstate int not null default 0
);

drop table review;

create table review (
   review_code int auto_increment primary key,
   product_code int,
   id varchar(100),
   star_count int,
   regdate varchar(20),
   content varchar(1000),
   image varchar(2000)
);

select * from member_payment_detail;

select * from product;

select * from member_payment;

desc member_payment_detail;

desc member_payment;

-- update product set gradeavg=0 where product_code=????;

-- DELETE FROM product WHERE product_code = ????;

alter table member_payment_detail add payment_cancel int not null default 0;

alter table product modify moddate varchar(20);
alter table product modify regdate varchar(20);

alter table member_payment_detail add orderstate int not null default 0;


select product_code,title,domestic,category,genre from product where product_code=1 ;

-- 1 ,2 3 4 6 8 16 19

select * from product;

