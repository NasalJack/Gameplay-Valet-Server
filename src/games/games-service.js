const gamesService = {
  getAllGames(db) {
    return db
      .select('id', 'title', 'short_description', 'genres', 'rating')
      .from('games')
  },
  getMyGames(db, user_id) {
    return db
      .select('user_id', 'game_id', 'title', 'short_description', 'genres', 'rating', 'deleted')
      .from('user_games_junction')
      .join('games', 'user_games_junction.game_id', '=', 'games.id')
      .where({ user_id })
  },
  getGameInfo(db, id) {
    return db
      .select('*')
      .from('games')
      .where({ id })
      .first()
  }
}

module.exports= gamesService;