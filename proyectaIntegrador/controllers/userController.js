const db = require("../database/models/index")
const bcrypt =require('bcryptjs')
const { locals } = require('../app')
const data = require("../db/data")
const usercontroller = {
    profile: function (req,res) {
        console.log('llegamos hasta aca')
        let id 
        let id_usuario = req.params.id
        if(req.session.user == id_usuario){
            id = req.session.user.id
        } else if(req.session.user != id_usuario) {
            id = id_usuario
        }
        
        db.Usuario.findByPk(id, {include : [
            {
                association: 'productoUsuarios',
                include:[
                    {association: 'comment'}
                ]
            }
            
        ],
        order: [['created_at', 'DESC']]
        })
        .then(function (user) {
            // res.send(user)
            res.render ('profile',{
            usuario : user   
        })
        })
        .catch(function (error) {
            console.log(error)
        })

        
    },
    edit: function(req, res){
        let id = req.params.id
        console.log("ENTRA BIEN?")
        if(req.session.user){
            if (req.session.user.id != id){
                return res.redirect(`/users/edit/${req.session.user.id}`)
            }else{
                db.Usuario.findByPk(id,
                    {include :[ 
                        {
                            association: 'productoUsuarios',
                            include:[
                                {association: 'comment'}
                            ]
                        }]
                    })
                    
            .then((user) => {
                if(user == null){
                    return res.redirect("/")
                }else{
                    return res.render("profile-edit",{user})
                }
        })
            .catch(function (error) {
            console.log(error)
            })
            
       
            }
        }else{
            res.redirect("/users/login")
        }  
    },

    login: function(req,res) {
        if (req.session.user){
            res.redirect('/')
        }else{
            res.render('login')
        }  
        
    },
    
    register: function(req,res) {
        if (req.session.user){
            res.redirect('/')
        }else{
            res.render('register')
        } 

    },
    create: function (req,res) {
        let {username,nombre, email,password,fecha_de_nac,dni,foto_de_perfil}= req.body;
        if (
            (password == '') ||
            (password.length < 4) ||
            (email == '')
        ){
            let errors = {}
            if (password == '') {
                errors.message = "Debes ingresar una contraseña"
            } else if (password.length < 4){
                errors.message = "Debes ingresar una contraseña de más de 3 caracteres"
            } else {
                errors.message = "Debes ingresar un email"
            }
            res.locals.errors = errors
            res.render('register')
        }else {
            db.Usuario.findOne({
                where: {
                    email:email
                }
            })
            .then(function(data){
                if (data){
                    let errors = {}
                    errors.message = "Ya a existe un usuario con ese email"
                    res.locals.errors=errors
                    res.render('register')
                } else {
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
                }
            })
            .catch(function(err){
                console.log(err)
            })
        }
    },
    checkUser: function (req,res) {
        
        let {email,password, recordarme}= req.body
        
        db.Usuario.findOne({
            where:{
                email:email
            }
        })
        .then(function (usuario) {

        if (usuario !== null) {
            let comparacionPassword = bcrypt.compareSync(password, usuario.password) 
            if(comparacionPassword){
                console.log("llegue a validar")
                req.session.user = {
                    id: usuario.id,
                    username: usuario.username,
                }
                if (recordarme === 'on'){
                    res.cookie('recordarUsuario', {
                        id: usuario.id,
                        name: usuario.username
                    }, {
                        maxAge: 1000*60*1
                    })
                }
                //res.redirect("/users/profile/"+ user.id)
                res.redirect('/')
            } else {
                let errors={}
                errors.message = "Contraseña Incorrecta"
                res.locals.errors = errors 
                return res.render('login')
            }
        } else{
            let errors = {}
            res.locals.errors= errors
            errors.message = "No existe este usuario!"
            return res.render("login")
        }
        })
        .catch(function(err){
            res.send(err)
        })
    },
    editprofile:function(req,res) {
        const user = {
            username: req.body.username,
            email: req.body.email,
            fecha_de_nac: req.body.fecha_de_nac,
            dni: req.body.dni
        }
        db.Usuario.update(user,{
            where:{
                id:req.session.id
            }
        })
        .then(function(user){
            user.id=req.session.user.id
            req.session.user=user
            return res.redirect(`/users/profile/${user.id}`)
        })
        .catch(function(error){
            console.log(error)
        })
    }

    
}

module.exports = usercontroller