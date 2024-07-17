import 'dart:async';
import 'package:nirikshan/screens/optionpage.dart';
import 'package:nirikshan/services/auth_service.dart';

import './loginpage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => StreamBuilder(
                    stream: Auth_Service().firebaseAuth.authStateChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return LoginPage();
                      }
                      return Option();
                    },
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/LOGO.png'),
          fit: BoxFit.cover,
        )),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
