
import sequelize from "../database/connection.js";

const Producto = sequelize.define("Producto", {
  id_producto: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  nombre: {
    type: DataTypes.STRING(100),
    allowNull: true,
  },
  descripcion: {
    type: DataTypes.TEXT,
    allowNull: true,
  },
  precio: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: true,
  },
  stock: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
  id_vendedor: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
  categoria: {
    type: DataTypes.STRING(50),
    allowNull: true,
  },
  sostenible: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
  },
  promedio_calificacion: {
    type: DataTypes.DECIMAL(3, 2),
    allowNull: true,
  },
}, {
  tableName: "Productos",
  timestamps: false,
});

export default Producto;