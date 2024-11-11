import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/networking/local/prefs_manager.dart';
import 'package:awfar_captain/core/networking/local/shared_preferences.dart';
import 'package:awfar_captain/core/networking/remote/dio_factory.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/features/captain_gate/logic/captain_gate_cubit.dart';
import 'package:awfar_captain/features/captain_gate/logic/captain_gate_state.dart';
import 'package:awfar_captain/features/home/logic/home_state.dart';
import 'package:awfar_captain/features/home/ui/account_under_review_screen.dart';
import 'package:awfar_captain/features/home/ui/home_screen_view.dart';
import 'package:awfar_captain/features/home/ui/widgets/drawer_view.dart';
import 'package:awfar_captain/features/home/ui/widgets/home_map_view.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/assets_manager.dart';
import '../logic/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CaptainGateCubit, CaptainGateStates>(
      builder: (context, state) {
        if (context.read<CaptainGateCubit>().myProfile != null) {
          if (context.read<CaptainGateCubit>().accountStatus == true) {
            return HomeScreenView();
          } else {
            return AccountUnderReviewScreen();
          }
        } else {
          if (state is GetProfileError) {
            return Scaffold(
              body: Center(
                child: Column(
                  children: [
                    Text(LocaleKeys.errorText.tr()),
                    TextButton(
                        onPressed: () {
                          DioFactory.handleUnauthorized();
                        },
                        child: Text(
                          LocaleKeys.loginNow.tr(),
                          style: TextStyleManager.font20TextColor600,
                        ))
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: ColorManager.green,
                ),
              ),
            );
          }
        }
      },
    );
  }
}
