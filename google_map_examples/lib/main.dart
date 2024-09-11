import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Google Maps Example',
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() {
    setState(() {
      _markers.addAll(const[
        Marker(
          markerId: MarkerId('1'),
          position: LatLng(37.7749, -122.4194),
          infoWindow: InfoWindow(title: 'San Francisco'),
        ),
        Marker(
          markerId: MarkerId('2'),
          position: LatLng(34.0522, -118.2437),
          infoWindow: InfoWindow(title: 'Los Angeles'),
        ),
        Marker(
          markerId: MarkerId('3'),
          position: LatLng(40.7128, -74.0060),
          infoWindow: InfoWindow(title: 'New York'),
        ),
        Marker(
          markerId: MarkerId('4'),
          position: LatLng(41.8781, -87.6298),
          infoWindow: InfoWindow(title: 'Chicago'),
        ),
        Marker(
          markerId: MarkerId('5'),
          position: LatLng(37.3382, -121.8863),
          infoWindow: InfoWindow(title: 'San Jose'),
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Example'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.7749, -122.4194), // Default center (San Francisco)
          zoom: 4.0,
        ),
        markers: _markers,
      ),
    );
  }
}
