import { getConnection, sql } from "../database/connection.js";

// Obtener todas las reseñas
export const getReseñas = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM Reseñas");
    res.status(200).json(result.recordset);
  } catch (error) {
    console.error("Error al obtener reseñas:", error);
    res.status(500).json({ error: "Error al obtener reseñas" });
  }
};

// Crear una reseña
export const createReseña = async (req, res) => {
  try {
    const { id_producto, id_usuario, calificacion, comentario, fecha } = req.body;
    const pool = await getConnection();
    await pool.request()
      .input("id_producto", sql.Int, id_producto)
      .input("id_usuario", sql.Int, id_usuario)
      .input("calificacion", sql.Decimal(3, 2), calificacion)
      .input("comentario", sql.VarChar(500), comentario)
      .input("fecha", sql.DateTime, fecha ? new Date(fecha) : new Date())
      .query(
        `INSERT INTO Reseñas (id_producto, id_usuario, calificacion, comentario, fecha)
         VALUES (@id_producto, @id_usuario, @calificacion, @comentario, @fecha)`
      );
    res.status(201).json({ message: "Reseña creada exitosamente" });
  } catch (error) {
    console.error("Error al crear reseña:", error);
    res.status(500).json({ error: "Error al crear reseña" });
  }
};

// Eliminar una reseña
export const deleteReseña = async (req, res) => {
  try {
    const { id } = req.params;
    const pool = await getConnection();
    const result = await pool.request()
      .input("id", sql.Int, id)
      .query("DELETE FROM Reseñas WHERE id_reseña = @id");
    if (result.rowsAffected[0] === 0) {
      return res.status(404).json({ error: "Reseña no encontrada" });
    }
    res.status(200).json({ message: "Reseña eliminada exitosamente" });
  } catch (error) {
    console.error("Error al eliminar reseña:", error);
    res.status(500).json({ error: "Error al eliminar reseña" });
  }
};
