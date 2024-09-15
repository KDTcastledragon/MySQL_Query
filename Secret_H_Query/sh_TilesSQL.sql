CREATE TABLE policy_tiles (
    tile_key VARCHAR(10) PRIMARY KEY,
    tile_type ENUM('facist', 'liberal') NOT NULL
);

select * from policy_tiles
order by substring(tile_key,1,1), cast(substring(tile_key,2,2) as unsigned); -- (tile_key,2,1)로 하면, f10의 0이 인식이 안된서 안된다.

-- ==========================================================================================================================================================
delimiter //
create procedure create_policy_tiles()
begin
	declare i int default 1;
    declare j int default 1;
    declare inserted_tile_key varchar(10); -- 반드시 선언을 먼저 해줘야한다.
    
    while i<=11 do
		set inserted_tile_key = concat('f',i);
        
		insert into policy_tiles(tile_key,tile_type)
		values(inserted_tile_key , 'facist');
        
		set i = i+1;
	end while;
    
    while j<=6 do
		set inserted_tile_key= concat('l',j);
        
		insert into policy_tiles(tile_key,tile_type)
		values(inserted_tile_key , 'liberal');
        
		set j = j+1;
	end while;
end //
delimiter ;

call create_policy_tiles();
