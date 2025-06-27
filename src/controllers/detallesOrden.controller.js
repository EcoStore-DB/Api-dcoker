import { getConnection, sql } from "../database/connection.js";

// Obtener detalles de una orden
export const getDetallesByOrden = async (req, res) => {
  try {
    const { id_orden } = req.params;
    const pool = await getConnection();
    const result = await pool.request()
      .input("id_orden", sql.Int, id_orden)
      .query("SELECT * FROM DetallesOrden WHERE id_orden = @id_orden");
    
    const detalles = result.recordset;
    
    if (!detalles.length) {
      return res.status(404).json({ error: "No se encontraron detalles para esta orden" });
    }
    res.status(200).json(detalles);
  } catch (error) {
    console.error("Error al obtener detalles de la orden:", error);
    res.status(500).json({ error: "Error al obtener detalles de la orden" });
  }
};

// Crear un detalle de orden
export const createDetalleOrden = async (req, res) => {
  try {
    const { id_orden, id_producto, cantidad, subtotal } = req.body;
    const pool = await getConnection();
    await pool.request()
      .input("id_orden", sql.Int, id_orden)
      .input("id_producto", sql.Int, id_producto)
      .input("cantidad", sql.Int, cantidad)
      .input("subtotal", sql.Decimal(10, 2), subtotal)
      .query(`
        INSERT INTO DetallesOrden (id_orden, id_producto, cantidad, subtotal)
        VALUES (@id_orden, @id_producto, @cantidad, @subtotal)
      `);
    res.status(201).json({ message: "Detalle de orden creado exitosamente" });
  } catch (error) {
    console.error("Error al crear detalle de orden:", error);
    res.status(500).json({ error: "Error al crear detalle de orden" });
  }
};

// Eliminar un detalle de orden
export const deleteDetalleOrden = async (req, res) => {
  try {
    const { id_detalle } = req.params;
    const pool = await getConnection();
    const result = await pool.request()
      .input("id_detalle", sql.Int, id_detalle)
      .query("DELETE FROM DetallesOrden WHERE id_detalle = @id_detalle");
    
    if (result.rowsAffected[0] === 0) {
      return res.status(404).json({ error: "Detalle de orden no encontrado" });
    }
    res.status(200).json({ message: "Detalle de orden eliminado exitosamente" });
  } catch (error) {
    console.error("Error al eliminar detalle de orden:", error);
    res.status(500).json({ error: "Error al eliminar detalle de orden" });
  }
};
