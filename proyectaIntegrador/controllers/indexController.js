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
                ]
            
            },
            // order:[

            // ]

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
        .then(function(user){
            res.render('profile',{
                user: user
            })
        })
        .catch(function (error) {
            console.log(error)
            res.send(error )
        })
        // return res.render('index', {
        //         products: data.products, /// aca tengo que cambiarlo para linkearlo con la base de datos/// 
        //         comentarios: data.comentarios,
                
        //     })      

    },
    logout: function(req, res){
        req.session.user=undefined
        res.redirect('/')

    } 
}

module.exports = indexController