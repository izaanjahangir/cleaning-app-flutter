const admin = require("firebase-admin");
const firebase = require("./firebase");
const helpers = require("./helpers");
const keys = require("./keys");
const controllers = {};

const stripe = require("stripe")(keys.STRIPE_SECRET_KEY);

controllers.createCustomer = async function (req, res) {
  try {
    if (!req.body.email) {
      throw new Error("Email is required");
    }

    if (!req.body.name) {
      throw new Error("Name is required");
    }

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
    console.log("e =>", e);
    res.status(400).json({ success: false, message: e.message });
  }
};

controllers.addCard = async function (req, res) {
  try {
    if (!req.body.email) {
      throw new Error("Email is required");
    }

    if (!req.body.token) {
      throw new Error("Token is required");
    }

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
    console.log("e =>", e);

    res.status(400).json({ success: false, message: e.message });
  }
};

controllers.handlePay = async function (req, res) {
  try {
    if (!req.body.card) {
      throw new Error("Card is required");
    }

    if (!req.body.amount) {
      throw new Error("Amount is required");
    }

    if (!req.body.location) {
      throw new Error("Location is required");
    }

    if (!req.body.location.latitude) {
      throw new Error("Latitude is required");
    }

    if (!req.body.location.longitude) {
      throw new Error("Longitude is required");
    }

    if (!req.body.noOfBedrooms) {
      throw new Error("Number of bedrooms is required");
    }

    if (!req.body.time) {
      throw new Error("Time of bedrooms is required");
    }

    const payload = {
      card: req.body.card,
      amount: req.body.amount,
    };

    const card = await firebase.getDocument("cards", payload.card);

    const paymentIntent = await stripe.paymentIntents.create({
      amount: helpers.dollarToCents(payload.amount),
      currency: "usd",
      payment_method_types: ["card"],
      payment_method: card.data.cardToken,
      customer: card.data.stripeUser,
    });

    const payment = await stripe.paymentIntents.confirm(paymentIntent.id);

    const transaction = {
      user: card.data.user,
      stripeUser: card.data.stripeUser,
      transaction: payment.id,
      amount: payment.amount,
      currency: payment.currency,
      paymentMethod: payment.payment_method,
      card: card.uid,
      status: payment.status,
    };

    await firebase.updateDocument("transactions", payment.id, transaction);
    const job = {
      location: new admin.firestore.GeoPoint(
        req.body.location["latitude"],
        req.body.location["longitude"]
      ),
      instructions: req.body.instructions,
      extras: req.body.extras,
      noOfBedrooms: req.body.noOfBedrooms,
      time: admin.firestore.Timestamp.fromDate(new Date(req.body.time)),
      addedOn: admin.firestore.FieldValue.serverTimestamp(),
    };

    await firebase.addDocument("jobs", job);

    res.json({
      data: { transaction },
      success: true,
      message: "Customer created",
    });
  } catch (e) {
    console.log("e =>", e);

    res.status(400).json({ success: false, message: e.message });
  }
};

module.exports = controllers;
