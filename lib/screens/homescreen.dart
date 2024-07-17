// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:nirikshan/screens/splasscreen.dart';
// import 'package:nirikshan/services/auth_service.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   FirebaseFirestore firebase = FirebaseFirestore.instance;
//   final Completer<GoogleMapController> _controller = Completer();
//   static const LatLng sourselocation = LatLng(37, -122);
//   static const LatLng destination = LatLng(25, 120);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Home"), centerTitle: true, actions: [
//         TextButton.icon(
//           onPressed: () {},
//           icon: Icon(Icons.logout),
//           label: Text("Logout"),
//           style: TextButton.styleFrom(primary: Colors.white),
//         )
//       ]),
//       body: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "   Assign Tasks",
//               style: TextStyle(fontSize: 20),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
