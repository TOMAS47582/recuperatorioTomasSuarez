const API_URL = "http://localhost:3000/api";

const formulario = document.querySelector("#form-turno");
const comboProfesionales = document.querySelector("#profesional");
const listaTurnos = document.querySelector("#lista-turnos");
const tablaRecaudacion = document.querySelector("#tabla-recaudacion");
const mensaje = document.querySelector("#mensaje");

const formatearPrecio = (valor) =>
  new Intl.NumberFormat("es-AR", {
    style: "currency",
    currency: "ARS"
  }).format(valor);

// TODO: cargar los profesionales y completar el combo.

// TODO: cargar y mostrar los turnos en la tabla.

// TODO: cargar y mostrar la recaudación en la tabla.

// TODO: registrar un turno al enviar el formulario.

// TODO: registrar pagos usando delegación de eventos o eventos en los botones.

// TODO: mostrar mensajes claros de éxito y error provenientes de la API.

