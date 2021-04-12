const keys = require("./keys");
const controllers = {};

const stripe = require("stripe")(keys.STRIPE_SECRET_KEY);

controllers.createCustomer = async function (req, res) {
  try {
    const payload = {
      email: req.body.email,
      name: req.body.name,
    };

    const customer = await stripe.customers.create(payload);

    res.json({
      data: { customer: {id: customer.id} },
      success: true,
      message: "Customer created",
    });
  } catch (e) {
    res.status(400).json({ success: false, message: e.message });
  }
};

module.exports = controllers;
