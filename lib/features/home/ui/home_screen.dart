import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/features/home/ui/widgets/drawer_view.dart';
import 'package:awfar_captain/features/home/ui/widgets/home_map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/assets_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: SvgPicture.asset(AssetsManager.icNotification),
            onPressed: () => context.pushNamed(Routes.notification),
          ),
        ],
      ),
      drawer: const DrawerView(),
      body:const HomeMapView(),
    );
  }
}
