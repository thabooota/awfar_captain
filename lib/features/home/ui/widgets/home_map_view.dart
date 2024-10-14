import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeMapView extends StatelessWidget {
  const HomeMapView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.read<HomeCubit>();
    return GoogleMap(
      markers: homeCubit.markers,
      polylines: homeCubit.polyLines,
      onMapCreated: (GoogleMapController controller) {
        homeCubit.googleMapController = controller;
        // homeCubit.addCustomMapIcons();
      },
      initialCameraPosition: homeCubit.cameraPosition,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
    );
  }
}