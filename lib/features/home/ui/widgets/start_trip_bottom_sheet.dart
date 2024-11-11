import 'package:awfar_captain/features/home/ui/widgets/start_trip_listener.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../logic/home_cubit.dart';

class StartTripBottomSheet extends StatelessWidget {
  const StartTripBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
          Expanded(
          child: Column(
            children: [
              Text(
                LocaleKeys.youOnWay.tr(),
                style: TextStyleManager.font17TextColor400,
                overflow: TextOverflow.fade,
              ),
              Text(
                context.read<HomeCubit>().scheduleTrip == true ?
                context.read<HomeCubit>().scheduledTripsResponse!.to :
                context.read<HomeCubit>().tripAcceptedResponse!.To!,
                style: TextStyleManager.font17TextColor400,
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
          const StartTripListener()
      ],
    );
  }
}
