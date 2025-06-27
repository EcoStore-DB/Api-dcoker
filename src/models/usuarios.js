import { DataTypes } from "sequelize";
import sequelize from "../database/connection.js";

const Usuario = sequelize.define(
  "Usuario",
  {
    id_usuario: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    nombre: {
      type: DataTypes.STRING(100),
      allowNull: true,
    },
    correo: {
      type: DataTypes.STRING(100),
      allowNull: true,
    },
    contraseña: {
      type: DataTypes.STRING(255),
      allowNull: true,
    },
    rol: {
      type: DataTypes.STRING(50),
      allowNull: true,
    },
  },
  {
    tableName: "Usuarios",
    timestamps: false,
  }
);

export default Usuario;

