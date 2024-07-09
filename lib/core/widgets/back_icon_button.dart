import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/assets_manager.dart';
import '../utils/method_manager.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    Locale locale = MethodsManager.getLocate();

    return IconButton(
      onPressed: () => context.pop(),
      icon: Transform.rotate(
        angle: locale == const Locale("ar") ? 3.14 : 0.0,
        child: SvgPicture.asset(AssetsManager.icArrowLeft),
      ),
    );
  }
}
