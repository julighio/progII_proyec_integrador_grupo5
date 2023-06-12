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
        timestamps: false,
        underscored:true
    }
    
    const Comentario = sequelize.define(alias,columnas,config)

    Comentario.associate=function(models){
        Comentario.belongsTo(models.Usuario, {
            as: 'usuarios',
            foreignKey: 'usuarios_id', 
        }) 

        Comentario.belongsTo(models.Producto, {
            as: 'prod', 
            foreignKey: 'productos_id'
        })
    }

    return Comentario
}