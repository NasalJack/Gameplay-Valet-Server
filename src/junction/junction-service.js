const junctionService = {
  checkJunctionForRelation(db, user_id, game_id) {
    return db
      .select('*')
      .from('user_games_junction')
      .where({user_id, game_id})
      .first()
  },
  addGameToList(db, user_id, game_id) {
    const newJunction = {user_id, game_id}
    return db
      .into('user_games_junction')
      .insert(newJunction)
      .returning('*')
      .then(junction => junction[0])
  },
  removeGameFromList(db, id) {
    return db
      .into('user_games_junction')
      .update({deleted: 'yes'})
      .where({ id })
      .returning('*')
      .then(junction => junction[0])
  },
  returnGameToList(db, id) {
    return db
      .into('user_games_junction')
      .update({deleted: 'no'})
      .where({ id })
      .returning('*')
      .then(junction => junction[0])
  }
}

module.exports = junctionService;