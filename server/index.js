const express = require("express");
const app = express();

const constants = require("./constants");
const controllers = require("./controllers");

// Middlewares
app.use(express.json());

app.post("/api/create-customer", controllers.createCustomer);
app.post("/api/add-card", controllers.addCard);
app.post("/api/pay", controllers.handlePay);

app.listen(constants.PORT, () =>
  console.log("Server is running on PORT " + constants.PORT)
);
