import 'package:awfar_captain/features/home/ui/widgets/drawer_view.dart';
import 'package:awfar_captain/features/home/ui/widgets/home_map_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/color_manager.dart';
import '../../../core/theming/text_style_manager.dart';
import '../../../lang/locale_keys.g.dart';
import '../logic/home_cubit.dart';
import '../logic/home_state.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BlocBuilder< HomeCubit, HomeStates >( builder: (context, state) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.read<HomeCubit>().isOnline
                  ? LocaleKeys.homeAppBarTitle1.tr()
                  : LocaleKeys.homeAppBarTitle2.tr(),
              style: TextStyleManager.font17TextColor600,
            ),
            horizontalSpace(5.w),
            Switch(
              trackOutlineColor: WidgetStateProperty.resolveWith(
                    (final Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return ColorManager.green;
                  }
                  return ColorManager.darkGrey;
                },
              ),
              inactiveThumbColor: ColorManager.darkGrey,
              activeColor: ColorManager.green,
              activeTrackColor: ColorManager.originalWhite,
              inactiveTrackColor: ColorManager.originalWhite,
              value: context.read<HomeCubit>().isOnline,
              onChanged: (value) =>
                  context.read<HomeCubit>().chaneConnectionState(value),
            ),
          ],
        ),
        ),
        // actions: [
        //   IconButton(
        //     icon: SvgPicture.asset(AssetsManager.icNotification),
        //     onPressed: () => context.pushNamed(Routes.notification),
        //   ),
        // ],
      ),
      drawer:  DrawerView(
        onChangeLang: (String value) {
          context.read<HomeCubit>().onSelectLang(context, value);
        },),
      body: const HomeMapView(),
      bottomSheet: BlocBuilder<HomeCubit, HomeStates>( builder: (context, state) => Wrap(
        children: [
          Container(
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.darkGrey,
                    blurRadius: 12,
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 1,
                    offset: Offset(
                      0,
                      -5,
                    ),
                  ),
                ],
                color: ColorManager.originalWhite,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10.0))),
            padding: const EdgeInsets.only(
                top: 15.0,
                right: 18.0,
                left: 18.0,
                bottom: 25.0
            ),
            child: SingleChildScrollView(
                child: context.read<HomeCubit>().bottomSheets()
            ),
          ),
        ],
      ),
      ),
    );
  }
}
