const xss = require('xss');

const notesService = {
  findJunction(db, user_id, game_id) {
    return db
      .select('id')
      .from('user_games_junction')
      .where({ user_id })
      .where({ game_id })
      .first()
  },
  getNotes(db, junction_id) {
    return db
      .select('*')
      .from('notes')
      .where({ junction_id })
  },
  addNote(db, newNote) {
    console.log(newNote)
    return db
      .insert(newNote)
      .into('notes')
      .returning('*')
      .then(note => note[0])
  },
  deleteNote(db, id) {
    console.log('deleting '+id)
    return db
      .delete()
      .from('notes')
      .where({ id })
  },
  editNote(db, id, newInfo) {
    return db
      .update(newInfo)
      .from('notes')
      .where({ id })
      .returning('*')
  },
  verifyNote(newNote) {
    const { title, content, junction_id } = newNote;
    const note = {title, content, junction_id};
    for (const [key, value] of Object.entries(note)) {
      if (value == null) {
        return key
      }
    }
    const addedNote = ({
      title: xss(title),
      content: xss(content),
      junction_id
    })
    if (newNote.id) addedNote.id = newNote.id;
    return addedNote
  }
}

module.exports = notesService;