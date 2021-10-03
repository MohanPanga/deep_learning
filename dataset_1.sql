CREATE TABLE luggage_review_id_table (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the formate yyyy-mm-dd
)
select * from luggage_review_id_table limit 10;


Drop table luggage_products
CREATE TABLE luggage_products (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT
);
select * from luggage_products limit 10


CREATE TABLE luggage_customers (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);
select * from luggage_customers where customer_count > 1 limit 10


CREATE TABLE luggage_vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT
);
select * from luggage_vine_table limit 10