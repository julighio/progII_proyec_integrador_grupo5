let data = require('../db/data')

const usercontroller = {
    profile: function (req,res) {
        return res.render ('profile',{
            infoUsuario: data.users,
            products: data.products,
            comentarios:data.comentarios,
            usuarioLogueado:true
        })
        
    },
    edit: function(req, res){
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
}

module.exports = usercontroller