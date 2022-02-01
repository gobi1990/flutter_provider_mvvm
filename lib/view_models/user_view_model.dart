import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel extends ChangeNotifier {
  User _currentUser;

  bool _loading = false;

  User get currentUser => _currentUser;

  bool get loading => _loading;

  setLoading(bool load) {
    _loading = load;
    notifyListeners();
  }

  setUser(User user) {
    _currentUser = user;
  }
}
