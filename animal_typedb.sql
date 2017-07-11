DROP TABLE IF EXISTS animals;

CREATE TABLE animals
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  homeworld VARCHAR(255),
  bounty_value INT2
);