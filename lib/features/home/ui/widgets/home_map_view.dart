import 'dart:math';

import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/core/utils/location_service.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  Set<Polyline> polyLines = {};
  bool isFirstCall = true;
  GoogleMapController? googleMapController;
  Set<Marker> markers = {};
  BitmapDescriptor locationMarkerIcon = BitmapDescriptor.defaultMarker;
  LatLng? currentLocation;

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/icons/ic_my_location.png")
        .then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });
  }

  LatLngBounds getLatLngBounds(List<LatLng> points) {
    double minLat = double.infinity;
    double maxLat = double.negativeInfinity;
    double minLng = double.infinity;
    double maxLng = double.negativeInfinity;

    for (LatLng point in points) {
      minLat = min(minLat, point.latitude);
      maxLat = max(maxLat, point.latitude);
      minLng = min(minLng, point.longitude);
      maxLng = max(maxLng, point.longitude);
    }

    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }

  void displayRoute({required double lat, required double long}) {
    Marker locationMarker = Marker(
      markerId: const MarkerId('destination location'),
      position: LatLng(lat, long),
      icon: locationMarkerIcon,
    );

    Polyline route = Polyline(
      color: ColorManager.blue,
      width: 5,
      polylineId: const PolylineId("route"),
      points: context.read<HomeCubit>().latLng,
    );

    LatLngBounds bounds = getLatLngBounds(context.read<HomeCubit>().latLng);

    googleMapController
        ?.animateCamera(CameraUpdate.newLatLngBounds(bounds, 32.0))
        .whenComplete(() {
      markers.add(locationMarker);
      polyLines.add(route);
    });

    setState(() {});
  }

  @override
  void initState() {
    _cameraPosition = const CameraPosition(
        target: LatLng(30.167125838855537, 31.244386917367265), zoom: 7.56);
    addCustomIcon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
      polylines: polyLines,
      onMapCreated: (GoogleMapController controller) {
        googleMapController = controller;
        getMyCurrentLocation();
      },
      initialCameraPosition: _cameraPosition,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
    );
  }

  void getMyCurrentLocation() async {
    try {
      LocationData locationData = await locationService.getLocation();
      currentLocation = LatLng(locationData.latitude!, locationData.longitude!);

      setCameraPosition();
      Marker myLocationMarker = Marker(
        markerId: const MarkerId('my-location-marker'),
        position: currentLocation!,
        icon: markerIcon,
      );
      markers.add(myLocationMarker);
      setState(() {});
    } on LocationServiceException catch (locationServiceException) {
      debugPrint(
          "locationServiceException.toString(): ${locationServiceException.toString()}");
    } on LocationPermissionException catch (locationPermissionException) {
      debugPrint(
          "locationPermissionException.toString(): ${locationPermissionException.toString()}");
    } catch (e) {
      debugPrint("e.toString(): ${e.toString()}");
    }
  }

  void setCameraPosition() {
    if (isFirstCall) {
      CameraPosition cameraPosition = CameraPosition(
        target: currentLocation!,
        zoom: 16.4,
      );
      googleMapController
          ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      isFirstCall = false;
    } else {
      googleMapController?.animateCamera(
        CameraUpdate.newLatLng(currentLocation!),
      );
    }
  }

  void showBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        elevation: 10.0,
        backgroundColor: ColorManager.originalWhite,
        useSafeArea: true,
        barrierColor: Colors.white.withOpacity(0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        context: context,
        builder: (context) => Wrap(children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, right: 18.0, left: 18.0, bottom: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 120.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorManager.lighterGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    "انت غير متصل ",
                    style: TextStyleManager.font25White600
                        .copyWith(color: ColorManager.originalBlack),
                  )),
                ),
              ),
            ]));
  }
}
