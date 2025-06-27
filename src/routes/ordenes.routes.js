import { Router } from "express";
import {
  getOrdenes,
  createOrden,
  deleteOrden,
} from "../controllers/ordenes.controller.js";

const router = Router();

router.get("/", getOrdenes);
router.post("/", createOrden);
router.delete("/:id", deleteOrden);

export default router;