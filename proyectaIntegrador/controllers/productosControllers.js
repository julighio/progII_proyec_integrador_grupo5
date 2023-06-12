const db = require("../database/models/")
let op= db.Sequelize.Op

const controladorProductos = {
    product: 

    function(req,res){
        let id = req.params.id
        db.Producto.findByPk(id,{
            include : [
                {
                    association: 'comment',
                    include:[
                        {association: 'usuarios'}
                    ]
                },
                {association: 'usuarios'}
            ]
        }
                )
        .then(function (data) {
           // res.send(data)
            res.render('product', {
                products: data
            })
        })
        .catch(function (error) {
            console.log(error)
        })
    },

    productAdd: function(req,res){
          res.render ('product-add', {
            products: data.products,
            comentarios:data.comentarios,
            infoUsuario: data.users,
            
        })
    },
    create: function (req,res) {
        db.Producto.create({
            img_url: req.body.image,
            nombre: req.body.name,
            descripcion:req.body.description,
            fecha: req.body.fecha,
            usuario_id: 1   /// aca estoy forzando el id del usuario que va a agregar, esto no deberia ser asi!
            
        })
        .then(function (data) {
           res.redirect("/")
        }) 
        .catch(function (err) {
             console.log(err)
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