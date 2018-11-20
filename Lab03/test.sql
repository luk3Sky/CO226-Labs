CREATE DATABASE E15142;
USE E15142;
CREATE TABLE customer_details (
    customer_id INTEGER AUTO_INCREMENT ,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(10) NOT NULL,
    adrs_l1 VARCHAR(50) NOT NULL,
    adrs_l2 VARCHAR(50) NOT NULL,
    adrs_l3 VARCHAR(50) NOT NULL,
    extra_items VARCHAR(50) DEFAULT 'Undecided',
    comments VARCHAR(100) DEFAULT 'No comment',
    PRIMARY KEY(customer_id)
);

INSERT INTO customer_details(first_name, last_name, adrs_l1, adrs_l2, adrs_l3, extra_items, comments) VALUES("Kendra", "Martin", "12", "Vallery Str.", "Oklahoma", "Cap, Wrist Band", "LOL");
INSERT INTO customer_details(first_name, last_name, adrs_l1, adrs_l2, adrs_l3, extra_items, comments) VALUES("Sandy", "Brinston", "32/B", "Robinson Street Downtown", "Ohio", "Cap, Wrist Band", "Need an awesome cap, okay?");
INSERT INTO customer_details(first_name, last_name, adrs_l1, adrs_l2, adrs_l3, extra_items, comments) VALUES("Desmond", "Miles", "43, Treehouse", "Robbers' Place", "Las Vegas", "Cap", "Nice idea mate, keep up the good work.");
INSERT INTO customer_details(first_name, last_name, adrs_l1, adrs_l2, adrs_l3, extra_items, comments) VALUES("Mathew", "Murdock", "49 Street", "Hell's Kitchen, Manhattan", "New York", "Wrist Band", "I'm watching you tonight, so be careful.");
INSERT INTO customer_details(first_name, last_name, adrs_l1, adrs_l2, adrs_l3) VALUES("Maggie", "Black", "Villa for sale", "Brownry Upstreet", "Los Angeles");
INSERT INTO customer_details(first_name, last_name, adrs_l1, adrs_l2, adrs_l3, extra_items, comments) VALUES("Peter", "Parker", "Neighbourhood", "Near Uptown", "Queens", "Cap", "Great caps come with great hairs!");

SELECT * FROM customer_details;

UPDATE customer_details
SET extra_items = "Wrist Band"
WHERE customer_details.first_name = 'Maggie' ;

UPDATE customer_details
SET adrs_l2 = "In the sky of Uptown"
WHERE customer_details.customer_id = 6 ;

DELETE FROM customer_details
WHERE customer_details.first_name = 'Desmond';

SELECT * FROM customer_details;