const express = require('express');

const notesService = require('./notes-service');

const notesRouter = express.Router();
const jsonBodyParser = express.json();

notesRouter
  .route('/:gameId/user/:userId')
  .get((req, res, next) => {
    notesService.findJunction(req.app.get('db'), req.params.userId, req.params.gameId)
      .then(junction => notesService.getNotes(req.app.get('db'), junction.id))
      .then(notes => res.json(notes))
      .catch(next)
  })
  .post(jsonBodyParser, (req, res, next) => {
    const unverifiedNote = req.body
    notesService.findJunction(req.app.get('db'), req.params.userId, req.params.gameId)
      .then(junction => {
        unverifiedNote.junction_id = junction.id
        const note = notesService.verifyNote(unverifiedNote)
        if (typeof note !== 'object') {
          res.status(400).json({error: `Missing '${note}' in request body`})
        }
        return note
      })
      .then(note => notesService.addNote(req.app.get('db'), note))
      .then(newNote => res.json(newNote))
      .catch(next)
  })
  .patch(jsonBodyParser, (req, res, next) => {
    const unverifiedNote = req.body
    if (!req.body.id) {
      return res.status(400).json({error: "Missing 'id' in request body"})
    }
    notesService.findJunction(req.app.get('db'), req.params.userId, req.params.gameId)
      .then(junction => {
        unverifiedNote.junction_id = junction.id
        const note = notesService.verifyNote(unverifiedNote)
        if (typeof note !== 'object') {
          return res.status(400).json({error: `Missing '${note}' in request body`})
        }
        return note
      })
      .then(note => notesService.editNote(req.app.get('db'), note.id, note))
      .then(note => {
        if (!note.length) {
          return res.status(400).json({error: 'No note with that ID found'})
        }
        return res.status(204).end();
      })
      .catch(next)
  })
  .delete(jsonBodyParser, (req, res, next) => {
    const { id } = req.body;
    
    notesService.deleteNote(req.app.get('db'), id)
      .then(deleted => {
        if (!deleted) {
          return res.status(400).json({error: 'No note with that ID found'})
        }
        return res.status(204).end();
      })
      .catch(next)
  })


module.exports = notesRouter;
