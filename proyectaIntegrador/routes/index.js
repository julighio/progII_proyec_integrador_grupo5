/// se encarga de presentar la vista principal
const express = require('express');
const router = express.Router();
const indexController = require ('../controllers/indexController')

router.get ('/', indexController.index)
router.get ('/login', indexController.login)
router.get ('/register', indexController.register)
router.get ('/searchResults', indexController.searchResults)



module.exports = router;
