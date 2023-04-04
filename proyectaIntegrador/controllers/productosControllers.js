let data = require ('../db/data')
const controladorProductos = {
    product: function(req,res){
        return res.render ('product')
    },

    productAdd: function(req,res){
        return res.render ('product-add')
    },
}

module.exports = controladorProductos