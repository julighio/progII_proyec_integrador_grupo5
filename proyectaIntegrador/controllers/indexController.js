const data = require ('../db/data')

const indexController = {

    index: function(req,res){
        return res.render('index')
        

    },

    login: function(req,res) {
        return res.render('login')
        
    },
    
    register: function(req,res) {
        return res.render('register')
    },

    searchResults: function(req,res) {
        return res.render('search-results')
    }



    
}

module.exports = indexController