CREATE TABLE policytiles (
    tilekey VARCHAR(10) PRIMARY KEY,
    tiletype ENUM('facist', 'liberal') NOT NULL
);

select * from policytiles
order by substring(tilekey,1,1), cast(substring(tilekey,2,2) as unsigned); -- (cardkey,2,1)로 하면, f10의 0이 인식이 안된서 안된다.

-- ==========================================================================================================================================================
delimiter //
create procedure create_policyTiles()
begin
	declare i int default 1;
    declare j int default 1;
    declare inserted_tilekey varchar(10); -- 반드시 선언을 먼저 해줘야한다.
    
    while i<=11 do
		set inserted_tilekey = concat('f',i);
		insert into policytiles(tilekey,tiletype)
		values(inserted_tilekey , 'facist');
		set i = i+1;
	end while;
    
    while j<=6 do
		set inserted_tilekey= concat('l',j);
		insert into policytiles(tilekey,tiletype)
		values(inserted_tilekey , 'liberal');
		set j = j+1;
	end while;
end //
delimiter ;

call create_policyTiles();
