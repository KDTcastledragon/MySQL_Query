create table game_mode(
	game_mode_key varchar(10) primary key,
	total_player INT DEFAULT 5,
    facist INT DEFAULT 1,
    liberal INT DEFAULT 3,
    h INT DEFAULT 1,
    
    turn_cycle_length int default 5,
    
    
    CONSTRAINT check_total_player CHECK (total_player BETWEEN 5 AND 10),
    CONSTRAINT check_h CHECK (h = 1),
    CONSTRAINT check_liberal CHECK (liberal = total_player - facist),
    CONSTRAINT check_turn_cycle_length CHECK (turn_cycle_length = total_player)
);

select * from game_mode
order by  cast(substring_index(game_mode_key, 'p', 1) AS UNSIGNED); -- ,cast(substring_index(substring_index(gamemodekey, 'p', -1), 'f', 1) AS UNSIGNED);

call insert_game_mode();
drop procedure insert_game_mode;

delimiter //
create procedure insert_game_mode()
begin
	declare tot int default 5;
    declare fac int default 1;
    declare i int default 1;
    declare inserted_key varchar(5);
    
    while tot<=10 do
        set i = 1;
        
		while i<=2 do
			set inserted_key = concat(tot,'p',fac,'f');
            
			insert into game_mode(game_mode_key , total_player,facist,liberal,h,turn_cycle_length)
			values(inserted_key, tot , fac , tot-fac , 1 , tot);
            
            set tot = tot + 1;
            set i = i+1;
		end while;
        
        set fac = fac + 1;
        
	end while;
end //
delimiter ;
