
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
// router.post("/product-edit", productosControllers.editProd)
router.get("product-edit/:id?", productosControllers.editProd)
router.post("/updateProd/:id", productosControllers.updateProd)
router.post ('/product/deleteProd', productosControllers.deleteProd)


module.exports= router;