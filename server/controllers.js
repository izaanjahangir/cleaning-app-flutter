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

controllers.addCard = async function (req, res) {
  try {
    const payload = {
      email: req.body.email,
      token: req.body.token,
    };

    const firebaseUser = await firebase.findUserByEmail(payload.email);

    const paymentMethod = await stripe.paymentMethods.attach(payload.token, {
      customer: firebaseUser.data.stripeId,
    });

    const card = {
      user: firebaseUser.uid,
      stripeUser: firebaseUser.data.stripeId,
      cardToken: paymentMethod.id,
      brand: paymentMethod.card.brand,
      expiryMonth: paymentMethod.card.exp_month,
      expiryYear: paymentMethod.card.exp_year,
      last4: paymentMethod.card.last4,
    };

    await firebase.addDocument("cards", card);

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
