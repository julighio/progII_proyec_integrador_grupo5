
/// Se usa para modificar, add, detalle de los productos

const express = require("express");
const router = express.Router();
const productosControllers = require("../controllers/productosControllers");

router.get ('/product', productosControllers.product)
router.get ('/productAdd', productosControllers.productAdd)

module.exports= router;