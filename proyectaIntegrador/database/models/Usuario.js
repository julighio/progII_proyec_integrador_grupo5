module.exports = function (sequelize,dataTypes){
    let alias= "Usuario"
    let columnas= {
        id: {

            type:dataTypes.INTEGER,
            autoIcrement: true,
            primaryKey:true

        },
        nombre:{

            type:dataTypes.STRING,

        },
        email: {

            type:dataTypes.STRING

        },
        password:{

            type:dataTypes.STRING

        },
        foto_de_perfil:{

            type:dataTypes.STRING

        },
        dni:{

            type:dataTypes.INTEGER

        },
        fecha_de_nac:{

            type:dataTypes.DATE

        }
    }
    let config= {
        tableName:"usuarios",
        timestamps: true
    }
    
    const usuarios = sequelize.define(alias,columnas,config)
    return usuarios
}