import { DataTypes } from "sequelize";
import sequelize from "../database/connection.js";

const Reseña = sequelize.define("Reseña", {
  id_reseña: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  id_producto: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
  id_usuario: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
  calificacion: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
  comentario: {
    type: DataTypes.TEXT,
    allowNull: true,
  },
  fecha: {
    type: DataTypes.DATE,
    allowNull: true,
  },
}, {
  tableName: "Reseñas",
  timestamps: false,
});

export default Reseña;