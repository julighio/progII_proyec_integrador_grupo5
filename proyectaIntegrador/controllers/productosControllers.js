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
        if (req.session.user){
            res.render ('product-add')
        }else{
            res.render('/')
        }
          
    },
    prodCreate: function (req,res) {
        if (req.session.user){
            let crear={
                img_url: req.body.image,
                nombre: req.body.name,
                descripcion: req.body.description,
                usuario_id: req.session.user.id
            }
            db.Producto.create(crear)
                return res.redirect('/')
        } else {
            return res.redirect('/users/login')
        }
    },

    searchResults: function(req,res) {
        let loQueEstaBuscandoElUsuario = req.query.busqueda
        db.Producto.findAll({
            where: {
                [op.or]: [ 
                  { nombre: { [op.like]: `%${loQueEstaBuscandoElUsuario}%` } },
                  { descripcion: { [op.like]: `%${loQueEstaBuscandoElUsuario}%` } },
                ],
              },
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
                texto: req.body.comentario
            } 
        
            db.Comentario.create(comment)
                return res.redirect(`/productos/product/${req.params.id}`)
            }else {
                return res.redirect ("/users/login")
            }
    },
    deleteProd: function(req, res){
        db.Comentario.destroy(
            {where:{productos_id:req.body.id}}
        )
        db.Producto.destroy(
            {where:{id:req.body.id}})
      return res.redirect("/")

    },
    editProd: function(req, res){
        let id = req.params.id
        db.Producto.findByPk(id)
        .then(function(data){
            res.render('product-edit', {
                nombre: data.nombre,
                descripcion: data.descripcion,
                img_url: data.image,
                id: data.id
            })
        })
        .catch(function(err){
            console.log(err)
        })
    }, 
    updateProd: function(req, res){
        let id = req.params.id
        let {nombre, descripcion, img_url} = req.body
        if (nombre != ""){
            db.Producto.update({
                nombre : nombre
            }, {
                where: {
                    id
                }
            })
        }
        if (descripcion != ""){
            db.Producto.update({
                descripcion : descripcion
            }, {
                where: {
                    id 
                }
            })
        }
        if (img_url != ""){
            db.Producto.update({
                img_url : img_url
            }, {
                where: {
                    id
                }
            }
            )
        }
        return res.redirect('/')
    }
}

module.exports = controladorProductos