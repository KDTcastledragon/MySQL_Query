create table product (
product_code int primary key auto_increment,
p_type varchar(2),
time_value int,
day_value int,
price int not null,
sell_count int default 0,
refund_count int default 0
);

insert into product(p_type ,time_value, day_value , price)
values('f',0,8760,1100000);

INSERT INTO product (product_code, p_type, time_value, day_value, price, sell_count, refund_count)
SELECT productcode, ptype, timevalue, dayvalue, price, sellcount, refundcount
FROM product_backup;

select * from product_backup;
select * from product;
delete from product where day_value = 1111;

create table product_backup as select * from product;
describe product_backup;
select * from product_backup;
truncate product;

insert into product(p_type ,time_value, day_value , price)
values
('m',0,8760,1100000),
('m',0,8760,1100000),
('m',0,8760,1100000),
('m',0,8760,1100000),
('m',0,8760,1100000),
('f',0,8760,1100000),
('f',0,8760,1100000),
('f',0,8760,1100000),
('f',0,8760,1100000),
('f',0,8760,1100000);

update product set price = 150000 where price = 1100000;
