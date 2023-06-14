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
            allowNull: false,

        },
        descripcion: {
            type:dataTypes.STRING

        },
        usuario_id:{
            type:dataTypes.INTEGER

        },
        img_url:{
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
        tableName:"productos",
        timestamps: true,
        underscored:true
    }
    
    const Producto = sequelize.define(alias,columnas,config)

    Producto.associate = function(models){
        Producto.belongsTo(models.Usuario,{
            as:'usuarios',
            foreignKey: 'usuario_id'
        })
        Producto.hasMany(models.Comentario, {
            as: 'comment',
            foreignKey: 'productos_id'
        })
    }

    return Producto
}