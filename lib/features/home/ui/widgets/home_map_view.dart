import 'package:awfar_captain/core/utils/location_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeMapView extends StatefulWidget {
  const HomeMapView({super.key});

  @override
  State<HomeMapView> createState() => _HomeMapViewState();
}

class _HomeMapViewState extends State<HomeMapView> {
  late CameraPosition _cameraPosition;
  LocationService locationService = LocationService();
BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  void addCustomIcon() {
        BitmapDescriptor.fromAssetImage(const ImageConfiguration(), "assets/icons/ic_my_location.png").then((icon) {
          setState(() {
            markerIcon = icon;
          });
        });
  }
  @override
  void initState() {
    _cameraPosition = const CameraPosition(
        target: LatLng(30.167125838855537, 31.244386917367265), zoom: 7.56);
    addCustomIcon();
    super.initState();
  }

  bool isFirstCall = true;
  GoogleMapController? googleMapController;
  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
      onMapCreated: (GoogleMapController controller) {
        googleMapController = controller;
        getMyCurrentLocation();
      },
      initialCameraPosition: _cameraPosition,
      zoomControlsEnabled: false,
    );
  }

  void getMyCurrentLocation() async {
    try {
      LocationData locationData = await locationService.getLocation();
      setCameraPosition(locationData);
      Marker myLocationMarker = Marker(markerId: const MarkerId('my-location-marker'), position: LatLng(locationData.latitude!, locationData.longitude!), icon: markerIcon);
      markers.add(myLocationMarker);
      setState(() {});
    } on LocationServiceException catch (locationServiceException) {
    } on LocationPermissionException catch (locationPermissionException) {
    } catch (e) {}
  }

  void setCameraPosition(LocationData locationData) {
    if (isFirstCall) {
      CameraPosition cameraPosition = CameraPosition(
          target: LatLng(
            locationData.latitude!,
            locationData.longitude!,
          ),
          zoom: 16.2);
      googleMapController
          ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      isFirstCall = false;
    } else {
      googleMapController?.animateCamera(CameraUpdate.newLatLng(
        LatLng(locationData.latitude!, locationData.longitude!),
      ));
    }
  }

}
