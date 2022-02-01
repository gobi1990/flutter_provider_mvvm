import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider_mvvm/services/firebase_auth_services.dart';
import 'package:provider/provider.dart';

import '../routes.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _logout(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(),
    );
  }

  void _logout(BuildContext context) async {
    final auth = Provider.of<FirebaseAuthServices>(context, listen: false);
    await auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false);
  }
}
