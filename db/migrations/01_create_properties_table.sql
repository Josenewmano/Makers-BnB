CREATE TABLE properties(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(60), 
  description VARCHAR(400), 
  price_per_night INT
);