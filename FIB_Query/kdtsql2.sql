create database kdt;

use kdt;

alter table member
modify password varchar(100);

update member set password = '$2a$10$BjHoMggcmEnSssiTpds1m.SQHd6QgDYcD4.EZksEwDi8q4wT2zSCO';