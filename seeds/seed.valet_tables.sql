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
  'In Catan, players start the game with 2 settlements apiece which will semi-randomly generate resources for them. On each of their turns, players will attempt to establish new settlements (by first building roads to reach new areas) or upgrade their existing settlements into cities which produce resources twice as quickly. Settlements are 1 point each and cities 2. The first player to 10 points wins.',
  'skill/chance, trading, no teams, family, players: 3-4',
  'img.jpg',
  'https://www.catan.com/en/download/?SoC_rv_Rules_091907.pdf',
  'Keep expansion opportunities in mind when making your initial placement. Even a valuable location might not be worth boxing yourself in.,
  It is often a good idea to go after wood/brick early game to expand quickly. The most valuable positions go quickly.,
  Keep in mind who has development cards in hand when placing the robber. You don''t want to make an enemy who can strike back immediately.,
  Having a 3:1 port can be very valuable if you are extremely specialized in generation of a specific resource.,
  Don''t hoard resources. Spending early and often makes you less vulnerable to losing your resources to the robber or an opponent''s development card.,
  In most games sheep are abundant and brick rare relative to demand.,
  Only 16% of development cards give victory points so don''t count on getting one.',
  7.2),
  ('Risk',
  'Risk is a war game that pits players against one another in a FFA to control the world.',
  'In Risk, players starting positing are determined randomly and from there they take turns attacking one another to gain control of more territory. All battles are resolved by a dice roll. Controlling more land and specifically having full control of one of the 6 continents improves troop production, and the end goal is to eliminate all players and control the world.',
  'war, skill/chance, negotiation, no teams, family, players: 2-6',
  'img.jpg',
  'https://www.fgbradleys.com/rules//Risk.pdf',
  'Once you gain control of a continent positioning troops at the points of contact with other continents is vital to holding it.,
  Don''t try to gain full control of a continent if you don''t think you can maintain control until your next turn.,
  Australia is easily defendable with only one point of attack. South America only has two.,
  Politics are important. Make other players out to be larger threats than they are. Any conflict between other players is to your benefit.,
  Don''t spread your army too thin conquering large swathes of territory. It makes you very vulnerable to an opponent conquering all of your territory in a single turn.',
  5.6),
  ('Ticket to Ride',
  'Ticket to Ride is a game about building train routes to connect various cities in order to complete specific, secret objectives.',
  'In Ticket to Ride players start the game by choosing a few "route" cards secretly which dictate certain cities that the players want to connect together with train routes. On a player''s turn they may draw from a deck of various train cars or build a train route, which involves playing a matched set of train cars from their hand equal to the length of the route they want to build. The game ends when one player can build no more routes and the winner is determined by points based on the length of routes placed and the secret objectives completed.',
  'skill/chance, family, no teams, players: 2-5',
  'img.jpg',
  'https://ncdn0.daysofwonder.com/tickettoride/en/img/tt_rules_2015_en.pdf',
  'Don''t telegraph your intended routes or it may be easy for other players to block you.,
  Go after the 1 car routes you need early.,
  If can often be worth it to block another player even if it offers you no advantage. Watch what colors they''re after and what parts of the board they look at to get an idea where they''re going.,
  You don''t have to wait until you''ve completed your routes to draw more. If you draw more routes early on you can plan long term for a train route that incorporates all of them.',
  7.4),
  ('Betrayal at House on the Hill',
  'In this game players explore a haunted mansion as a team and face one of a large variety of potential scenarios that often pit them against each other for survival.',
  'In Betrayal at House on the Hill players all choose a starting character with advantages/disadvantages in various areas. They take turn exploring a haunted house that varies with every playthrough, revealing one room at a time and facing haunting events or finding items that can aid them. At some point in the game the "haunt" for that game is revealed and one or more of the players may turn out to be a traitor. For the rest of the game a unique scenario plays out that will be different every playthrough, with different objectives for victory each time.',
  'traitor, chance, cooperative, complex, players: 3-6',
  'img.jpg',
  'https://www.fgbradleys.com/rules/rules2/BetrayalAtTheHouseOnTheHill-rules.pdf',
  'You never know who the traitor is going to be. Before the haunt is revealed don''t do anything to help another player if it is in any way to your detriment. Don''t give away any items,
  Once the haunt is revealed take stock of all the items/omens players are carrying and their abilities. You never know what might be useful.,
  Remember that you can steal an item from a player if you defeat them in combat by 2 or more. That can sometimes be more advantageous than just dealing 2 damage.',
  7.1),
  ('7 Wonders',
  '7 Wonders is a card drafting game with players choosing cards to build up their own specific ancient civilization.',
  '7 Wonders is played in 3 stages, called "Ages". At the start of the game each player gets a game board depicting one of the 7 wonders of the world, and then gameplay begins with each player being dealt 7 cards. Players choose 1 card to keep and pass the rest to another player, this continues until every player has 6 cards. This process is repeated for each age, and at the end of the game players are scored based on the cards they drafted giving points based on variety of factors.',
  'skill/chance, no teams, card-based, complex, players: 3-7',
  'img.jpg',
  'https://www.fgbradleys.com/rules/rules2/7Wonders-quickrules.pdf',
  'Don''t count on getting coins from your neighbors buying your resources. You never know when they''ll start producing it for themselves, or buying it somewhere else.,
  Either go all in on scientific structures or ignore them entirely. There is little profit to be made from having a medium amount.,
  Pay attention to the focus of everyone around you. It may often dictate your strategy. Pursuing an avenue no one else is leaves you with less competition for the necessary cards.,
  Don''t ignore military buildings. The cumulative advantage of winning all of your wars vs. losing them all is significant.',
  7.8),
  ('Dead of Winter',
  'In Dead of Winter players cooperate to survive the winter during a zombie apocalypse. But in addition to survival, each player has a secret objective they must complete and one of them may even be a traitor who wants everyone else dead.',
  'In Dead of Winter players control a colony struggling to survive winter and hordes of zombies with each player taking control of a small faction of several survivors. Players will cooperate to feed their colony and defend it from zombies all the while pursuing a secret objective known only to them. However, one player''s secret objective may be the destruction of the colony which they must pursue without drawing attention less they be exiled. The game may end with everyone winning together, some players winning, or every player failing to meet their objective and losing.',
  'traitor, skill/chance, cooperative, complex, players: 2-5',
  'img.jpg',
  'https://www.plaidhatgames.com/images/games/dead-of-winter/rules.pdf',
  'You often want to commit more to solving the crisis than seems necessary. You never know if a traitor is attempting to sabotage your efforts and if you end up contributing 2+ over the requirements the colony gains morale anyway.,
  If a traitor is sabotaging your crisis efforts pay attention to the location the item came from. It may help narrow the suspects for traitor.,
  Food cards with 2 or 3 food symbols are great for feeding your colony but don''t provide any additional benefit over a regular food card when contributing towards a crisis.,
  You don''t necessarily have to resolve every crisis. You might gain more by ignoring a crisis altogether and holding on to your cards to use later.,
  Outsider cards don''t have to be played immediately despite being events. Sometime you may want to hold on to them for later so you have fewer mouths to feed.',
  7.7),
  ('Diplomacy',
  'In Diplomacy each player controls one of 7 Great Powers of Europe in the years prior to World War 1 and they fight until one player controls most of Europe. There are no dice roles in Diplomacy, so only the shrewdest negotiator and strategist can win.',
  'In Diplomacy each player takes control of Great Britain, France, Austria-Hungary, Germany, Italy, Russia or Turkey. During each turn players may freely talk with each other and make agreements, but they will write down all their intended move orders for their armies and fleets to be revealed simultaneously. There is no element of chance involved, so battles are resolved by the largest force winning and any ties result in a stalemate. Players must navigate the complicated politics of war knowing that only one player can win and any alliance is only temporary. The game ends when half of Europe is in the hands of one player.',
  'skill, no teams, negotiation, war, complex, players: 2-7',
  'img.jpg',
  'https://www.wizards.com/avalonhill/rules/diplomacy.pdf',
  'No one can be fully trusted. When making an alliance you have to know at what point you will become an obstacle in your ally''s path so that you can be ready for their betrayal or move against them first.,
  Remember that you don''t necessarily have to be adjacent to a battle to offer assistance. Attacking an army that is supporting a battle will cut off that support.,
  Unit adjustments based on supplies take place only every other turn which is after the fall of each year. If possible it is often best to time your attacks to take supply centers in the fall to gain those advantages immediately.,
  Watch for betryal in the fall. If any ally has armies adjacent to multiple of your supply centers after the spring turn you may need to be ready to defend yourself.',
  7.1),
  ('Pandemic',
  'In Pandemic players cooperate to fight the spread of 4 infectious diseases that have simultaneously broken out across the world.',
  'In Pandemic each player controls a unique character with special skills that play a unique role in the team. On each turn player''s will cooperate to treat people infected by disease and ultimately find a cure to each of the 4 pandemic diseases. Players win together when all the diseases are cured or lose together when they are overwhelmed and humanity is driven to extinction.',
  'skill/chance, cooperative, complex, players: 2-4',
  'img.jpg',
  'https://images-cdn.zmangames.com/us-east-1/filer_public/25/12/251252dd-1338-4f78-b90d-afe073c72363/zm7101_pandemic_rules.pdf',
  'The quickest route to failure is letting the disease cubes stack up to the point where one outbreak cascades into multiple outbreaks. Don''t let any disease stack up to that point.,
  Any action spent moving is a wasted action. Plan out your turns so that players don''t need to spend all of their actions moving to new areas.,
  Later in the game you shouldn''t worry about eradicating cured diseases since your actions will be better spent finding the cures for the last one or two diseases.',
  7.6);

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
