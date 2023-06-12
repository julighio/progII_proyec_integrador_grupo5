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
            allowNull: true,

        },
        email: {
            type:dataTypes.STRING,
            allowNull: false,
            unique: true
        },
        password:{
            type:dataTypes.STRING,
            allowNull: false,

        },
        foto_de_perfil:{
            type:dataTypes.STRING
        },
        dni:{
            type:dataTypes.INTEGER,
            unique: true
        },
        fecha_de_nac:{
            type:dataTypes.DATE

        },
        username:{
            type:dataTypes.STRING,
            unique: true
        }
    }
    let config= {
        tableName:"usuarios",
        timestamps: false
    }
    
    const Usuario = sequelize.define(alias,columnas,config)

    Usuario.associate=function(models){
        Usuario.hasMany(models.Producto, {
            as: 'productoUsuarios',
            foreignKey: 'usuario_id'
        }),

        Usuario.hasMany(models.Comentario,{
            as: 'comentUsuarios', 
            foreignKey: 'usuarios_id',
            timestamps: false,
            underscored:true
        })
    } 
        
    

    return Usuario /* Antes de este se hace la relacion porque una ves que se ejecuta el reutrn*/
}