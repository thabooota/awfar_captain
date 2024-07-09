import 'package:awfar_captain/core/utils/method_manager.dart';
import 'package:flutter/cupertino.dart';

class AnimationRoute extends PageRouteBuilder {
  final Widget page;

  AnimationRoute({required this.page})
      : super(
          pageBuilder: (context, animation, animationTwo) {
            Locale locale = MethodsManager.getLocate();

            return Directionality(
            textDirection: locale == const Locale("ar") ? TextDirection.rtl : TextDirection.ltr,
            child: page,
          );
          },
          transitionsBuilder: (context, animation, animationTwo, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
