DROP TABLE budget;
DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;

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
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT8 REFERENCES tags(id) ON DELETE CASCADE
);

CREATE TABLE budget(
  id SERIAL8 PRIMARY KEY,
  total INT4
);
