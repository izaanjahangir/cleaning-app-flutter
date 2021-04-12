const express = require("express");
const app = express();

const constants = require("./constants");
const controllers = require("./controllers");

// Middlewares
app.use(express.json());

app.post("/api/create-customer", controllers.createCustomer);

app.listen(constants.PORT, () =>
  console.log("Server is running on PORT " + constants.PORT)
);
