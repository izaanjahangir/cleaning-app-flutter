const firebase = require("./firebase");
const keys = require("./keys");
const controllers = {};

const stripe = require("stripe")(keys.STRIPE_SECRET_KEY);

controllers.createCustomer = async function (req, res) {
  try {
    const payload = {
      email: req.body.email,
      name: req.body.name,
    };

    const firebaseUser = await firebase.findUserByEmail(payload.email);
    const customer = await stripe.customers.create(payload);
    await firebase.updateDocument("users", firebaseUser.uid, {
      stripeId: customer.id,
    });

    res.json({
      data: {},
      success: true,
      message: "Customer created",
    });
  } catch (e) {
    res.status(400).json({ success: false, message: e.message });
  }
};

module.exports = controllers;
