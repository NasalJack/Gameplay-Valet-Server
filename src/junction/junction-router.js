const express = require('express');

const junctionService = require('./junction-service');
const { requireAuth } = require('../middleware/jwt-auth')

const junctionRouter = express.Router();

junctionRouter
  .route('/user/:userId/game/:gameId')
  .post(requireAuth, (req, res, next) => {
    const { userId, gameId} = req.params
    junctionService.checkJunctionForRelation(req.app.get('db'), userId, gameId)
      .then(junction => {
        if (junction) {
          if (!junction.deleted) return res.status(400).json({ error: "game is already on user's list"})
          return junctionService.returnGameToList(req.app.get('db'), junction.id)
            .then(response => {
              return res.status(200).json(response)
            })
        }
        return junctionService.addGameToList(req.app.get('db'), userId, gameId)
          .then(response => {
            return res.status(200).json(response)
          })
      })
      .catch(next)
  })
  .delete(requireAuth, (req, res, next) => {
    const { userId, gameId } = req.params
    junctionService.checkJunctionForRelation(req.app.get('db'), userId, gameId)
      .then(junction => {
        if (!junction) return res.status(400).json({ error: "game is not on user's list"});
        if(junction.deleted) return res.status(400).json({ error: "game is already deleted from user's list"})
        return junctionService.removeGameFromList(req.app.get('db'), junction.id)
          .then(del => {
            if(del) return res.status(200).json(del)
          })
      })
      .catch(next)
  })


  module.exports = junctionRouter;