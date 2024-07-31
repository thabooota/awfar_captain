import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/routing/routes.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/core/utils/enums.dart';
import 'package:awfar_captain/core/widgets/app_text_button.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/color_manager.dart';
import '../../../core/widgets/back_icon_button.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: ColorManager.scaffold,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorManager.scaffold,
          systemNavigationBarColor: ColorManager.scaffold,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        elevation: 0.0,
        shape: const Border(
            bottom: BorderSide(color: ColorManager.transparent, width: 0.0)),
        leading: const BackIconButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(LocaleKeys.rating.tr(), style: TextStyleManager.font34TextColor600,),
              verticalSpace(20.h),
              Text(LocaleKeys.ratingBody.tr(), style: TextStyleManager.font17TextColor600,),
              verticalSpace(40.h),
              RatingBar.builder(
                itemCount: 5,
                  minRating: 1,
                  itemSize: 45,
                  initialRating: 1,
                  itemPadding: const EdgeInsets.all(4),
                  direction: Axis.horizontal,
                  itemBuilder: (context, index) => const Icon(Icons.star , color: ColorManager.yellow,),
                  onRatingUpdate: (value) {
                    print(value);
                  },),
              verticalSpace(40.h),
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.darkGrey,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: TextFormField(
                  cursorColor: ColorManager.green,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hoverColor: ColorManager.green,
                    focusColor: ColorManager.green,
                    fillColor: ColorManager.lightGrey,
                    hintText: LocaleKeys.writeComment,
                    alignLabelWithHint: true,
                    hintStyle: TextStyleManager.font17DarkGrey400.copyWith(color: Colors.black45,),
                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                          color: ColorManager.darkGrey
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                          color: ColorManager.darkGrey
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpace(80.h),
              AppTextButton(
                  appText: LocaleKeys.btnSend.tr(),
                  onTap: () {
                    context.pushReplacementNamed(Routes.home,);
                  }
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
