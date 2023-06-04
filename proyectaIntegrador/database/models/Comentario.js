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
        comentarios.belongsToMany(models.Usuario, {
            as: 'comentUsuarios',
            through: '', 
            foreignKey: 'comentario_id', 
            otherKey: 'usuario_id', 
            timestamps: false
        })

        comentarios.belognsTo(models.Producto, {
            as: 'prod', 
            foreignKey: 'producto_id'
        })
    }

    return comentarios
}