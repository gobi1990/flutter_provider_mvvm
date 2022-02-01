import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/views/home_page.dart';
import 'package:flutter_provider_mvvm/views/login_page.dart';

class Routes {
  Routes._();

  static const String home = '/views/home_page';
  static const String login = '/views/login_page';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
