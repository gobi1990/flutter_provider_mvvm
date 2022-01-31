import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider_mvvm/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login Screen',
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: TextFieldWidget(
                    textController: _emailController,
                    hint: 'Email address',
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFieldWidget(
                    textController: _emailController,
                    hint: 'Password',
                  ),
                ),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        left: 30, right: 30, top: 40, bottom: 20),
                    child: ElevatedButton(
                      child: Text('Login'),
                      onPressed: () {},
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
