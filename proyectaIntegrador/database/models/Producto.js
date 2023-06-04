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

        }
    }
    let config= {
        tableName:"productos",
        timestamps: true
    }
    
    const productos = sequelize.define(alias,columnas,config)

    productos.associate = function(models){
        productos.belongsTo(models.Usuario,{
            as:'usuario',
            foreignKey: 'usuario_id'
        })
        productos.hasMany(models.Comentario, {
            as: 'prod',
            foreignKey: 'producto_id'
        })
    }

    return productos
}