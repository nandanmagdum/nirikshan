import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

///practice
class takedata extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _phone = TextEditingController();
    TextEditingController _station = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complete Registration"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: _email,
                    decoration: const InputDecoration(hintText: 'email'),
                  ),
                  TextField(
                    controller: _phone,
                    decoration: const InputDecoration(hintText: 'phone number'),
                  ),
                  TextField(
                    controller: _station,
                    decoration: const InputDecoration(hintText: 'email'),
                  ),
                  TextButton(
                    onPressed: () async {
                      CollectionReference users =
                          firestore.collection('police');
                    },
                    child: const Text("Submit"),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
