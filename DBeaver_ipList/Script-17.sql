create table user (
	user_id varchar(30) primary key,
	user_pw varchar(2000) NOT null,
	user_name varchar(30),
	phone_num varchar(11) unique,
	birth date,
	thumbnail varchar(1000),
	join_date datetime default current_timestamp,
	latest_updated datetime default current_timestamp on update current_timestamp,
	withdrawal_date datetime default null
);

create table chatting (
chat_id bigint auto_increment primary key,
sender_id varchar(30) not null,
receiver_id varchar(30) not null,
message text,
send_time datetime default current_timestamp,
is_read boolean default false,
constraint fk_sender foreign key (sender_id) references user(user_id),
constraint fk_receiver foreign key (receiver_id) REFERENCES user(user_id)
);


create table friend (
req_id varchar(30),
fri_id varchar(30),
status varchar(15),
req_time datetime default current_timestamp,
acc_time datetime,
blo_time datetime,
primary key(req_id,fri_id),
constraint fk_req foreign key (req_id) references user(user_id),
constraint fk_fri foreign key (fri_id) references user(user_id)
);


create table chat_log (
ch_log_id bigint auto_increment primary key,
chat_id bigint,
sender_id varchar(30) not null,
receiver_id varchar(30) not null,
message text,
send_time datetime default current_timestamp,
);