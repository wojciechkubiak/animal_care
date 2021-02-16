import AuthData from "./../models/auth_data";
require("dotenv").config({ path: __dirname + '/../../.env' });
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");


exports.registerUser = (require, result, next) => {
  const data = {
    id: require.body.id,
    mail: require.body.email,
    password: require.body.password
  };

  AuthData.findOne({
    where: {
      mail: require.body.email,
    },
  })
    .then(() => {
      bcrypt.hash(require.body.password, 10, (error, hash) => {
        data.password = hash;
        AuthData.create(data)
          .then((user) => {
            result.json({
              status: `${user.mail} - created`,
            });
          })
          .catch((error) => {
            result.send(`${error} - failed`);
          });
      });
    })
    .catch((error) => {
      result.send(error);
    });
};

exports.loginUser = (require, result, next) => {
  AuthData.findOne({
    where: {
      mail: require.body.email,
    }
  })
    .then((user) => {
      if (user) {
        if (bcrypt.compareSync(require.body.password, user.password)) {
          let token = jwt.sign(
            user.dataValues,
            process.env.DB_KEY,
            {
              expiresIn: "7d"
            }
          );
          result.json({ token: token });
        } else {
          result.status(400).json({ error: "Wrong password" });
        }
      } else {
        result.status(400).json({ error: "Login not found" });
      }
    })
    .catch((error) => {
      result.status(400).json({ error: error });
    });
};
