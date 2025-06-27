import { getConnection, sql } from "../database/connection.js";

// Obtener todos los productos
export const getProductos = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM Productos");
    res.status(200).json(result.recordset);
  } catch (error) {
    console.error("Error al obtener productos:", error);
    res.status(500).json({ error: "Error al obtener productos" });
  }
};

// Obtener un producto por ID
export const getProductoById = async (req, res) => {
  try {
    const { id } = req.params;
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("id", sql.Int, id)
      .query("SELECT * FROM Productos WHERE id_producto = @id");
    if (result.recordset.length === 0) {
      return res.status(404).json({ error: "Producto no encontrado" });
    }
    res.status(200).json(result.recordset[0]);
  } catch (error) {
    console.error("Error al obtener producto:", error);
    res.status(500).json({ error: "Error al obtener producto" });
  }
};

// Crear un producto
export const createProducto = async (req, res) => {
  try {
    const { nombre, descripcion, precio, stock, id_vendedor, categoria, sostenible, promedio_calificacion } = req.body;
    const pool = await getConnection();
    await pool
      .request()
      .input("nombre", sql.VarChar(100), nombre)
      .input("descripcion", sql.Text, descripcion)
      .input("precio", sql.Decimal(10, 2), precio)
      .input("stock", sql.Int, stock)
      .input("id_vendedor", sql.Int, id_vendedor)
      .input("categoria", sql.VarChar(50), categoria)
      .input("sostenible", sql.Bit, sostenible)
      .input("promedio_calificacion", sql.Decimal(3, 2), promedio_calificacion)
      .query(
        `INSERT INTO Productos (nombre, descripcion, precio, stock, id_vendedor, categoria, sostenible, promedio_calificacion)
         VALUES (@nombre, @descripcion, @precio, @stock, @id_vendedor, @categoria, @sostenible, @promedio_calificacion)`
      );
    res.status(201).json({ message: "Producto creado exitosamente" });
  } catch (error) {
    console.error("Error al crear producto:", error);
    res.status(500).json({ error: "Error al crear producto" });
  }
};

// Actualizar un producto
export const updateProducto = async (req, res) => {
  try {
    const { id } = req.params;
    const { nombre, descripcion, precio, stock, id_vendedor, categoria, sostenible, promedio_calificacion } = req.body;
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("id", sql.Int, id)
      .input("nombre", sql.VarChar(100), nombre)
      .input("descripcion", sql.Text, descripcion)
      .input("precio", sql.Decimal(10, 2), precio)
      .input("stock", sql.Int, stock)
      .input("id_vendedor", sql.Int, id_vendedor)
      .input("categoria", sql.VarChar(50), categoria)
      .input("sostenible", sql.Bit, sostenible)
      .input("promedio_calificacion", sql.Decimal(3, 2), promedio_calificacion)
      .query(
        `UPDATE Productos
         SET nombre = @nombre,
             descripcion = @descripcion,
             precio = @precio,
             stock = @stock,
             id_vendedor = @id_vendedor,
             categoria = @categoria,
             sostenible = @sostenible,
             promedio_calificacion = @promedio_calificacion
         WHERE id_producto = @id`
      );
    if (result.rowsAffected[0] === 0) {
      return res.status(404).json({ error: "Producto no encontrado" });
    }
    res.status(200).json({ message: "Producto actualizado exitosamente" });
  } catch (error) {
    console.error("Error al actualizar producto:", error);
    res.status(500).json({ error: "Error al actualizar producto" });
  }
};

// Eliminar un producto
export const deleteProducto = async (req, res) => {
  try {
    const { id } = req.params;
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("id", sql.Int, id)
      .query("DELETE FROM Productos WHERE id_producto = @id");
    if (result.rowsAffected[0] === 0) {
      return res.status(404).json({ error: "Producto no encontrado" });
    }
    res.status(200).json({ message: "Producto eliminado exitosamente" });
  } catch (error) {
    console.error("Error al eliminar producto:", error);
    res.status(500).json({ error: "Error al eliminar producto" });
  }
};

// Buscar productos por coincidencia en nombre o categoría
export const searchProductos = async (req, res) => {
  try {
    const { q } = req.query;
    if (!q) {
      return res.status(400).json({ error: "Debe proporcionar un término de búsqueda (q)" });
    }
    const pool = await getConnection();

    // Divide la búsqueda en palabras y arma condiciones dinámicas
    const palabras = q.trim().split(/\s+/);
    let where = '';
    let params = {};

    palabras.forEach((palabra, idx) => {
      where += (idx > 0 ? ' AND ' : '') +
        `(LOWER(nombre) LIKE @p${idx} OR LOWER(categoria) LIKE @p${idx})`;
      params[`p${idx}`] = `%${palabra.toLowerCase()}%`;
    });

    const request = pool.request();
    Object.entries(params).forEach(([key, value]) => {
      request.input(key, sql.VarChar(100), value);
    });

    const query = `SELECT * FROM Productos WHERE ${where}`;
    const result = await request.query(query);

    res.status(200).json(result.recordset);
  } catch (error) {
    console.error("Error al buscar productos:", error);
    res.status(500).json({ error: "Error al buscar productos" });
  }
};
