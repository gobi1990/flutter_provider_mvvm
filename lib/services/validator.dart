import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Validator extends ChangeNotifier {
  String emailError;
  String passwordError;

  String email;
  String pasword;

  setEmail(String email) {
    email = email;
    validateEmail(email);
  }

  setPassword(String password) {
    password = password;
  }

///////////// Validate email address .............. empty or wrong email ---> email error
  bool validateEmail(String value) {
    var emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (value.isEmpty) {
      emailError = 'Email can\'t be empty!';
    } else if (!emailValid) {
      emailError = 'Enter valid email address!';
    } else {
      emailError = null;
      return true;
    }

    return false;
  }

  bool validatePassword(String value) {
    if (value.isEmpty) {
      passwordError = "Password can't be empty";
    } else if (value.length < 6) {
      passwordError = 'Password must have at least 6 characters';
    } else {
      passwordError = null;
      return true;
    }

    return false;
  }

/////////////// Show error message with bottom snack bar........................
  showErrorMessage(GlobalKey<ScaffoldState> key, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    );

    key.currentState.showSnackBar(snackBar);
  }
}
