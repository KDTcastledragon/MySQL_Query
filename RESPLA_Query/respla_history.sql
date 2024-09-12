create table usage_history_backup as select * from usagehistory;

select * from usage_history;
alter table usage_history modify id varchar(255);

CREATE TABLE usage_history (
    uh_code VARCHAR(100)  PRIMARY KEY,
    id VARCHAR(11) not null,
    used_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    seat_num INT,
    action_type VARCHAR(20),
    upp_code VARCHAR(100)
);
