const data = require ('../db/data')
const db= require("../database/models/index")
const {gt: mayorQue} = db.Sequelize.Op
const indexController = {

    index: function(req,res){
        db.Producto.findAll({
            
                raw:true
             })
               

        .then(function (data) {
            console.log(data)
            
        })
        .catch(function (error) {
            console.log(error)
        })
        return res.render('index', {
                products: data.products, /// aca tengo que cambiarlo para linkearlo con la base de datos/// 
                comentarios: data.comentarios,
                usuarioLogueado: false
            })      

    },    
}

module.exports = indexController