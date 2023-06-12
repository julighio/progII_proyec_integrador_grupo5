
const db = require("../database/models/index")
const bcrypt =require('bcryptjs')
const { locals } = require('../app')
const usercontroller = {
    profile: function (req,res) {
        console.log('llegamos hasta aca')
        let id = req.session.user.id 
        db.Usuario.findByPk(id)
        .then(function (user) {
            res.render ('profile',{
            user : user 
            /// hay que cambiar eso de data
            
        })
        })
        .catch(function (error) {
            console.log(error)
        })

        
    },
    edit: function(req, res){
        let id = req.session.user.id
        db.Usuario.findByPk(id)
        .then(function (user) {
            res.render ('profile',{
           
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
        return res.render('register')
    },
    create: function (req,res) {
        let {username,nombre, email,password,fecha_de_nac,dni,foto_de_perfil}= req.body;
        let pasEncriptada = bcrypt.hashSync(password,12);
        db.Usuario.create({
            username: username, 
            nombre: nombre,
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
        
        let {email,password, recordarme}= req.body
        
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
                req.session.user = {
                    id: user.id,
                    name: user.username,
                }
                if (recordarme === 'on'){
                    res.cookie('recordarUsuario', {
                        id: user.id,
                        name: user.username
                    }, {
                        maxAge: 1000*60*1
                    })
                }
                //res.redirect("/users/profile/"+ user.id)
                res.redirect('/users/profile')
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