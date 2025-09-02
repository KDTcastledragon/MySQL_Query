insert into user (user_id,user_pw,user_name)
values('123','123','123'),('456','456','456'),('789','789','789'),('321','321','321'),('654','654','654'),('987','987','987');

insert into friend(req_id,fri_id,status)
values('123','456','accepted'),('123','789','accepted'),('123','321','accepted');


describe friend;
select * from friend;


create procedure get_friend_list(
	in p_user_id varchar(30)
)

begin
	select case
		when f.req_id = p_user_id then f.fri_id
		else f.req_id
		end as user_id,
		u2.user_name,
		u2.phone_num,
		u2.birth,
		u2.thumbnail
		from friend f
		join user u2 on (u2.user_id = f.req_id or u2.user_id = f.fri_id)
		where (f.req_id = p_user_id or f.fri_id = p_user_id)
		and f.status = 'accepted'
		and u2.user_id != p_user_id;
end


show procedure status;
select database();

use castle_chat;

CALL get_friend_list('123');


