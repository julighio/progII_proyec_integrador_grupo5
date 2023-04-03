const express = require('express');
const router = express.Router();
const controller = require('../controllers/userController')
/* GET users listing. */
router.get('/', controller.edit);

module.exports = router;
