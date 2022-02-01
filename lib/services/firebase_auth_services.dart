import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

////////////////// Login User with Email and password.......................  return firebase user
  Future<User> signInWIthEmailPassword(String email, String password) async {
    UserCredential usercredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);

    return usercredential.user;
  }

/////////////////// Register user with email and password ..................... return firebase user
  Future<User> signUpWIthEmailPassword(String email, String password) async {
    UserCredential usercredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    return usercredential.user;
  }

////////////////// Firebase auth log out ....................
  Future<void> signOut() async {
    return await auth.signOut();
  }
}
