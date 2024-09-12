
CREATE TABLE gamesetting (
    gamecode VARCHAR(50) PRIMARY KEY,
    gamemodekey varchar(10),
    
    totalplayer INT,
    facist INT ,
    liberal INT ,
    h INT ,
    
    turncyclelength int ,
    
    winner ENUM('facist', 'liberal') default null
    
    -- foreign key (gamemodekey) references gamemode (gamemodekey),
--     foreign key (totalplayer) references gamemode (totalplayer),
--     foreign key (facist) references gamemode (facist),
--     foreign key (liberal) references gamemode (liberal),
--     foreign key (h) references gamemode (h),
--     foreign key (turncyclelength) references gamemode (turncyclelength)
);

call procedure_gameInfoTable('game3');
call insert_gameInfo('game0_info','game0','5p1f',5,1);

-- =====임시 내가 물어볼꺼임ㅇㅇㅇㅇ========================================================================
DELIMITER $$

CREATE PROCEDURE procedure_gameInfoTable(in gc VARCHAR(50))
BEGIN

    SET @gameSettingSql = CONCAT(
        'CREATE TABLE ' ,
        gc,'_info',
        ' (',
        'gamecode VARCHAR(50) PRIMARY KEY, ',
        'gamemodekey VARCHAR(10), ',
        'totalplayer INT, ',
        'facist INT, ',
        'liberal INT, ',
        'h INT, ',
        'turncyclelength INT )'
    );

    -- 동적 SQL 실행
    PREPARE stmt FROM @gameSettingSql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
END $$

DELIMITER ;

drop procedure procedure_gameInfoTable;
-- ======================================================================================================================================================

drop procedure insert_gameInfo;
-- ======================================================================================================================================================
delimiter //
create procedure insert_gameInfo(in TableNameParam varchar(255), in gamecodeParam varchar(20)  , in gamemodekeyParam varchar(10) ,
in totalplayerParam INT ,in facistParam INT)
begin
	SET @insertGameInfoSql = CONCAT(
        'INSERT INTO ', TableNameParam, ' (gamecode, gamemodekey, totalplayer, facist, liberal, h, turncyclelength) ',
        'VALUES (', 
        QUOTE(gamecodeParam), ', ', 
        QUOTE(gamemodekeyParam), ', ', 
        totalplayerParam, ', ', 
        facistParam, ', ', 
        totalplayerParam - facistParam, ', ', 
        '1, ', 
        totalplayerParam , ')'
    );

    -- 동적 SQL 실행
    PREPARE stmt FROM @insertGameInfoSql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
end //
delimiter ;