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

        },
        created_at: {
            type:dataTypes.DATE,
            allowNull: true,
        },
        updated_at: {
            type:dataTypes.DATE,
            allowNull: true,
        }
    }
    let config= {
        tableName:"comentarios",
        timestamps: true,
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