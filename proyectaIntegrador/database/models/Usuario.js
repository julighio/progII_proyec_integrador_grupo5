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
            allowNull: false,

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
        timestamps: true
    }
    
    const usuarios = sequelize.define(alias,columnas,config)

    usuarios.associate=function(models){
        usuarios.hasMany(models.Producto, {
            as: 'usuario',
            foreignKey: 'usuario_id'
        })

        /*usuarios.belongsToMany(models.Comentario,{
            as: 'comentariosUsuario', 
            thrpugh: '', /* Tabla pibot
            foreignKey: 'usuario_id',
            otherKey: 'comentario_id',
            timestamps: false,
        }) */
    } 
        
    

    return usuarios /* Antes de este se hace la relacion porque una ves que se ejecuta el reutrn*/
}