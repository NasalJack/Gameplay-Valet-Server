# Gameplay Valet Server

Gameplay Valet is a repository of information about various boardgames. User should be able to access rules and tips for each game as a visitor or create an account to be able to curate a smaller list of only the games they own/play as well as being able to write notes for any game that will be stored for later reference.

The deployed app can be found at: https://gampeplayvalet.now.sh/

The client repo can be found at: https://github.com/NasalJack/Gameplay-Valet-Client

This API endpoint is hosted at: https://fathomless-temple-50861.herokuapp.com/api

## Endpoints
### /auth/login
POST 
* For logging in
* Body must contain a "user_name" and "password"
* If the username/password combination exists in the database the server will send back an "authToken" and an "id" which is the user's unique id in the database
### /users
POST 
* For registering a new user
* Body must contain a "user_name" and "password"
* If the username/password combination does not already exist in the database and the password meets the security requirements, a new user will be created in the database and the server will respond with an "authToken" and an "id" which is unique to the user. If the username already exists or the requirements are not met the server will respond with an error and information about how to correct the submission
### /games
GET
* For getting a list of all games in the database
* Returns an array of objects, each object is a game with the keys 'id', 'title', 'short_description', 'genres', and 'rating'.
### /games/:gameId
GET
* For returning all of the information on a specific game
* Searches the database for a game with the id specified. If no game of that ID exists it returns a 400, otherwise it sends back all of the information for that specific game ('id', 'title', 'short_description', 'long_description', 'genres', 'img', 'rules', 'tips', and 'rating')
### /games/:userId
GET
* For getting a user's customized list of games
* Searches database for specified user ID and any game IDs tied to it. Returns an array of objects, each object is a game with the keys 'id', 'title', 'short_description', 'genres', and 'rating'.
### /game/:gameId/user/:userId 
GET (requires authentication)
* For retreiving notes saved by the user for a particular game
* Searches database for any notes that are tied to the particular gameId and userId, returning a 400 if the gameId does not exist. Returns an array of note objects, with each object having they keys "title" and "content".
POST (requires authentication)
* For adding a new note to the database
* Body must contain a "title" and "content"
* Adds a new note to the database tied to the specified userId and gameId
PATCH (requires authentication)
* For editing a note already on the database
* Body must contain an "id" and may contain a "title" and/or "content"
* Edits an existing entry in the database with the specified id, replacing the title and/or content of the note with the new information provided.
DELETE (requires authentication)
* For deleting an existing note
* Body must contain an "id"
* Removes the note with the specified id from the database
### /junction/user/:userId/game/:gameId
GET
* For checking if a game with the specified gameId is on the games list of the user with the specified userId
* Searches the junction table of the database for an entry containing the specified userId and gameId. Responds with an "onList" key with the value "true" or "false" depending on whether or not the game is on the user's list
POST (requires authentication)
* For adding a game to a user's list of games
* If the game is already on the user's list the database will respond with a 400, otherwise it will update to add the game with the specified gameId to the user's personal list of games
DELETE (requires authentication)
* For deleting a game from a user's list of games
* Updates the database to remove the relationship between the specified game and user so that the game will no longer show up on the user's list of personal games

