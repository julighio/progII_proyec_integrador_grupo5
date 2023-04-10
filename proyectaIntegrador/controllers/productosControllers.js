let data = require ('../db/data')



const controladorProductos = {
    product: function(req,res){
        return res.render ('product',{
            products: data.products,
            comentarios:data.comentarios
        })
    },

    productAdd: function(req,res){
        return res.render ('product-add')
    },

    searchResults: function(req,res) {
        return res.render('search-results', {
            products: data.products,
        })
    },
}

module.exports = controladorProductos