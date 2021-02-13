const Sequelize = require("sequelize");
const { sequelize_connect } = require("../utils/connect");

const UserData = sequelize_connect.define(
  "USER_DATA",
  {
    id: {
      type: Sequelize.TEXT,
      allowNull: false,
      unique: false,
      primaryKey: true
    },
    firstname: {
      type: Sequelize.TEXT,
      allowNull: false,
    },
    lastname: {
      type: Sequelize.TEXT,
      allowNull: false,
    },
    gender: {
      type: Sequelize.TEXT,
      allowNull: false,
    },
    birthday: {
      type: Sequelize.DATEONLY,
      allowNull: false,
    },
    fav_animal: {
      type: Sequelize.TEXT,
      allowNull: false
    }
  },
  {
    freezeTableName: true,
    timestamps: false,
  }
);

module.exports = UserData;
