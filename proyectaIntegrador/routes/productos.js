
/// Se usa para modificar, add, detalle de los productos

const express = require("express");
const router = express.Router();
const productosControllers = require("../controllers/productosControllers");

router.get("/",productosControllers.estamos)

module.exports= router