import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../lang/locale_keys.g.dart';

class ResendCodeView extends StatefulWidget {
  const ResendCodeView({super.key});

  @override
  State<ResendCodeView> createState() => _ResendCodeViewState();
}

class _ResendCodeViewState extends State<ResendCodeView> {
  int time = 59;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    decreaseTimer();
  }

  void decreaseTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (time > 0) {
          time--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.noCode,
          style: TextStyleManager.font14Grey400,
        ).tr(),
        TextButton(
          onPressed: () {},
          child: Text(
            "${LocaleKeys.btnNewCode.tr()} "
                "00:${time.toString().padLeft(2, '0')}",
            style: TextStyleManager.font16White500.copyWith(
              color: time <= 0 ? ColorManager.blue : ColorManager.originalBlack,
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}