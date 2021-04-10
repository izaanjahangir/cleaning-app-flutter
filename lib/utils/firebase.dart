import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  static addDocument(String collection, Map data) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(collection);

    return collectionReference.add(data);
  }

  static setDocument(
      String collection, String doc, Map<String, dynamic> data) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(collection);

    try {
      await collectionReference.doc(doc).set(data);

      return null;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
