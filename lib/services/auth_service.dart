import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth_Service {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //register user
  Future<User?> register(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.message.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      print(e);
    }
  }

  //login user
  Future<User?> login(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    await firebaseAuth.signOut();
  }
}
