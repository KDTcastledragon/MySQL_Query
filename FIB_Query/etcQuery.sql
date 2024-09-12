select * from seats where occupied = true;


update product set sell_count = 3 where price =150000;

select * from user;

select * from bookmark;

-- alter table bookmark modify column id varchar(100) not null;

truncate bookmark;

describe review;
select * from review;

select * from product;
select product_code,sellcount from product where protype=1 order by sellcount;
update product set sellcount = sellcount *2 + 102 where sellcount<=100;

delimiter //
create procedure temp_insert_review ()
begin
	declare pcode int default 1;
    declare contents varchar(30) default '리뷰';
    declare tempid varchar(30) default concat('test', pcode ,'@naver.com');
    declare rvidx int;
    declare sellamount int;
    
	while pcode <=53 do
		select sellcount into sellamount from product where product_code = pcode;
		set rvidx = 1;
        
			while rvidx <= floor(sellamount/2 + floor(1+(rand()*10))) do
				INSERT INTO review (product_code, id, star_count, regdate, content, image)
				VALUES (pcode, tempid, floor(1+(rand()*5)), now(), contents, null);
				set rvidx = rvidx+1;
			end while;
            
		set pcode = pcode +1;
    
    end while;

end //
delimiter ;

call temp_insert_review();

CREATE TABLE review (
    review_code INT AUTO_INCREMENT PRIMARY KEY,
    product_code INT not null,
    id VARCHAR(100) not null,
    star_count INT,
    regdate VARCHAR(20),
    content VARCHAR(1000),
    image VARCHAR(2000)
);

drop table review;

drop procedure temp_insert_review;

