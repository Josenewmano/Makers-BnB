CREATE TABLE users(
  id SERIAL PRIMARY KEY, 
  username VARCHAR(60), 
  email VARCHAR(140), 
  password VARCHAR(60)
);