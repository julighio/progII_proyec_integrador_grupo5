let data = require('../db/data')

const usercontroller = {
    profile: function (req,res) {
        return res.render ('profile',{
            infoUsuario: data.users,
            products: data.products,
            comentarios:data.comentarios
        })
        
    },
    edit: function(req, res){
        res.render('profile-edit', {
            infoUsuario: data.users,
            products: data.products,
            comentarios:data.comentarios
        })

    },

    login: function(req,res) {
        return res.render('login')
        
    },
    
    register: function(req,res) {
        return res.render('register')
    },
}

module.exports = usercontroller