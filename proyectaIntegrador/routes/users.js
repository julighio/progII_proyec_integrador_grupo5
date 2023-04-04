const express = require('express');
const router = express.Router();
const controller = require('../controllers/userController')
/* GET users listing. */
router.get('/user', controller.edit);
router.get('/profile', controller.profile);

module.exports = router;
