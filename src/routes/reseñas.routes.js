import { Router } from "express";
import {
  getReseñas,
  createReseña,
  deleteReseña,
} from "../controllers/resenas.controller.js";

const router = Router();

router.get("/", getReseñas);
router.post("/", createReseña);
router.delete("/:id", deleteReseña);

export default router;