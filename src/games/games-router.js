const express = require('express');

const gamesService = require('./games-service');

const gamesRouter = express.Router();

gamesRouter
  .route('/')
  .get((req, res, next) => {
    gamesService.getAllGames(req.app.get('db'))
      .then(games => {
        res.json(games)
      })
      .catch(next)
  })

gamesRouter 
  .route('/:gameId')
  .get((req, res, next) => {
    gamesService.getGameInfo(req.app.get('db'), req.params.gameId)
      .then(game => {
        if(!game) res.status(400).json({ error: 'no game with that ID exists'})
        res.json(game)
      })
      .catch(next)
  })

gamesRouter
  .route('/user/:userId')
  .get((req, res, next) => {
    gamesService.getMyGames(req.app.get('db'), req.params.userId)
      .then(games => {
        res.json(games)
      })
      .catch(next)
  })

module.exports = gamesRouter;