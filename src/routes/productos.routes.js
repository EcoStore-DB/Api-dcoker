import { Router } from "express";
import {
  getProductos,
  getProductoById,
  createProducto,
  updateProducto,
  deleteProducto,
  searchProductos, // <-- agrega esto
} from "../controllers/productos.controller.js";

const router = Router();

router.get("/", getProductos);
router.get("/buscar", searchProductos);
router.get("/:id", getProductoById);
router.post("/", createProducto);
router.put("/:id", updateProducto);
router.delete("/:id", deleteProducto);

export default router;