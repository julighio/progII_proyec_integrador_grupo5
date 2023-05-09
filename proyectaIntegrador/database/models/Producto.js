module.exports = function (sequelize,dataTypes){
    let alias= "Producto"
    let columnas= {
        id: {

            type:dataTypes.INTEGER,
            autoIcrement: true,
            primaryKey:true

        },
        nombre:{

            type:dataTypes.STRING,

        },
        descripcion: {

            type:dataTypes.STRING

        },
        usuario_id:{

            type:dataTypes.INTEGER

        },
        img_url:{

            type:dataTypes.STRING

        }
    }
    let config= {
        tableName:"productos",
        timestamps: true
    }
    
    const productos = sequelize.define(alias,columnas,config)
    return productos
}