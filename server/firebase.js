const admin = require("firebase-admin");
const serviceAccount = require("./firebase-service-account.json");

const firebase = {};

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

firebase.updateDocument = async function (collection, doc, payload) {
  return admin
    .firestore()
    .collection(collection)
    .doc(doc)
    .set(payload, { merge: true });
};

firebase.addDocument = async function (collection, payload) {
  return admin.firestore().collection(collection).add(payload);
};

firebase.getDocument = async function (collection, doc) {
  try {
    const snapshot = await admin
      .firestore()
      .collection(collection)
      .doc(doc)
      .get();

    return { uid: snapshot.id, data: snapshot.data() };
  } catch (e) {
    throw e;
  }
};

firebase.findUserByEmail = async function (email) {
  try {
    const snapshot = await admin
      .firestore()
      .collection("users")
      .where("email", "==", email)
      .get();

    return { uid: snapshot.docs[0].id, data: snapshot.docs[0].data() };
  } catch (e) {
    throw e;
  }
};

module.exports = firebase;
