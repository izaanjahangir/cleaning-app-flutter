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
}
