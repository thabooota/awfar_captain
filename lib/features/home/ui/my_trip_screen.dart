import 'package:awfar_captain/features/home/ui/widgets/my_trips_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/color_manager.dart';

class MyTripScreen extends StatefulWidget {
  const MyTripScreen({super.key});

  @override
  State<MyTripScreen> createState() => _MyTripScreenState();
}

class _MyTripScreenState extends State<MyTripScreen> {
  List<bool> myTrips = [
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: AppBar(
        title: const Text("رحلاتي"),
        backgroundColor: ColorManager.scaffold,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorManager.scaffold,
          systemNavigationBarColor: ColorManager.scaffold,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        elevation: 0.0,
        shape: const Border(
          bottom: BorderSide(color: ColorManager.transparent, width: 0.0),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        itemBuilder: (context, index) => MyTripsItem(
          isEnabled: myTrips[index],
          onTap: () {
            setState(() {
              myTrips[index] = !myTrips[index];
            });
          },
        ),
        separatorBuilder: (context, index) => verticalSpace(22.0),
        itemCount: myTrips.length,
      ),
    );
  }
}
