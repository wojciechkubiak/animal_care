import UserData from "./../models/user_data";
import AuthData from "./../models/auth_data";
import Sequelize from "sequelize";

exports.addUserData = (require, result, next) => {
  const id = require.params.id;
  const firstname = require.body.firstname;
  const lastname = require.body.lastname;
  const gender = require.body.gender;
  const birthday = require.body.birthday;

  UserData.create({
    id: id,
    firstname: firstname,
    lastname: lastname,
    gender: gender,
    birthday: birthday,
  })
    .then((out) => {
      result.status(200).json({ Created: out });
    })
    .catch((error) => {
      result.status(400).json({ error: error });
    });
};

exports.getUsers = async (require, result, next) => {
  const mail = await AuthData.findOne({
    attributes: ['mail'],
    where: {id: require.user.id}
  });

  if(!mail) {
    result.status(400).send("Mail not found");
  } else {
    result.status(200).send(mail);
  }
  // console.log(require.user.id);
}