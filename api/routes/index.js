const path = require("path");
const jwt = require("jsonwebtoken");

require("dotenv").config({ path: __dirname + '/../../.env' });

const express = require("express");

const endpoints = require("../controllers/endpoints");
const login = require("../controllers/login");

const router = express.Router();

const auth = (require, result, next) => {
    const header = require.headers["authorization"];

    if(!header) {
        return result.status(401).send({Access: `Denied`});
    }

    try {
        const data = jwt.verify(header, process.env.DB_KEY);
        require.user = data;
        next();
    } catch(e) {
        result.status(400).send({data: `${header}`});
    }
}

router.post('/register', login.registerUser);
router.post('/login', login.loginUser);
router.post('/user-data', endpoints.addUserData);
router.get('/users', auth, endpoints.getUsers);

module.exports = router;