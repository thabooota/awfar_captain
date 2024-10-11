import 'package:awfar_captain/features/captain_gate/logic/captain_gate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/assets_manager.dart';

class CustomAccountViewRow extends StatelessWidget {
  const CustomAccountViewRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         CircleAvatar(
          backgroundColor: ColorManager.originalWhite,
          radius: 37.0.h,
          child: CircleAvatar(
            backgroundImage:context.read<CaptainGateCubit>().myProfile!.media!.isNotEmpty ? NetworkImage(
                context.read<CaptainGateCubit>().myProfile!.media![0].path) : const AssetImage(AssetsManager.imgProfileUser,),
            radius: 35.5.h,
          ),
        ),
        horizontalSpace(22.0),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.read<CaptainGateCubit>().myProfile!.name,
              style: TextStyleManager.font20TextColor600,
            ),
            verticalSpace(8.0),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 3.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: ColorManager.originalWhite,
                  boxShadow: const [
                    BoxShadow(
                      color: ColorManager.yellow,
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                      blurStyle: BlurStyle.normal,
                    ),
                  ]),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "4.6",
                    style: TextStyleManager.font13Black700,
                  ),
                  horizontalSpace(4.0),
                  SvgPicture.asset(AssetsManager.icFavorites),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
