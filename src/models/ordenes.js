

import { DataTypes } from "sequelize";
import sequelize from "../database/connection.js";

const Orden = sequelize.define("Orden", {
  id_orden: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  id_cliente: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
  fecha: {
    type: DataTypes.DATE,
    allowNull: true,
  },
  total: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: true,
  },
  estado: {
    type: DataTypes.STRING(50),
    allowNull: true,
  },
}, {
  tableName: "Ordenes",
  timestamps: false,
});

export default Orden;
