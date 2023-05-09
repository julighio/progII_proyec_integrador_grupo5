const data = require ('../db/data')
const db= require("../database/models/index")
const indexController = {

    index: function(req,res){
        db.Producto.findAll()
        .then(function (data) {
            console.log(data)
        })
        .catch(function (error) {
            console.log(error)
        })
        
        
        return res.render('index', {
            products: data.products,
            comentarios: data.comentarios,
            usuarioLogueado: false
        })
        

    },    
}

module.exports = indexController