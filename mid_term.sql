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


