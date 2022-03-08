const { Pool } = require("pg");

const pool = new Pool({
    user: "postgres",
    host: "localhost",
    database:"restaurant",
    password:"Aika1995!", 
    port: 5436,
});
module.exports = {
  query: (text, params) => pool.query(text, params),
};