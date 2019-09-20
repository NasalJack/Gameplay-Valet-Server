require('dotenv').config();

module.exports = {
  "migrationDirectory": "migrations",
  "driver": "pg",
  "connectionString": process.env.PRODUCTION_DB_URL,
  "ssl": true
}
