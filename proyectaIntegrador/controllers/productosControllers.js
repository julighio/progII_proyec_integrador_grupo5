let data = require ('../db/data')
const db = require("../database/models/")
let op= db.Sequelize.Op

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
        let loQueEstaBuscandoElUsuario = req.query.busqueda
        db.Producto.findAll({where:{
            nombre:{[op.like]: `%${loQueEstaBuscandoElUsuario}%`}},
            raw:true })
        .then(function (data) {
        let encontroResultado 
        if (data.length > 0){
            encontroResultado= true
        }else{
            encontroResultado=false
        }
        res.render('search-results', {
            loQueBuscaste: loQueEstaBuscandoElUsuario,
            usuarioLogueado: false,
            resultados: data,
            encontroResultado: encontroResultado
        })
    })
    .catch(function (err) {
        console.log(err)
    })
        
    }
    
}

module.exports = controladorProductos