const data = require ('../db/data')

const indexController = {

    index: function(req,res){
        return res.render('index', {
            products: data.products,
            comentarios: data.comentarios,
            usuarioLogueado: false
        })
        

    },    
}

module.exports = indexController