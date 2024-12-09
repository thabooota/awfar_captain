import 'package:awfar_captain/app/awfar_captain_app.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:awfar_captain/features/home/logic/home_state.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/back_icon_button.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit , HomeStates>(
      builder: (context, state) => Scaffold(
        backgroundColor: ColorManager.scaffold,
        appBar: AppBar(
          title: Text(LocaleKeys.aboutApp.tr()),
          backgroundColor: ColorManager.scaffold,
          leading:  BackIconButton(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(state is GetAboutPrivacyLoadingState)
              Center(child: CircularProgressIndicator(color: ColorManager.green,)),
            if(state is GetAboutPrivacyFailureState)
              Center(child: Text(LocaleKeys.errorText.tr(), style: TextStyleManager.font15Black500,),),
            if(state is GetAboutPrivacySuccessState)
            Padding(padding: EdgeInsets.all(10) , child: Text(context.read<HomeCubit>().aboutPrivacy[0].about ,  style: TextStyleManager.font15Black500,),),
          ],
        ),
      ),
    );
  }
}
