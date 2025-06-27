import { getConnection, sql } from "../database/connection.js";

// Obtener todos los usuarios
export const getUsuarios = async (req, res) => {
  try {
    const pool = await getConnection(); // Establecer conexión
    const result = await pool.request().query("SELECT * FROM Usuarios"); // Ejecutar consulta
    res.status(200).json(result.recordset); // Retornar los resultados
  } catch (error) {
    console.error("Error al obtener usuarios:", error);
    res.status(500).json({ error: "Error al obtener usuarios" });
  }
};

// Crear un usuario
export const createUsuario = async (req, res) => {
  try {
    const { nombre, correo, contraseña, rol } = req.body;

    // Validar datos de entrada
    if (!nombre || !correo || !contraseña || !rol) {
      return res.status(400).json({ error: "Todos los campos son obligatorios" });
    }

    const pool = await getConnection(); // Establecer conexión
    await pool
      .request()
      .input("nombre", sql.VarChar(100), nombre)
      .input("correo", sql.VarChar(100), correo)
      .input("contraseña", sql.VarChar(255), contraseña)
      .input("rol", sql.VarChar(50), rol)
      .query(
        "INSERT INTO Usuarios (nombre, correo, contraseña, rol) VALUES (@nombre, @correo, @contraseña, @rol)"
      ); // Ejecutar la consulta

    res.status(201).json({ message: "Usuario creado exitosamente" });
  } catch (error) {
    console.error("Error al crear usuario:", error);
    res.status(500).json({ error: "Error al crear usuario" });
  }
};
