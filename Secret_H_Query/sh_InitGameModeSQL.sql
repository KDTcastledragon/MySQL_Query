create table gamemode(
	gamemodekey varchar(10) primary key,
	totalplayer INT DEFAULT 5,
    facist INT DEFAULT 1,
    liberal INT DEFAULT 3,
    h INT DEFAULT 1,
    
    turncyclelength int default 5,
    
    CONSTRAINT check_totalplayer CHECK (totalplayer BETWEEN 5 AND 10),
    CONSTRAINT check_h CHECK (h = 1),
    CONSTRAINT check_liberal CHECK (liberal = totalplayer - facist),
    CONSTRAINT check_turncyclelength CHECK (turncyclelength = totalplayer)
);

select * from gamemode 
order by  cast(substring_index(gamemodekey, 'p', 1) AS UNSIGNED); -- ,cast(substring_index(substring_index(gamemodekey, 'p', -1), 'f', 1) AS UNSIGNED);

call insert_gamemode();

delimiter //
create procedure insert_gamemode()
begin
	declare tot int default 5;
    declare fac int default 1;
    declare i int default 1;
    declare inserted_key varchar(5);
    
    while tot<=10 do
        set i = 1;
        
		while i<=2 do
			set inserted_key = concat(tot,'p',fac,'f');
			insert into gamemode(gamemodekey , totalplayer,facist,liberal,h,turncyclelength)
			values(inserted_key, tot , fac , tot-fac , 1 , tot);
            set tot = tot + 1;
            set i = i+1;
		end while;
        
        set fac = fac + 1;
        
	end while;
end //
delimiter ;
