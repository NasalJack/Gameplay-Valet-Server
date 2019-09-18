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
  ('Catan',
  'Catan is an area control game where players build settlements and roads to collect resources on the fictional island of Catan',
  'In Catan, players start the game with 2 settlements apiece which will semi-randomly generate resources for them. 
  On each of their turns, players will attempt to establish new settlements (by first building roads to reach new areas) 
  or upgrade their existing settlements into cities which produce resources twice as quickly. Settlements are 1 point each and 
  cities 2. The first player to 10 points wins.',
  'skill/chance, negotiation, no teams, family, players: 3-4',
  'img.jpg',
  'rules.pdf',
  'Keep expansion opportunities in mind when making your initial placement. Even a valuable location might not be worth boxing yourself in.,
  It is often a good idea to go after wood/brick early game to expand quickly. The most valuable positions go quickly.,
  Keep in mind who has development cards in hand when placing the robber. You don''t want to make an enemy who can strike back immediately.,
  Having a 3:1 port can be very valuable if you are extremely specialized in generation of a specific resource.,
  Don''t hoard resources. Spending early and often makes you less vulnerable to losing your resources to the robber or an opponent''s development card.,
  In most games sheep are abundant and brick rare relative to demand.,
  Only 16% of development cards give victory points so don''t count on getting one.',
  7.2),
  ('games 2', 'this is game 2', 'the game that this is is 2', 'a,d,e', 'img.jpg', 'rules.pdf', 'win', 4),
  ('games 3', 'this is game 3', 'the game that this is is 3', 'd,e,f', 'img.jpg', 'rules.pdf', 'win', 3),
  ('games 4', 'this is game 4', 'the game that this is is 4', 'h,i,g', 'img.jpg', 'rules.pdf', 'win', 4),
  ('games 5', 'this is game 5', 'the game that this is is 5', 'g,b,e', 'img.jpg', 'rules.pdf', 'win', 5),
  ('games 6', 'this is game 6', 'the game that this is is 6', 'g', 'img.jpg', 'rules.pdf', 'win', 2),
  ('games 7', 'this is game 7', 'the game that this is is 7', 'a,b,d', 'img.jpg', 'rules.pdf', 'win', 3),
  ('games 8', 'this is game 8', 'the game that this is is 8', 'i,f,g', 'img.jpg', 'rules.pdf', 'win', 1);

INSERT INTO user_games_junction (user_id, game_id, deleted)
VALUES
  (1, 6, 'no'), (1, 8, 'no'),
  (2, 1, 'no'), (2, 2, 'no'), (2, 3, 'no'), (2, 4, 'no'), (2, 5, 'no'), (2, 7, 'no'),
  (4, 1, 'no'), (4, 5, 'no');

INSERT INTO notes (title, content, junction_id)
VALUES
  ('Run away', 'this game is too hard, do not play it', 1),
  ('Give up', 'forfeit right at the start of the game', 2),
  ('Win', 'that is all the advice you need, be better.', 3),
  ('What?', 'why did this text box appear? Why am I typing?', 9),
  ('Edit', 'delete delete delete why does this not work delete delete', 10);

COMMIT;
