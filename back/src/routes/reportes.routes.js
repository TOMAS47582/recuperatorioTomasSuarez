const { Router } = require("express");
const router = Router();

// TODO: importar el controlador y definir GET /recaudacion.
const { recaudacionPorProfesional } = require("../controllers/reportes.controller");

router.get("/recaudacion", recaudacionPorProfesional);


module.exports = router;

