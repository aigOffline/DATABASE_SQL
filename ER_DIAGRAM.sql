DROP DATABASE IF EXISTS flora_online_shop;
CREATE DATABASE flora_online_shop;
USE my_drum_shop;

/* create the tables for the database */
CREATE TABLE categories (
  id        BIGSERIAL           PRIMARY KEY ,
  category_name      VARCHAR(255)   NOT NULL      UNIQUE
);

CREATE TABLE products (
   id        BIGSERIAL           PRIMARY KEY ,
  category_id        INT            NOT NULL,
  description        TEXT           NOT NULL,
  list_price         DECIMAL(10,2)  NOT NULL,
  discount_percent   DECIMAL(10,2)  NOT NULL      DEFAULT 0.00,
  date_added         DATETIME                     DEFAULT NULL,
  CONSTRAINT products_fk_categories
    FOREIGN KEY (category_id)
    REFERENCES categories (category_id)
);

CREATE TABLE person (
  id        BIGSERIAL           PRIMARY KEY ,
  email_address         VARCHAR(255)   NOT NULL     
  password              VARCHAR(60)    NOT NULL,
  first_name            VARCHAR(60)    NOT NULL,
  last_name             VARCHAR(60)    NOT NULL,
  middle_name           VARCHAR(60)    NOT NULL,
  birthdate		        DATE		  DEFAULT NULL,

  address_id    INT                          DEFAULT NULL
);

CREATE TABLE addresses (
  id                BIGSERIAL       PRIMARY KEY ,
  line1              VARCHAR(60)    NOT NULL,
  line2              VARCHAR(60)                  DEFAULT NULL,
  city               VARCHAR(40)    NOT NULL,
  state              VARCHAR(2)     NOT NULL,
  country	     VARCHAR(40)		  DEFAULT 'USA',
  zip_code           VARCHAR(10)    NOT NULL,
  phone              VARCHAR(12)    NOT NULL,

);

CREATE TABLE orders (
  id            BIGSERIAL           PRIMARY KEY ,
  user_id        INT            NOT NULL,
  order_date         DATETIME       NOT NULL,
  ship_amount        DECIMAL(10,2)  NOT NULL,
  tax_amount         DECIMAL(10,2)  NOT NULL,
  ship_date          DATE                    DEFAULT NULL,
  ship_address_id    INT            NOT NULL,
  card_type          VARCHAR(50)    NOT NULL,
  card_number        CHAR(16)       NOT NULL,
  card_expires       CHAR(7)        NOT NULL,
  billing_address_id  INT           NOT NULL,
  CONSTRAINT orders_fk_users
    FOREIGN KEY (users_id)
    REFERENCES users (users_id)
);

CREATE TABLE order_items (
  id            INT            PRIMARY KEY  AUTO_INCREMENT,
  order_id           INT            NOT NULL,
  product_id         INT            NOT NULL,
  item_price         DECIMAL(10,2)  NOT NULL,
  discount_amount    DECIMAL(10,2)  NOT NULL,
  quantity           INT            NOT NULL,
  CONSTRAINT items_fk_orders
    FOREIGN KEY (order_id)
    REFERENCES orders (order_id), 
  CONSTRAINT items_fk_products
    FOREIGN KEY (product_id)
    REFERENCES products (product_id)
);

CREATE TABLE  users (
  id         BIGSERIAL           PRIMARY KEY ,
  email      VARCHAR(255)         NOT NULL,
  password   VARCHAR(255)         NOT NULL,
  person_id         INT           NOT NULL,
  role_id          INT            NOT NULL,
    CONSTRAINT items_fk_person
    FOREIGN KEY (person_id)
    REFERENCES person (id),
    CONSTRAINT items_fk_role
    FOREIGN KEY (role_id)
    REFERENCES role (id)
);

CREATE TABLE  role (
  id        BIGSERIAL      PRIMARY KEY ,
  name      VARCHAR(255)   NOT NULL
);


/* Insert data into the tables */

INSERT INTO categories (category_id, category_name) VALUES
(1, 'Anniversary'),
(2, 'Birthday'),
(3, 'NewBaby'), 
(4, 'GetWell'),
(5, 'Sympathy');

-- Insert data into the tables

INSERT INTO products (id, category_id, description, price, discount, date_created) 
VALUES
(1, 1, 'BEAUTIFUL SPIRIT BASKET
Let them know how much you care with a gorgeous bouquet that features carnations, stock, roses, lilies and Fuji mums.
 Each bloom is a thoughtful reminder of your support and love, while sitting in a beautifully crafted basket.
Please Note: The bouquet pictured reflects our original design for this product. While we always try to follow the color palette,
 we may replace stems to deliver the freshest bouquet possible, and we may sometimes need to use a different container.
','75.00', '5.00', '2021-10-30');

INSERT INTO products (id, category_id, description, price, discount, date_created) 
VALUES
(2, 3, 'LIGHT OF MY LIFE BOUQUET
The Light of My Life Bouquet blossoms with brilliant color and a sweet 
 sophistication to create the perfect impression! Pink Lilies make the 
 eyes dance across the unique design of this flower bouquet, surrounded 
 by the blushing colors of orange roses, lavender cushion poms, 
 hot pink carnations, and lush greens.
','90.00', '3.00', '2022-01-30');
INSERT INTO products (id, category_id, description, price, discount, date_created) 
VALUES
(3, 2, 'The Birthday Brights Bouquet is a true celebration of color and 
 life to surprise and delight your special recipient on their big day!
 Hot pink gerbera daisies and orange roses take center stage surrounded
 by purple statice, yellow cushion poms, green button poms, and lush greens
 to create party perfect birthday display. Presented in a modern rectangular 
 ceramic vase with colorful striping at the bottom, "Happy Birthday" lettering 
 at the top, and a bright pink bow at the center.
','65.50', '0.00', '2022-02-10');


INSERT INTO person (id, first_name, last_name, middle_name, birth_date, address_id) VALUES
(1, 'Allan', 'Sherwood', 'Smith', '10-21-1967', 2),
(2, 'Barry', 'Zimmer', 'Adam', '09-14-1995', 3 ),
(3,  'Christine', 'Brown', 'Miller','11-11-2001', 4),
(4,  'David', 'Goldstein','Glitter', '01-11-1991', 5),
(5,  'Erin', 'Valentino', '','02-22-1951', 6),
(6,  'Frank Lee', 'Wilson', '','04-03-1991', 7),
(7,  'Gary', 'Hernandez', 'Migan','05-14-1951', 8),
(8,  'Heather', 'Esway','', '10-14-1971', 9);


INSERT INTO addresses (id, line1, line2, city, state, zip_code, country, phone) VALUES
(1, '100 East Ridgewood Ave.', '', 'Paramus', 'NJ', '07652', 'USA', 201-653-4472'),
(2, '21 Rosewood Rd.', '', 'Woodcliff Lake', 'NJ', '07677', 'USA', 201-653-4472'),
(3, '16285 Wendell St.', '', 'Omaha', 'NE', '68135','USA', '402-896-2576'),
(4, '19270 NW Cornell Rd.', '', 'Beaverton', 'OR', '97006', 'USA', '503-654-1291'),
(5, '186 Vermont St.', 'Apt. 2', 'San Francisco', 'CA', '94110', 'USA', '415-292-6651'),
(6, '1374 46th Ave.', '', 'San Francisco', 'CA', '94129', 'USA', 415-292-6651'),
(7, '6982 Palm Ave.', '', 'Fresno', 'CA', '93711', 'USA', '559-431-2398'),
(8, '23 Mountain View St.', '', 'Denver', 'CO', '80208', 'USA','303-912-3852'),
(9, '7361 N. 41st St.', 'Apt. B', 'New York', 'NY', '10012', 'USA', 212-335-2093'),
(10, '3829 Broadway Ave.', 'Suite 2', 'New York', 'NY', '10012', 'USA', 212-239-1208'),
(11, '2381 Buena Vista St.', '', 'Los Angeles', 'CA', '90023', 'USA', 213-772-5033'),
(12, '291 W. Hollywood Blvd.', '', 'Los Angeles', 'CA', '90024', 'USA', 213-391-2938');


 INSERT INTO orders (order_id, customer_id, order_date, ship_amount, tax_amount, ship_date, ship_address_id, card_type, card_number, card_expires, billing_address_id) VALUES
(1, 1, '2018-03-28 09:40:28', '5.00', '32.32', '2018-03-30', 1, 'Visa', '4111111111111111', '04/2020', 2),
(2, 2, '2018-03-28 11:23:20', '5.00', '0.00', '2018-03-29', 3, 'Visa', '4012888888881881', '08/2019', 3),
(3, 1, '2018-03-29 09:44:58', '10.00', '89.92', '2018-03-31', 1, 'Visa', '4111111111111111', '04/2017', 2),
(4, 3, '2018-03-30 15:22:31', '5.00', '0.00', '2018-04-03', 4, 'American Express', '378282246310005', '04/2016', 4),
(5, 4, '2018-03-31 05:43:11', '5.00', '0.00', '2018-04-02', 5, 'Visa', '4111111111111111', '04/2019', 6),
(6, 5, '2018-03-31 18:37:22', '5.00', '0.00', NULL, 7, 'Discover', '6011111111111117', '04/2019', 7),
(7, 6, '2018-04-01 23:11:12', '15.00', '0.00', '2018-04-03', 8, 'MasterCard', '5555555555554444', '04/2019', 8),
(8, 7, '2018-04-02 11:26:38', '5.00', '0.00', NULL, 9, 'Visa', '4012888888881881', '04/2019', 10),
(9, 4, '2018-04-03 12:22:31', '5.00', '0.00', NULL, 5, 'Visa', '4111111111111111', '04/2019', 6);
////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 INSERT INTO order_items (id, order_id, product_id, item_price, 
						 discount_amount, quantity) VALUES
(1, 1, 1, '32.00', '5.70', 1),
(2, 2, 2, '12.99', '1.20', 1),
(3, 3, 3, '25.00', '13.84', 1),
(4, 4, 4, '65.00', '16.85', 1),
(5, 5, 5, '80.00', '9.70', 2);

 
 INSERT INTO users (id, email_address, password, role_id, person_id) VALUES
(1, 'admin@myguitarshop.com', '6a718fbd768c2378b511f8249b54897f940e9022', 1, 1),
(2, 'joel@murach.com', '971e95957d3b74d70d79c20c94e9cd91b85f7aae', 2, 2),
(3, 'mike@murach.com', '3f2975c819cefc686282456aeae3a137bf896ee8',  2, 3); 
 
 INSERT INTO  roles (id, role_name) VALUES
(1, 'Admin'),
(2, 'Customer');

