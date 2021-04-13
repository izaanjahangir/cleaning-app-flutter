import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import "package:cleaning_app/models/user.dart" as md;

class FirebaseHelpers {
  static createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw {"message": "The password provided is too weak"};
      }

      if (e.code == 'email-already-in-use') {
        throw {"message": "Account already exists"};
      }

      throw {"message": e.message};
    } catch (e) {
      throw {"message": e.message};
    }
  }

  static signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Map userData = await getDocument("users", userCredential.user.uid);
      md.User user = md.User(
          uid: userData["uid"],
          fullName: userData["data"]["fullName"],
          email: userData["data"]["email"]);

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw {"message": "Email or Password is not correct"};
      }

      if (e.code == 'wrong-password') {
        throw {"message": "Email or Password is not correct"};
      }
    } catch (e) {
      throw {"message": e.message};
    }
  }

  static addDocument(String collection, Map data) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(collection);

    return collectionReference.add(data);
  }

  static getDocument(String collection, String doc) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection(collection);
      DocumentSnapshot user = await users.doc(doc).get();

      return {
        "uid": user.id,
        "data": {...user.data()}
      };
    } catch (e) {
      throw {"message": e.message};
    }
  }

  static setDocument(
      String collection, String doc, Map<String, dynamic> data) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(collection);

    try {
      await collectionReference.doc(doc).set(data);

      return null;
    } catch (e) {
      throw e;
    }
  }
}
