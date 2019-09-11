CREATE TABLE user_games_junction (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id),
  game_id INTEGER NOT NULL REFERENCES games(id),
  deleted BOOLEAN NOT NULL DEFAULT 'no'
);