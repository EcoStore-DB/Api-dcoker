import { DataTypes } from "sequelize";
import sequelize from "../database/connection.js";

const DetalleOrden = sequelize.define(
  "DetalleOrden",
  {
    id_detalle: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    id_orden: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    id_producto: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    cantidad: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    subtotal: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: true,
    },
  },
  {
    tableName: "DetallesOrden",
    timestamps: false,
  }
);

export default DetalleOrden;
