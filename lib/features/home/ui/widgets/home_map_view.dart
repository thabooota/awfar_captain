import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/core/utils/location_service.dart';
import 'package:awfar_captain/core/widgets/app_text_button.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../../core/utils/assets_manager.dart';

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
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/icons/ic_my_location.png")
        .then((icon) {
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
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   showBottomSheet();
    // });
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
      Marker myLocationMarker = Marker(
        markerId: const MarkerId('my-location-marker'),
        position: LatLng(locationData.latitude!, locationData.longitude!),
        icon: markerIcon,
      );
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
            padding: const EdgeInsets.only(top: 15.0, right: 18.0, left: 18.0, bottom: 25.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 120.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManager.lighterGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text("انت غير متصل ", style: TextStyleManager.font25White600.copyWith(color: ColorManager.originalBlack),)),
            ),
          ),
            ]));
  }
}
