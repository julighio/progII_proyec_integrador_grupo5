module.exports = function (sequelize,dataTypes){
    let alias= "Comentario"
    let columnas= {
        id_comentario: {

            type:dataTypes.INTEGER,
            autoIcrement: true,
            primaryKey:true

        },
        usuarios_id:{
            type:dataTypes.INTEGER,

        },
        productos_id: {
            type:dataTypes.INTEGER

        },
        texto:{
            type:dataTypes.STRING

        }
    }
    let config= {
        tableName:"comentarios",
        timestamps: true
    }
    
    const comentarios = sequelize.define(alias,columnas,config)

    comentarios.associate=function(models){
        comentarios.belongsTo(models.Usuario, {
            as: 'comentUsuarios',
            foreignKey: 'comentario_id', 
        }) 

        comentarios.belongsTo(models.Producto, {
            as: 'prod', 
            foreignKey: 'producto_id'
        })
    }

    return comentarios
}