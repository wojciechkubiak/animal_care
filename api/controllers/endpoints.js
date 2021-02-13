import UserData from "./../models/user_data";

import Sequelize from "sequelize";

exports.addUserData = (require, result, next) => {
  const id = require.params.id;
  const firstname = require.body.firstname;
  const lastname = require.body.lastname;
  const gender = require.body.gender;
  const birthday = require.body.birthday;
  const fav_animal = require.body.fav_animal;

  UserData.create({
    id: id,
    firstname: firstname,
    lastname: lastname,
    gender: gender,
    birthday: birthday,
    fav_animal: fav_animal,
  })
    .then((out) => {
      result.status(200).json({ Created: out });
    })
    .catch((error) => {
      result.status(400).json({ error: error });
    });
};