import { getConnection, sql } from "../database/connection.js";

// Obtener todas las órdenes
export const getOrdenes = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM Ordenes");
    res.status(200).json(result.recordset);
  } catch (error) {
    console.error("Error al obtener órdenes:", error);
    res.status(500).json({ error: "Error al obtener órdenes" });
  }
};

// Crear una nueva orden
export const createOrden = async (req, res) => {
  try {
    const { id_cliente, fecha, total, estado } = req.body;
    const pool = await getConnection();
    await pool
      .request()
      .input("id_cliente", sql.Int, id_cliente)
      .input("fecha", sql.DateTime, fecha ? new Date(fecha) : new Date())
      .input("total", sql.Decimal(18, 2), total)
      .input("estado", sql.VarChar(50), estado)
      .query(
        `INSERT INTO Ordenes (id_cliente, fecha, total, estado)
         VALUES (@id_cliente, @fecha, @total, @estado)`
      );
    res.status(201).json({ message: "Orden creada exitosamente" });
  } catch (error) {
    console.error("Error al crear la orden:", error);
    res.status(500).json({ error: "Error al crear la orden" });
  }
};

// Eliminar una orden
export const deleteOrden = async (req, res) => {
  try {
    const { id } = req.params;
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("id", sql.Int, id)
      .query("DELETE FROM Ordenes WHERE id_orden = @id");
    if (result.rowsAffected[0] === 0) {
      return res.status(404).json({ error: "Orden no encontrada" });
    }
    res.status(200).json({ message: "Orden eliminada exitosamente" });
  } catch (error) {
    console.error("Error al eliminar la orden:", error);
    res.status(500).json({ error: "Error al eliminar la orden" });
  }
};
