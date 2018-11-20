-- CREATE DATABASE tshirt_db;
use tshirt_db;
-- CREATE TABLE customer_details (
--     customer_id INTEGER PRIMARY KEY AUTO_INCREMENT ,
--     first_name VARCHAR(10) NOT NULL,
--     last_name VARCHAR(10) NOT NULL,
--     adrs_l1 VARCHAR(50) NOT NULL,
--     adrs_l2 VARCHAR(50) NOT NULL,
--     adrs_l3 VARCHAR(50) NOT NULL,
--     extra_items VARCHAR(50) DEFAULT 'Undecided',
--     comments VARCHAR(100) DEFAULT 'No comment'
-- );

-- insert into table (column)
-- values (values)


INSERT INTO customer_details VALUES("Kendra", "Martin", "12", "Vallery Str.", "Oklahoma", "Cap, Wrist Band", "LOL");
INSERT INTO customer_details VALUES("Sandy", "Brinston", "32/B", "Robinson Street Downtown", "Ohio", "Cap, Wrist Band", "Need an awesome cap, okay?");
INSERT INTO customer_details VALUES("Desmond", "Miles", "43, Treehouse", "Robbers' Place", "Las Vegas", "Cap", "Nice idea mate, keep up  the good work.");
INSERT INTO customer_details VALUES("Mathew", "Murdock", "49 Street", "Hell's Kitchen, Manhattan", "New York", "Wrist Band", "I'm watching you tonight, so be careful.");
INSERT INTO customer_details(first_name, last_name, adrs_l1, adrs_l2, adrs_l3, comments) VALUES("Maggie", "Black", "Villa for sale", "Brownry Upstreet", "Los Angeles", "Be on time");

SELECT * FROM customer_details;
