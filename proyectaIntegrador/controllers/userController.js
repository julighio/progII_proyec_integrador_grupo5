let data = require('../db/data')

const usercontroller = {
    profile: function (req,res) {
        return res.render ('profile')
    },
    edit: function(req, res){
        res.render('profile-edit', {
            infoUsuario: data.users[0]
        })

    }
}

module.exports = usercontroller