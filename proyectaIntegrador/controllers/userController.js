let data = require('../db/data')

const usercontroller = {
    estamos: function (req,res) {
        res.send("Estamos linkeados? Gracias")
    },
    edit: function(req, res){
        res.render('error', {
            infoUsuario: data.users[0]
        })

    }
}

module.exports = usercontroller