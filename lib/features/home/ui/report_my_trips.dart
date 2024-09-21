import 'package:awfar_captain/features/authentication/ui/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/color_manager.dart';
import '../../../core/theming/text_style_manager.dart';

class ReportMyTrips extends StatefulWidget {
  const ReportMyTrips({super.key});

  @override
  State<ReportMyTrips> createState() => _ReportMyTripsState();
}

class _ReportMyTripsState extends State<ReportMyTrips> {
  TextEditingController reportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: AppBar(
        title: const Text("بلاغ عن الرحلة رقم 898522"),
        backgroundColor: ColorManager.scaffold,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorManager.scaffold,
          systemNavigationBarColor: ColorManager.scaffold,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        elevation: 0.0,
        shape: const Border(
          bottom: BorderSide(color: ColorManager.transparent, width: 0.0),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: ColorManager.originalWhite,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpace(50.0),
            Text(
              "برجاء ارسال تفاصيل المشكلة",
              style: TextStyleManager.font16White400.copyWith(
                color: ColorManager.originalBlack,
              ),
            ),
            verticalSpace(20.0),
            CustomTextForm(
              controller: reportController,
              validator: (val){
                return null;
              },
              inputType: TextInputType.text,
              text: " ",
              obscureText: false,
            ),
            verticalSpace(38.0),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: ColorManager.originalWhite,
                minimumSize: Size(140.0.w, 50.0.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: ColorManager.originalBlack,
                    )),
              ),
              child: Text(
                "ارسال",
                style: TextStyleManager.font14TextColor700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
