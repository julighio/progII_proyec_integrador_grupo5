const express = require('express');
const router = express.Router();
const controller = require('../controllers/userController')
/* GET users listing. */
router.get('/edit/:id', controller.edit);
router.get("/profile-edit/:id",controller.editProfile)
router.post("/update",controller.guardarProfile)



/// router.post('/edit/:id', controller.update); falta crear el update

router.get('/profile/:id?', controller.profile);

/// router.post('/delete/:id', controller.delete); habria que hacer este tambien!
router.get ('/login', controller.login)
router.get ('/register', controller.register)
router.post ('/register', controller.create)
router.post ('/login', controller.checkUser)
module.exports = router;
