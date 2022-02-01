import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider_mvvm/services/firebase_auth_services.dart';
import 'package:flutter_provider_mvvm/services/validator.dart';
import 'package:flutter_provider_mvvm/view_models/user_view_model.dart';
import 'package:flutter_provider_mvvm/widgets/text_field.dart';
import 'package:provider/provider.dart';

import '../routes.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passswordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///////////// Listening user view model by provider ........... context.watch - listener <---- notifylistener
    final userViewModel = context.watch<UserViewModel>();
    final _validator = context.read<Validator>();
    ////// Provider.of<UserViewModel>(context, listen: false);
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset('assets/login_icon.png'))),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(2, 4),
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          spreadRadius: 4,
                        )
                      ]),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      ///////////// email text field...................
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextFieldWidget(
                          textController: _emailController,
                          hint: 'Email address',
                          errorText: _validator.emailError,
                          onChanged: _validator.setEmail(_emailController.text),
                        ),
                      ),
                      //////////// password text field ....................
                      Container(
                        padding:
                            EdgeInsets.only(left: 20, right: 20, bottom: 8),
                        child: TextFieldWidget(
                          textController: _passswordController,
                          hint: 'Password',
                          errorText: _validator.passwordError,
                        ),
                      ),
                      ///////////// Login button ....................
                      Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                              left: 30, right: 30, top: 40, bottom: 20),
                          child: ElevatedButton(
                            child: Stack(
                              children: [
                                Visibility(
                                  visible: !userViewModel.loading,
                                  child: Text('Login'),
                                ),

                                ///////////// Loading circular indicator................
                                Visibility(
                                    visible: userViewModel.loading,
                                    child: SizedBox(
                                      height: 20.0,
                                      width: 20.0,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        strokeWidth: 3,
                                      ),
                                    ))
                              ],
                            ),
                            onPressed: () async {
                              userViewModel.setLoading(true);

/////////////////////////////// Email & password validation...............................
                              bool emailvalidation = _validator
                                  .validateEmail(_emailController.text);

                              bool passwordValidation = _validator
                                  .validatePassword(_passswordController.text);

                              if (emailvalidation && passwordValidation) {
                                ////////////// Login with firebase auth .................
                                User user = await _loginByFirebaseAuth(context);
                                if (user != null) {
                                  //////// home screen navigation................
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, Routes.home, (route) => false);
                                } else {
                                  _validator.showErrorMessage(_scaffoldkey,
                                      'Invalid email and password!');
                                }
                              } else {
                                _validator.showErrorMessage(
                                    _scaffoldkey, 'Enter valid details');
                              }
                              userViewModel.setLoading(false);
                            },
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

///////////////////// Login with firebase auth services......................
  Future<User> _loginByFirebaseAuth(BuildContext context) async {
    try {
      //////////// Only reading/using the class.................. not listen ///////////////
      final auth = Provider.of<FirebaseAuthServices>(context, listen: false);
      final user = await auth.signInWIthEmailPassword(
          _emailController.text, _passswordController.text);

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
