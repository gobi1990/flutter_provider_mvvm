import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/routes.dart';
import 'package:flutter_provider_mvvm/services/firebase_auth_services.dart';
import 'package:flutter_provider_mvvm/services/validator.dart';
import 'package:flutter_provider_mvvm/view_models/user_view_model.dart';
import 'package:flutter_provider_mvvm/views/login_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<FirebaseAuthServices>(
            create: (context) => FirebaseAuthServices(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => Validator(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: Routes.generateRoute,
          home: LoginScreen(),
        ));
  }
}
