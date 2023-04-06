const data = require ('../db/data')

const indexController = {

    index: function(req,res){
        return res.render('index', {
            products: data.products
        })
        

    },    
}

module.exports = indexController