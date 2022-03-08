CREATE TABLE products(
    id INT,
    name VARCHAR(50),
    price INT,
    on_sale boolean
);
ALTER TABLE products ADD COLUMN featured boolean;
ALTER TABLE products DROP COLUMN featured;
CREATE TABLE restaurants
( 
  id BIGSERIAL PRIMARY KEY,
   name VARCHAR(50),
    location VARCHAR(50),
    price_range INT NOT NULL check(price_range >= 1 and price_range <=5)

);

alter table restaurants add constraint review_fkey 
foreign key (reviews_id) references reviews;

INSERT INTO restaurants (id, name, location, price_range) values (123, 'McDonald', 'new yorks',3);

CREATE TABLE reviews(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    restaurant_id BIGINT NOT NULL references restaurants(id),
    name VARCHAR(50) NOT NULL,
    review TEXT NOT NULL, 
    rating INT NOT NULL check (rating >= 1 and rating <= 5)
);
INSERT INTO reviews ( restaurant_id, name, review, rating) values (123, 'Anne', 'not good food', 2);
