delete from user_purchased_product where id ='tjdfyd0817';

select * from user;

truncate user_purchased_product;
truncate usage_history;
update seats set occupied = false , id=null , upp_code = null;

update seats set occupied = false, id = null , upp_code = null;
update user set ben_cause = null , unben_cause = null  , benned = 0 , ben_count = 0;

update user set user_name = '이철순' where id = 'apple3234';

update seats set occupied = false, id = null , upp_code = null;

select * from usage_history where id = 'tjdfyd0817';
select * from user_purchased_product where id='tjdfyd0817';
select * from seats where id='tjdfyd0817';


select id,count(*) as count from usage_history
group by id
order by count desc;
-- ===
-- =========================================================================================================
update seats set occupied = false , id=null , upp_code = null where id='tjdfyd0817';
delete from user_purchased_product where id='tjdfyd0817';
delete from usage_history where id='tjdfyd0817';
-- =========================================================================================================

describe product;
select * from product;

ALTER TABLE seats 
ADD CONSTRAINT fk_user_id  -- 외래 키 이름 설정 (원하는 대로 변경 가능)
FOREIGN KEY (id) 
REFERENCES user(id);




-- 1. 테이블 생성
CREATE TABLE product (
    product_code INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    p_type VARCHAR(2),
    time_value INT,
    day_value INT,
    price INT NOT NULL,
    sell_count INT DEFAULT 0,
    refund_count INT DEFAULT 0
);

-- 2. 데이터 삽입
INSERT INTO product (p_type, time_value, day_value, price, sell_count, refund_count) 
VALUES 
('m', 180, 0, 9000, 6, 0),
('m', 600, 0, 28000, 12, 0),
('m', 1800, 0, 78000, 2, 0),
('m', 3000, 0, 125000, 3, 0),
('m', 4200, 0, 165000, 2, 0),
('m', 6600, 0, 198000, 6, 0),
('d', 0, 192, 50000, 20, 0),
('d', 0, 360, 80000, 6, 0),
('d', 0, 528, 100000, 9, 0),
('f', 0, 672, 130000, 7, 0),
('f', 0, 2016, 310000, 11, 0),
('f', 0, 4032, 680000, 5, 0);