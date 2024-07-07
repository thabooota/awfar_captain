import 'package:flutter/cupertino.dart';

class AnimationRoute extends PageRouteBuilder {
  final Widget page;

  AnimationRoute({required this.page})
      : super(
          pageBuilder: (context, animation, animationTwo) => Directionality(
            textDirection: TextDirection.rtl,
            child: page,
          ),
          transitionsBuilder: (context, animation, animationTwo, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
