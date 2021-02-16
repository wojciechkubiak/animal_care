require("dotenv").config({ path: __dirname + '/../../.env' });

const Sequelize = require("sequelize");

console.log(process.env.DB_NAME);

exports.sequelize_connect = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    dialect: "postgres",
    host: process.env.DB_HOST
  }
);