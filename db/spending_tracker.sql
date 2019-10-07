DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;
DROP TABLE merchantlist;

CREATE TABLE merchants(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL8 PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  amount INT4,
  merchant_id INT8 REFERENCES merchants(id),
  tag_id INT8 REFERENCES tags(id)
);

CREATE TABLE merchantlist(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(2550)
);
