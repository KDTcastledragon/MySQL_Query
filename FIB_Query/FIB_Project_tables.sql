create database fake_fox;

use fake_fox;

create table cart(
cart_code int primary key auto_increment,
id varchar(30),
product_code int,
cart_amount int default 1
);

create table bookmark(
id varchar(30),
product_code int
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

desc cart;
desc bookmark;
desc member_payment_detail;
desc non_member_payment_detail;