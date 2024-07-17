import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:nirikshan/screens/constants.dart';

class LocationTracking extends StatefulWidget {
  const LocationTracking({super.key});
  @override
  State<LocationTracking> createState() => OrderTrackingState();
}

class OrderTrackingState extends State<LocationTracking> {
  final Completer<GoogleMapController> _controller = Completer();
  final Location _location = Location();
  static const LatLng _source = LatLng(17.308928, 74.187170);
  static const LatLng _destination = LatLng(17.308100, 74.187999);
  LatLng _userLocation = LatLng(17.308928, 74.187170);
  List<LatLng> polyLineCoordinates = [];
  LocationData? currentLocation;

  void getCurrentLocation() async {
    final location = await _location.getLocation();
    setState(() {
      _userLocation =
          LatLng(location.latitude!.toDouble(), location.longitude!.toDouble());
    });
    // Location location = Location();
    // location.getLocation().then((location) {
    //   currentLocation = location;
    // }
    // );
  }

  //custome icon
  // void loadCustomMarkerIcon() async {
  //   final Uint8List markerIconBytes = await rootBundle.load('assets/images/custom_marker_icon.png');
  //   final BitmapDescriptor bitmapDescriptor = BitmapDescriptor.fromBytes(markerIconBytes);
  //   setState(() {
  //     _customMarkerIcon = bitmapDescriptor;
  //   });
  // }
  // to draw the route
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey,
        PointLatLng(_source.latitude, _source.longitude),
        PointLatLng(_destination.latitude, _destination.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) => polyLineCoordinates.add(
            LatLng(point.latitude, point.longitude),
          ));
      setState(() {});
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    getPolyPoints();
    _location.onLocationChanged.listen((location) {
      setState(() {
        _userLocation = LatLng(
            location.latitude!.toDouble(), location.longitude!.toDouble());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OnDuty"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _source, zoom: 14.5),
        polylines: {
          Polyline(
              polylineId: PolylineId("route"),
              points: polyLineCoordinates,
              color: primaryColor,
              width: 6),
        },
        markers: { 
          //this is the live marker
          Marker(
            markerId: MarkerId("Guard 1"),
            position: _userLocation,
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: const InfoWindow( title: 'Guard 1 (123456789)'),  
          ),
          const Marker(
            markerId: MarkerId("source"),
            position: _source,
            infoWindow: InfoWindow(title: 'Guard 2 (1234567890)' ),
          ),
          const Marker(
            markerId: MarkerId("destination"),
            position: _destination,
            infoWindow: InfoWindow(title: 'Guard 3 (1234567890)'),
          ),
        },
      ),
    );
  }
}
