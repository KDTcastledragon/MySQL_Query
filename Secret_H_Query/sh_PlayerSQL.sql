CREATE TABLE users (
    id VARCHAR(20) PRIMARY KEY,
    nick_name VARCHAR(40),
    lie_probability DECIMAL(5 , 3)
);

CREATE TABLE players (
    id VARCHAR(20) PRIMARY KEY,
    nick_name VARCHAR(40),
    traced_lie_probability DECIMAL(5 , 3),
    
    -- 생사여부 ( 사망시 true가 되며 게임종료 전까지 바뀌지 않음)
    is_dead BOOLEAN DEFAULT FALSE,
    
    -- 순서, 역할, 소속 정당 (게임시작과 동시에 정해지며 게임종료 전까지 바뀌지 않음)
    turn_order INT DEFAULT 0,
    affiliation ENUM('h', 'facist', 'liberal'),
    party ENUM('facist', 'liberal'),
    
    -- 턴차례 , 행정직위 , 찬반투표 (매 round마다 바뀔 수 있음)
    is_player_turn boolean default false,
    current_position ENUM('president', 'chanceller', 'citizen') DEFAULT 'citizen',
    vote BOOLEAN,
    
    -- 파시스트일 확률(매번 바뀔수 있음)
    traced_facist_probability DECIMAL(5 , 3)
);

CREATE TABLE president (
    -- 실제 행동(본인만 알 수 있음)
    draw_tiles1 VARCHAR(10),
    draw_tiles2 VARCHAR(10),
    draw_tiles3 VARCHAR(10),
    
    discarded_tile1 VARCHAR(10),
    
    receive_tile1 VARCHAR(10),
    receive_tile2 VARCHAR(10),
    
    -- 진술(거짓일 수 있음)
    stmt_draw1 ENUM('facist', 'liberal'),
    stmt_draw2 ENUM('facist', 'liberal'),
    stmt_draw3 ENUM('facist', 'liberal'),
    
    stmt_discarded1 ENUM('facist', 'liberal'),
    
    stmt_receive1 ENUM('facist', 'liberal'),
    stmt_receive2 ENUM('facist', 'liberal'),
    
    -- 행정처리 (모두에게 공개)
    executive_action ENUM('investigate', 'call_special', 'peek', 'execution', 'consent', 'reject')
);

CREATE TABLE chanceller (
    -- 실제 행동(본인만 알 수 있음)
    received_tile1 VARCHAR(10),
    received_tile2 VARCHAR(10),
    
    -- 실제 행동(본인만 알 수 있음)
    discarded_tile2 VARCHAR(10),
    
    -- 정책 발의(모두에게 공개됨)
    Legislative_action ENUM('facist', 'liberal'),
    
    -- 진술(거짓일 수 있음)
    stmt_received1 ENUM('facist', 'liberal'),
    stmt_received2 ENUM('facist', 'liberal'),
    
	stmt_discarded_tile2 VARCHAR(10),
    
	-- 행정처리 (모두에게 공개)
    executive_action ENUM('veto')
);
