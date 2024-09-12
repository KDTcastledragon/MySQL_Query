select * from seats where occupied = true;


update product set sell_count = 3 where price =150000;

select * from user;

select * from bookmark;

truncate bookmark;
-- alter table bookmark modify column id varchar(100) not null;

select * from product;

select product_code,sellcount from product where protype=1 order by sellcount;
 -- update product set sellcount = sellcount *2 + 102 where sellcount<=100;


describe review;

select product_code, count(*) as rvc from review 
group by product_code
order by rvc;

select * from review where product_code = 31;

delimiter //
create procedure temp_insert_review ()
begin
	declare pcode int default 1;
    declare contents varchar(30);
    declare tempid varchar(30);
    declare rvidx int;
    declare sellamount int;
    declare random_value int;
    declare max_reviews int;
    
	while pcode <=53 do
		select sellcount into sellamount from product where product_code = pcode;
		set rvidx = 1;
        SET random_value = FLOOR(10 + (RAND() * (347 - 10 + 1)));
		SET max_reviews = LEAST(floor(sellamount / 2), random_value);
       
        
            while rvidx <= max_reviews do
				set contents = concat('리뷰',rvidx);
				set tempid = concat('test', pcode, rvidx * floor(rand()*35) ,'@naver.com');
                
				INSERT INTO review (product_code, id, star_count, regdate, content, image)
				VALUES (pcode, tempid, floor(1+(rand()*5)), now(), contents, null);
                
				set rvidx = rvidx+1;
                
			end while;
            
		update product set viewcount = rvidx where product_code = pcode;
        
        update product 
        set gradeavg = (select avg(star_count) from review where product_code =pcode)
        where product_code = pcode;
        
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

