require("dotenv").config({ path: __dirname + '/../.env' });

const Sequelize = require("sequelize");

exports.sequelize_connect = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    dialect: "postgres",
    host: process.env.DB_HOST,
  }
);