import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMpp extends StatefulWidget {
  const MyMpp({super.key});

  @override
  State<MyMpp> createState() => _MyMppState();
}

class _MyMppState extends State<MyMpp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(17.309593, 74.187861);
  final LatLng _source = const LatLng(17.70, 74.19);
  final LatLng _destination = const LatLng(17.90, 74.99);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          elevation: 2,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 17.0,
          ),
          markers: {
            Marker(
              markerId: MarkerId("source"),
              position: _source,
            ),
            Marker(
              markerId: MarkerId("destination"),
              position: _destination,
            ),
          },
        ),
      ),
    );
  }
}
