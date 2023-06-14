
/// Se usa para modificar, add, detalle de los productos

const express = require("express");
const router = express.Router();
const productosControllers = require("../controllers/productosControllers");

router.get ('/product/:id', productosControllers.product)
router.post ('/product/:id?', productosControllers.addComment)
router.post ('/users/login', productosControllers.addComment)
router.get ('/product', productosControllers.product)
router.get ('/productAdd', productosControllers.productAdd)
router.post ('/productAdd/prodCreate', productosControllers.prodCreate)
router.get ('/searchResults', productosControllers.searchResults)


module.exports= router;