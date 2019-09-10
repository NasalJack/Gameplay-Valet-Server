BEGIN;

TRUNCATE
  users,
  notes,
  games,
  user_games_junction
  RESTART IDENTITY CASCADE;

INSERT INTO users (user_name, password)
VALUES
  ('Bob','$2a$10$RFafCCSF.NhIEPrapFzi9.Pj4FPvu4T.CO6vWUIXjZNuBGGUJE0yK'), --password
  ('Hunter', '$2a$10$K3Hq7cSXz2SjnYqamhb2b.dQZNY1aBGZKUuIEtrZIiAZLwA7CXEPC'), --hunter
  ('Sandra', '$2a$10$ofPzhnEbN0Uy3ifwUy2.dOQOZoBl9B60GfRB6rEMWXCBD2hSZ9CHG'), --123
  ('Goober', '$2a$10$SRtzwIVX/iE56W6bMpr6jOgFqlztpZx5EVod0WuQMvHBKpeDosAUC'); --???

INSERT INTO games (title, short_description, long_description, genres, img, rules, tips, rating)
VALUES
  ('games 1', 'this is game 1', 'the game that this is is 1', '[a,b,c]', 'img.jpg', 'rules.pdf', 'win', 5),
  ('games 2', 'this is game 2', 'the game that this is is 2', '[a,d,e]', 'img.jpg', 'rules.pdf', 'win', 4),
  ('games 3', 'this is game 3', 'the game that this is is 3', '[d,e,f]', 'img.jpg', 'rules.pdf', 'win', 3),
  ('games 4', 'this is game 4', 'the game that this is is 4', '[h,i,g]', 'img.jpg', 'rules.pdf', 'win', 4),
  ('games 5', 'this is game 5', 'the game that this is is 5', '[g,b,e]', 'img.jpg', 'rules.pdf', 'win', 5),
  ('games 6', 'this is game 6', 'the game that this is is 6', '[g]', 'img.jpg', 'rules.pdf', 'win', 2),
  ('games 7', 'this is game 7', 'the game that this is is 7', '[a,b,d]', 'img.jpg', 'rules.pdf', 'win', 3),
  ('games 8', 'this is game 8', 'the game that this is is 8', '[i,f,g]', 'img.jpg', 'rules.pdf', 'win', 1);

INSERT INTO user_games_junction (user_id, game_id)
VALUES
  (1, 6), (1, 8),
  (2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 7),
  (4, 1), (4, 5);

INSERT INTO notes (title, content, junction_id)
VALUES
  ('Run away', 'this game is too hard, do not play it', 1),
  ('Give up', 'forfeit right at the start of the game', 2),
  ('Win', 'that is all the advice you need, be better.', 3),
  ('What?', 'why did this text box appear? Why am I typing?', 9),
  ('Edit', 'delete delete delete why does this not work delete delete', 10);

COMMIT;
