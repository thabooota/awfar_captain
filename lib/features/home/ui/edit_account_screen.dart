import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/features/authentication/logic/register/register_cubit.dart';
import 'package:awfar_captain/features/authentication/logic/register/register_state.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/custom_text_form.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:awfar_captain/features/home/logic/home_state.dart';
import 'package:awfar_captain/features/home/ui/widgets/custom_account_view_row.dart';
import 'package:awfar_captain/features/home/ui/widgets/edit_profile_text_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/text_style_manager.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../lang/locale_keys.g.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.scaffold,
      body: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) => Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              color: ColorManager.green,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      LocaleKeys.accountSettings.tr(),
                      style: TextStyleManager.font17White500,
                    ),
                    leading: SvgPicture.asset(AssetsManager.icSettings,
                      colorFilter: const ColorFilter.mode(ColorManager.originalWhite, BlendMode.srcIn),),
                  ),
                  verticalSpace(20.h),
                  const CustomAccountViewRow(),
                  verticalSpace(15.h),
                  Divider(
                    color: ColorManager.lighterGrey,
                    endIndent: 10.h,
                    indent: 10.h,
                  ),
                ],
              ),
            ),
            verticalSpace(10.h),
            EditProfileTextForm(
              labelText: context.read<HomeCubit>().myProfile!.name,
                validator: (value) {},
                obscureText: false,
                text: 'Enter new name',
                inputType: TextInputType.name,
                controller: context.read<HomeCubit>().editingNameController
            ),           verticalSpace(10.h),
            EditProfileTextForm(
              labelText: context.read<HomeCubit>().myProfile!.email,
                validator: (value) {},
                obscureText: false,
                text: 'Enter new email',
                inputType: TextInputType.emailAddress,
                controller: context.read<HomeCubit>().editingNameController
            ),           verticalSpace(10.h),
            EditProfileTextForm(
              labelText: context.read<HomeCubit>().myProfile!.phone,
                validator: (value) {},
                obscureText: false,
                text: 'Enter new phone',
                inputType: TextInputType.phone,
                controller: context.read<HomeCubit>().editingNameController
            ),

          ],
        ),
      ),
    );
  }
}
