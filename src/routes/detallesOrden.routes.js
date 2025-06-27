import { Router } from "express";
import {
  getDetallesByOrden,
  createDetalleOrden,
  deleteDetalleOrden,
} from "../controllers/detallesOrden.controller.js";

const router = Router();

router.get("/:id_orden", getDetallesByOrden);
router.post("/", createDetalleOrden);
router.delete("/:id_detalle", deleteDetalleOrden);

export default router;