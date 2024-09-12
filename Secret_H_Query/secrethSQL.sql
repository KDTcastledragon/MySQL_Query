create database secret_h;

CREATE TABLE currentround (
    gamecode VARCHAR(50),
    roundnum INT DEFAULT 1,
    turncyclelength int default 5,
    currentturn int default 1,
    
    enactedfacisttiles INT DEFAULT 0,
    enactedliberaltiles INT DEFAULT 0,
    electiontracker INT DEFAULT 0,
    
	election BOOLEAN,
    
    Legislative ENUM('facist', 'liberal'),

    executiveaction VARCHAR(20),
    
    CONSTRAINT check_currentturn CHECK (currentturn <= turncyclelength),
    CONSTRAINT check_enactedfacisttiles CHECK (enactedfacisttiles <= 6),
    CONSTRAINT check_enactedliberaltiles CHECK (enactedliberaltiles <= 5),
    
	foreign key (gamecode) references gamesetting (gamecode)
);

CREATE TABLE roundhistory (
	gamecode VARCHAR(50),
    roundnum INT DEFAULT 1,
    turncyclelength int default 5,
    currentturn int default 1,
    
    activeplayers int default 5,
    deadplayers int default 0,
    
    enactedfacist INT DEFAULT 0,
    enactedliberal INT DEFAULT 0,
    electiontracker INT DEFAULT 0,
    
	election BOOLEAN,
    
    Legislative ENUM('facist', 'liberal'),

    executiveaction VARCHAR(20)
    
    CONSTRAINT check_currentturn CHECK (currentturn <= turncyclelength)
);

CREATE TABLE gamehistory (
    gamecode VARCHAR(50),
    roundnum INT DEFAULT 0,
    
    id VARCHAR(20) PRIMARY KEY,
    nickname VARCHAR(40),
    
    turnorder INT,
    isplayerturn boolean default false,
    isdead BOOLEAN DEFAULT FALSE,
    affiliation ENUM('h', 'facist', 'liberal'),
    party ENUM('facist', 'liberal'),
    currentposition ENUM('president', 'chanceller', 'citizen'),
    vote BOOLEAN,
    stmt1 ENUM('facist', 'liberal'),
    stmt2 ENUM('facist', 'liberal'),
    stmt3 ENUM('facist', 'liberal'),
    Legislativeaction ENUM('facist', 'liberal', ''),
    executiveaction ENUM('investigate', 'callelection', 'peek', 'execution', 'veto'),
    facprobability DECIMAL(5 , 3 )
);

