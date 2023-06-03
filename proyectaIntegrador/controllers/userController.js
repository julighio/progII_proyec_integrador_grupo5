let data = require('../db/data')
const db = require("../database/models/index")
const usercontroller = {
    profile: function (req,res) {
        id = req.params.id
        db.Usuario.findByPk(id)
        .then(function (user) {
            res.render ('profile',{
            user:user,
            infoUsuario:data.users,
            products: data.products,
            comentarios:data.comentarios, /// hay que cambiar eso de data
            usuarioLogueado:true
        })
        })
        .catch(function (error) {
            console.log(error)
        })

        
    },
    edit: function(req, res){
        id = req.params.id
        db.Usuario.findByPk(id)
        .then(function (user) {
            res.render ('profile',{
            user:user,
            //products: user.products,   Esto todavia le falta 
            //comentarios:user.comentarios,
            usuarioLogueado:true
        })
        })
        .catch(function (error) {
            console.log(error)
        })

        res.render('profile-edit', {
            infoUsuario: data.users,
            products: data.products,
            comentarios:data.comentarios,
            usuarioLogueado: true
        })

    },

    login: function(req,res) {
        return res.render('login', {
            usuarioLogueado: false
        }) 
        
    },
    
    register: function(req,res) {
        return res.render('register', {
            usuarioLogueado: false
        })
    },
    create: function (req,res) {
        let {username,email,password,fecha_de_nac,dni,foto_de_perfil}= req.body
        db.Usuario.create({
            username: req.body.username, /// por que no se carga el username??
            email: req.body.email,
            password: req.body.password, /// falta encriptar la password
            fecha_de_nac: req.body.fecha_de_nac, /// por que no se carga la fecha??
            foto_de_perfil: req.body.foto_de_perfil,
            dni: req.body.dni
        })
        .then(function (data){
            res.redirect("/users/profile")
        })
        .catch(function (err) {
            console.log(err)
        })
    },
    checkUser: function (req,res) {
        let (email,password)= req.body
        db.Usuario.findOne({
            where:{
                email
            }
        })
        .then(function (user) {
            let comparacionPassword = bcrypt.compareSyn(password, Usuario.password) ///fijarse si esta bien ese Usuario con U mayuscula
            if(comparacionPassword){
                console.log("llegue a validar")
                res.redirect("/users/register"+ user.id)
            }
        })
    }
    
}

module.exports = usercontroller