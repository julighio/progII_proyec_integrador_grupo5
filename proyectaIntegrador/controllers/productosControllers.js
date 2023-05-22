let data = require ('../db/data')
const db = require("../database/models/")

const controladorProductos = {
    product: 

    function(req,res){
        db.Comentario.findAll({raw:true})
        .then(function (data) {
            console.log(data)
        })
        .catch(function (error) {
            console.log(error)
        })
        return res.render ('product',{
            products: data.products,
            comentarios:data.comentarios,
            usuarioLogueado: false
        })
    },

    productAdd: function(req,res){
        return res.render ('product-add', {
            products: data.products,
            comentarios:data.comentarios,
            infoUsuario: data.users,
            usuarioLogueado: true
        })
    },

    searchResults: function(req,res) {
        return res.render('search-results', {
            products: data.products,
            usuarioLogueado: false
        })
    },
}

module.exports = controladorProductos