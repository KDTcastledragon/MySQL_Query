select * from user_purchased_product order by purchase_date;
-- drop table user_purchased_product;
describe user_purchased_product;
ALTER TABLE user_purchased_product MODIFY COLUMN id VARCHAR(255);

CREATE TABLE user_purchased_product(
    upp_code VARCHAR(255) PRIMARY KEY,
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id VARCHAR(11),
    
    product_code INT,
    p_type VARCHAR(1) NOT NULL,
    price INT,
    
    time_value INT,
    used_time INT DEFAULT 0,
    available_time INT,
    
    day_value INT,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    
    in_used BOOLEAN DEFAULT FALSE,
    calculated BOOLEAN DEFAULT FALSE,
    usable BOOLEAN,
    
    payment VARCHAR(30),
    order_type varchar(10),
    refunded BOOLEAN DEFAULT FALSE
);