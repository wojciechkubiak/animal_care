const cookieParser = require("cookie-parser");
const express = require("express");
const httpErrors = require("http-errors");
const logger = require("morgan");
const path = require("path");
const {
  sequelize_connect
} = require("./utils/connect");
const cors = require("cors");
const indexRouter = require("./routes/index");

import AuthData from './models/auth_data.js'
import UserData from './models/user_data.js';

const app = express();

app.use(cors());
app.use(logger("dev"));
app.use(express.json());
app.use(
  express.urlencoded({
    extended: false,
  })  
);
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

app.use(indexRouter);

app.use((req, res, next) => {
  next(httpErrors(404));
});

app.use((err, req, res, next) => {
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  res.status(err.status || 500);
  res.json(err);
});

sequelize_connect
  .sync()
  .then((result) => {
    console.log(result);
  })
  .catch((error) => {
    console.log(error);
  });

module.exports = app;
