const express = require('express');
const router = express.Router();

const comentariosController = require("../controllers/comentariosController");
router.get ("/",comentariosController.estamos)
module.exports= router