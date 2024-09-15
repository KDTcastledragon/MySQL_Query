
select m.tile_order as '뽑을순서', m.tile_key as '메인타일' , d.tile_order as '버려진순서' , d.tile_key as '버려진타일' from main_deck m
left join discarded_deck as d on m.tile_order = d.tile_order
where game_code = ''
order by m.tile_order;

delete from main_deck where game_code='';
delete from discarded_deck where game_code='';

select * from discarded_deck order by tile_order;

-- ==========================================================================================================================================================

CREATE TABLE main_deck (
    game_code VARCHAR(50),
    tile_order INT,
    tile_key VARCHAR(10) DEFAULT NULL,
    tile_type ENUM('facist', 'liberal') NOT NULL
);

CREATE TABLE discarded_deck (
    game_code VARCHAR(50),
    tile_order INT,
    tile_key VARCHAR(10) DEFAULT NULL,
    tile_type ENUM('facist', 'liberal') NOT NULL
);

-- DELIMITER //

-- CREATE PROCEDURE create_deck(IN game_code VARCHAR(50))
-- BEGIN
--     DECLARE create_table_sql TEXT;

--     -- 테이블 생성 SQL 구문 동적 생성
--     SET create_table_sql = CONCAT(
--         'CREATE TABLE IF NOT EXISTS maindeck_', game_code, ' (',
--         'tileorder INT, ',
--         'tilekey VARCHAR(10) DEFAULT NULL, ',
--         'PRIMARY KEY (tileorder))'
--     );

--     -- 동적 SQL 실행
--     PREPARE stmt FROM create_table_sql;
--     EXECUTE stmt;
--     DEALLOCATE PREPARE stmt;

--     -- 추가적인 작업이 필요한 경우 여기에 작성
--     -- 예: 데이터 삽입 등
-- END //

-- DELIMITER ;

-- ==========================================================================================================================================================
-- delimiter //
-- create procedure insert_deckBox()
-- begin
-- 	declare i int default 1;
--     declare j int default 1;
--     
--     while i<=17 do
--     insert into main_deck(tileorder)
--     values(i);
--     set i = i+1;
--     end while;
--     
--     while j<=15 do
--     insert into discarded_deck(tileorder)
--     values(j);
--     set j=j+1;
--     end while;
-- end //
-- delimiter ;

-- call insert_deckBox();

-- ==========================================================================================================================================================
-- drop table policytiles;
drop table main_deck;
drop table discarded_deck;

-- drop procedure create_policyCards;
-- drop procedure create_deckBox;

-- select * from maindeck order by tileorder;