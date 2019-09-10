const bycrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const config = require('../congig');

const AuthService = {
  getUserWithUsername(db, user_name) {
    return db('gameplay-valet')
      .where({ user_name })
      .first();
  },
  comparePasswords(password, hash) {
    return bycrypt.compare(password, hash)
  },
  createJwt(subject, payload) {
    return jwt.sign(payload, config.JWT_SECRET, {
      subject,
      algorithm: 'HS256'
    });
  },
  verifyJwt(token) {
    return jwt.verify(token, config.JWT_SECRET, {
      algorithms: ['HS256']
    });
  }
};

module.exports = AuthService;