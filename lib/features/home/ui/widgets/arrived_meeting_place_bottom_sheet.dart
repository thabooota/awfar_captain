import 'package:awfar_captain/features/home/ui/widgets/arrived_place_listener.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/enums.dart';
import '../../logic/home_cubit.dart';

class ArrivedMeetingPlaceBottomSheet extends StatelessWidget {
  const ArrivedMeetingPlaceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Text(
            context.read<HomeCubit>().scheduleTrip == true? context.read<HomeCubit>().scheduledTripsResponse!.from : context.read<HomeCubit>().tripAcceptedResponse!.From!,
            style: TextStyleManager.font17TextColor400,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        // const Spacer(),
        const ArrivedPlaceListener()
      ],
    );
  }
}
