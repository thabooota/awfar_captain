import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AccountUnderReviewScreen extends StatelessWidget {
  const AccountUnderReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            LocaleKeys.accountUnderReview.tr(),
            style: TextStyleManager.font20TextColor600,),
        ),
      ),
    );
  }
}
