import 'package:awfar_captain/core/widgets/back_icon_button.dart';
import 'package:awfar_captain/features/home/ui/widgets/scheduled_trip_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/color_manager.dart';
import '../../../lang/locale_keys.g.dart';
import '../logic/home_cubit.dart';
import '../logic/home_state.dart';

class ScheduledTripScreen extends StatefulWidget {
  const ScheduledTripScreen({super.key});

  @override
  State<ScheduledTripScreen> createState() => _ScheduledTripScreenState();
}

class _ScheduledTripScreenState extends State<ScheduledTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: AppBar(
        title: Text(LocaleKeys.scheduleTrip.tr()),
        backgroundColor: ColorManager.scaffold,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorManager.scaffold,
          systemNavigationBarColor: ColorManager.scaffold,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        elevation: 0.0,
        leading: BackIconButton(),
        shape: const Border(
          bottom: BorderSide(
              color: ColorManager.transparent,
              width: 0.0,
          ),
        ),
      ),
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetScheduledTripsLoadingState) {
            return Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                    color: ColorManager.green, size: 35.0));
          } else {
            if (context.read<HomeCubit>().scheduledTrips.isNotEmpty) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                itemBuilder: (context, index) => ScheduledTripItem(
                  isEnabled: context.read<HomeCubit>().myTripsActive[index],
                  onTap: () {
                    setState(() {
                      context.read<HomeCubit>().myTripsActive[index] =
                      !context.read<HomeCubit>().myTripsActive[index];
                    });
                  },
                  tripEntity: context.read<HomeCubit>().scheduledTrips[index],
                ),
                separatorBuilder: (context, index) => verticalSpace(22.0),
                itemCount: context.read<HomeCubit>().scheduledTrips.length,
              );
            } else {
              return  Center(child: Text(LocaleKeys.noTripsFound.tr()));
            }
          }
        },
      ),
    );
  }
}