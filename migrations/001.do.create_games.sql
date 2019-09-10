CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  short_description TEXT NOT NULL,
  long_description TEXT NOT NULL,
  genres TEXT NOT NULL,
  img TEXT NOT NULL,
  rules TEXT NOT NULL,
  tips TEXT NOT NULL,
  rating INTEGER NOT NULL
);