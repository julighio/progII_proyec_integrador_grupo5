let data = require('../db/data')
const db = require("../database/models/index")
const bcrypt =require('bcryptjs')
const { locals } = require('../app')
const usercontroller = {
    profile: function (req,res) {
        console.log('llegamos hasta aca')
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
        //let errors = {}
        //= {errors.message}
        //locals.error=errors 
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
        let {username,email,password,fecha_de_nac,dni,foto_de_perfil}= req.body;
        let pasEncriptada = bcrypt.hashSync(password,12);
        db.Usuario.create({
            username: username, 
            email: email,
            password: pasEncriptada, /// falta encriptar la password
            fecha_de_nac: fecha_de_nac, 
            foto_de_perfil: foto_de_perfil,
            dni: dni
        })
        .then(function (data){
            res.redirect("/users/login")
        })
        .catch(function (err) {
            console.log(err)
        })
    },
    checkUser: function (req,res) {
        let errors = {}
        
        let {email,password}= req.body
        
        db.Usuario.findOne({
            where:{
                email:email
            }
        })
        .then(function (user) {

        if (user !== null) {
            let comparacionPassword = bcrypt.compareSync(password, user.password) 
            if(comparacionPassword){
                console.log("llegue a validar")
                // req.session.usuario = {
                //     id: user.id,
                //     name: user.username
                // }
                res.redirect("/users/profile/"+ user.id)
            } else {
                res.send('Clave erronea')
            }
    } else{
            errors.message = "No existe este usuario!"
            res.locals.errors= errors
            return res.render("login")
        }
        })
        .catch(function(err){
            res.send(err)
        })
    }
    
}

module.exports = usercontroller