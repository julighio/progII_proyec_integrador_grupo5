let data = require ('../db/data')



const controladorProductos = {
    product: function(req,res){
        console.log(data.products);
        return res.render ('product',{
            product: data.products
        })
    },

    productAdd: function(req,res){
        return res.render ('product-add')
    },

    searchResults: function(req,res) {
        return res.render('search-results')
    },
}

module.exports = controladorProductos