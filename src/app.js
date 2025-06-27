import express from "express";
import cors from "cors";
import morgan from "morgan";

import productosRoutes from "./routes/productos.routes.js";
import usuariosRoutes from "./routes/usuarios.routes.js";
import ordenesRoutes from "./routes/ordenes.routes.js";
import detallesOrdenRoutes from "./routes/detallesOrden.routes.js";
import resenasRoutes from "./routes/reseñas.routes.js";

const app = express();

app.use(cors());
app.use(morgan("dev"));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// Ruta de la raíz
app.get("/", (req, res) => {
  res.json({ message: "Bienvenido a la API de EcoStore" });
});
app.get("/api", (req, res) => {
  res.json({ message: "Bienvenido a la raiz" });
});

// Rutas principales bajo /api
app.use("/api/productos", productosRoutes);
app.use("/api/usuarios", usuariosRoutes);
app.use("/api/ordenes", ordenesRoutes);
app.use("/api/detallesOrden", detallesOrdenRoutes);
app.use("/api/reseñas", resenasRoutes);

// Manejo de rutas no encontradas
app.use((req, res, next) => {
  res.status(404).json({ error: "Ruta no encontrada" });
});

// Manejo de errores generales
app.use((err, req, res, next) => {
  console.error("Error general:", err);
  res.status(500).json({ error: "Error interno del servidor" });
});

export default app;
