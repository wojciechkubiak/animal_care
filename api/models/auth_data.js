const Sequelize = require("sequelize");
const { sequelize_dwh } = require("../utils/connect");

const AuthData = sequelize_dwh.define(
  "AUTH_DATA",
  {
    id: {
      type: Sequelize.TEXT,
      allowNull: false,
      primaryKey: true,
    },
    mail: {
      type: Sequelize.TEXT,
      allowNull: false,
      unique: true,
    },
    password: {
      type: Sequelize.TEXT,
      allowNull: false,
    },
  },
  {
    freezeTableName: true,
    timestamps: false,
  }
);

module.exports = AuthData;
