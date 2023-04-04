const data = requiere ('../db/data')

const indexController = {

    index: function(req,res){
        return res.render('index')

    },

    login: function(req,res) {
        return res.render('login')
        
    },
    
    
    
}

module.exports = indexController