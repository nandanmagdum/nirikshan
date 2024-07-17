import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nirikshan/screens/splasscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
