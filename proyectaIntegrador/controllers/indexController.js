const data = require ('../db/data')
const db= require("../database/models/index")
const { product } = require('./productosControllers')
const {gt: mayorQue} = db.Sequelize.Op
const indexController = {

    index: function(req,res){
        db.Producto.findAll(
            {
                include : [
                    {
                        association: 'comment',
                        include:[
                            {association: 'usuarios'}
                        ]
                    },
                    {association: 'usuarios'}
                ],
            order:[['created_at', 'DESC']]
            },
            

             )
        .then(function (data) {
            console.log(data)
            res.render("index",{
                product : data,
                // user: locals.user SE ME VA
            }
            )
            // res.send(data)
            
        })
        .catch(function (error) {
            console.log(error)
            res.send(error )
        })
    },
    logout: function(req, res){
        req.session.user=undefined
        req.session.destroy()
        res.clearCookie('recordarUsuario')
        res.redirect('/')
    }, 
}

module.exports = indexController