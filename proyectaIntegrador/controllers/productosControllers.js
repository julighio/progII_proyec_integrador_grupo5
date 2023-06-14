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
                {
                    
                    association: 'usuarios', 
                    include:[
                        {association: 'productoUsuarios'}
                    ]
                }
            ],
            order: [['comment', 'created_at', 'DESC']]
        })
        .then(function (data) {
            // res.send(data)
            res.render('product', {
                products: data
            })
         })
         .then(function(user){
            res.render('profile',{
                user: user
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
    prodCreate: function (req,res) {
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
            order: [[ 'created_at', 'DESC']],
            include: [
                {association: 'usuarios'},
                {association: 'comment'}
            ]
            })
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
        // res.send(data)
    })
    .catch(function (err) {
        console.log(err)
    })
        
    }, 
    addComment: function(req, res) {
        if (req.session.user){
            let comment={
                productos_id : req.params.id, 
                usuarios_id: req.session.user.id,
                texto: req.body.descripcion
            } 
        
            db.Comentario.create(comment)
                return res.redirect(`productos/product/${req.params.id}`)
            }else {
                return res.redirect('../users/login')
            }
    }
}

module.exports = controladorProductos