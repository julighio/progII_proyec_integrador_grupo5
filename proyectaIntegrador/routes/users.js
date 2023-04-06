const express = require('express');
const router = express.Router();
const controller = require('../controllers/userController')
/* GET users listing. */
router.get('/edit', controller.edit);
router.get('/profile', controller.profile);
router.get ('/login', controller.login)
router.get ('/register', controller.register)

module.exports = router;
