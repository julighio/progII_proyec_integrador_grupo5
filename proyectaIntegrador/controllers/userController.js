let data = require('../db/data')

const usercontroller = {
    profile: function (req,res) {
        return res.render ('profile')
    },
    edit: function(req, res){
        res.render('profile-edit', {
            infoUsuario: data.users[0]
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