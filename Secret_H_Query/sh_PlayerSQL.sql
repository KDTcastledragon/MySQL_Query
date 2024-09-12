CREATE TABLE users (
    id VARCHAR(20) PRIMARY KEY,
    nickname VARCHAR(40),
    lieprobability DECIMAL(5 , 3)
);

CREATE TABLE players (
    userid VARCHAR(20) PRIMARY KEY,
    nickname VARCHAR(40),
    lieprobability DECIMAL(5 , 3),
    
    -- 생사여부 ( 사망시 true가 되며 게임종료 전까지 바뀌지 않음)
    isdead BOOLEAN DEFAULT FALSE,
    
    -- 순서, 역할, 소속 정당 (게임시작과 동시에 정해지며 게임종료 전까지 바뀌지 않음)
    turnorder INT DEFAULT 0,
    affiliation ENUM('h', 'facist', 'liberal'),
    party ENUM('facist', 'liberal'),
    
    -- 턴차례 , 행정직위 , 찬반투표 (매 round마다 바뀔 수 있음)
    isplayerturn boolean default false,
    currentposition ENUM('president', 'chanceller', 'citizen') DEFAULT 'citizen',
    vote BOOLEAN,
    
    -- 파시스트일 확률(매번 바뀔수 있음)
    facistprobability DECIMAL(5 , 3)
);

CREATE TABLE president (
    -- 실제 행동(본인만 알 수 있음)
    drawtiles1 VARCHAR(10),
    drawtiles2 VARCHAR(10),
    drawtiles3 VARCHAR(10),
    
    discardedtile1 VARCHAR(10),
    
    receivetile1 VARCHAR(10),
    receivetile2 VARCHAR(10),
    
    -- 진술(거짓일 수 있음)
    stmtdraw1 ENUM('facist', 'liberal'),
    stmtdraw2 ENUM('facist', 'liberal'),
    stmtdraw3 ENUM('facist', 'liberal'),
    
    stmtdiscarded1 ENUM('facist', 'liberal'),
    
    stmtreceive1 ENUM('facist', 'liberal'),
    stmtreceive2 ENUM('facist', 'liberal'),
    
    -- 행정처리 (모두에게 공개)
    executiveaction ENUM('investigate', 'callelection', 'peek', 'execution', 'consent', 'reject')
);

CREATE TABLE chanceller (
    -- 실제 행동(본인만 알 수 있음)
    receivedtile1 VARCHAR(10),
    receivedtile2 VARCHAR(10),
    
    -- 실제 행동(본인만 알 수 있음)
    discardedtile2 VARCHAR(10),
    
    -- 실제 행동(모두에게 공개됨)
    Legislativeaction VARCHAR(10),
    
    -- 진술(거짓일 수 있음)
    stmtreceived1 ENUM('facist', 'liberal'),
    stmtreceived2 ENUM('facist', 'liberal'),
    
	stmtdiscardedtile2 VARCHAR(10),
    
	-- 행정처리 (모두에게 공개)
    executiveaction ENUM('veto')
);
