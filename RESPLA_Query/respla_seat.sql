create table seats(
	seat_num int,
    occupied boolean default false,
    id varchar(255) default null,
    upp_code varchar(100) default null,
    total_occupied_time_count int
);

select * from seats where occupied = true;
ALTER TABLE seats MODIFY COLUMN id VARCHAR(255);
delimiter //
create procedure create_seat()
begin
	declare num int default 1;
    
    while num<=100 do
    insert into seats(seat_num)
    values(num);
    set num = num+1;
    end while;
    
end //
delimiter ;

call create_seat();
-- drop procedure create_seat;
