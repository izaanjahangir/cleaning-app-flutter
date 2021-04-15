import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _uid, _fullName, _email;

  void update({String uid, String fullName, String email}) {
    if (uid != null) {
      _uid = uid;
    }

    if (fullName != null) {
      _fullName = fullName;
    }

    if (email != null) {
      _email = email;
    }

    notifyListeners();
  }

  void clear() {
    _uid = null;
    _fullName = null;
    _email = null;
  }

  String get email {
    return _email;
  }

  String get fullName {
    return _fullName;
  }

  String get uid {
    return _uid;
  }
}
