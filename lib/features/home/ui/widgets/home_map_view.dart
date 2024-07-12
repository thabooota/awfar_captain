import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeMapView extends StatefulWidget {
  const HomeMapView({super.key});

  @override
  State<HomeMapView> createState() => _HomeMapViewState();
}

class _HomeMapViewState extends State<HomeMapView> {
  final CameraPosition _cameraPosition = const CameraPosition(target:
  LatLng(30.04519863429622, 31.238212986786966), zoom: 14.4746);

  late GoogleMapController googleMapController;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        googleMapController = controller;
      },
      initialCameraPosition: _cameraPosition,
      zoomControlsEnabled: false,
    );
  }
}
