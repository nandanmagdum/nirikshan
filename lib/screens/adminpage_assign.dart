import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  AdminHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assign Task"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Assign Tasks"),
          ],
        ),
      ),
    );
  }
}
