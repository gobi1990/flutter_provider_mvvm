import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider_mvvm/services/firebase_auth_services.dart';
import 'package:flutter_provider_mvvm/views/home_page.dart';
import 'package:flutter_provider_mvvm/views/login_page.dart';
import 'package:provider/provider.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService =
        Provider.of<FirebaseAuthServices>(context, listen: false);
    return StreamBuilder(builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.active) {
        final user = snapshot.data;
        return user != null ? HomeScreen() : LoginScreen();
      }
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
          ),
        ),
      );
    });
  }
}
