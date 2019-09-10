CREATE TABLE notes (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  junction_id INTEGER NOT NULL REFERENCES user_games_junction(id)
);