import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/core/utils/assets_manager.dart';
import 'package:awfar_captain/features/captain_gate/logic/captain_gate_cubit.dart';
import 'package:awfar_captain/features/captain_gate/logic/captain_gate_state.dart';
import 'package:awfar_captain/features/captain_gate/ui/widgets/my_trips_widget.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/widgets/back_icon_button.dart';

class CaptainGateScreen extends StatelessWidget {
  const CaptainGateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackIconButton(),
        scrolledUnderElevation: 0.0,
        shape: const Border(
            bottom: BorderSide(color: ColorManager.transparent, width: 0.0)),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorManager.scaffold,
          systemNavigationBarColor: ColorManager.scaffold,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: ColorManager.scaffold,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "${LocaleKeys.captainGate.tr()} \n ${context.read<CaptainGateCubit>().myProfile!.name}",
          style: TextStyleManager.font17blackBold,
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: ColorManager.scaffold,
      body: BlocBuilder<CaptainGateCubit, CaptainGateStates>(
        builder: (context, state) {
          CaptainGateCubit cubit = context.read<CaptainGateCubit>();
          if(state is GetReportLoading)
            {
              return const Center(child: CircularProgressIndicator(color: ColorManager.green,));
            } if (state is GetReportError ) {
            return Center(child: Text(LocaleKeys.errorText.tr() ,style:  TextStyleManager.font20TextColor600,),);
          }else  {
           if (cubit.myReport != null && cubit.myReport!.TripCompleted.isNotEmpty) {
             return ListView(
               padding:
               const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
               children: [
                 Center(
                   child: Text(
                     '0 ${LocaleKeys.currency.tr()}',
                     style: TextStyleManager.font25White600
                         .copyWith(color: ColorManager.originalBlack),
                   ),
                 ),
                 verticalSpace(20.h),
                 Card(
                   elevation: 2,
                   color: ColorManager.originalWhite,
                   child: ListTile(
                     title: Text(
                       LocaleKeys.withDrawMyBalance.tr(),
                       style: TextStyleManager.font20Gray400,
                     ),
                     leading: CircleAvatar(
                         radius: 20.0,
                         backgroundColor: ColorManager.lightGrey,
                         child: SvgPicture.asset(AssetsManager.icMoney)),
                     onTap: () {},
                     contentPadding: const EdgeInsets.symmetric(
                         horizontal: 20.0, vertical: 8),
                   ),
                 ),
                 verticalSpace(15.h),
                 Text(
                   LocaleKeys.yourQualityReport.tr(),
                   style: TextStyleManager.font20BlackBold,
                 ),
                 verticalSpace(15.h),
                 Card(
                   elevation: 2,
                   color: ColorManager.originalWhite,
                   child: Padding(
                     padding: const EdgeInsets.symmetric(
                         horizontal: 16.0, vertical: 6.0),
                     child: Column(
                       children: [
                         Row(
                           children: [
                             Text(
                               LocaleKeys.generalStatus.tr(),
                               style: TextStyleManager.font17TextColor600,
                             ),
                             const Spacer(),
                             Text(
                               cubit.myRate! > 1 ? LocaleKeys.good.tr() : LocaleKeys.bad.tr(),
                               style: TextStyleManager.font17TextColor600,
                             ),
                           ],
                         ),
                         verticalSpace(10.0.h),
                         Row(
                           children: [
                             Text(
                               LocaleKeys.customerExperience.tr(),
                               style: TextStyleManager.font17TextColor600,
                             ),
                             const Spacer(),
                             Text(
                               int.parse(cubit.myReport!.Percentage_completed_trips.replaceAll('%', '')) > 50 ? LocaleKeys.good.tr() : LocaleKeys.satisfactory.tr(),
                               style: TextStyleManager.font17TextColor600
                                   .copyWith(color: ColorManager.orange),
                             ),
                           ],
                         ),
                         verticalSpace(10.0.h),
                         verticalSpace(10.0.h),
                         Row(
                           children: [
                             Text(
                               LocaleKeys.percentageOfCompletedTrips.tr(),
                               style: TextStyleManager.font17TextColor600,
                             ),
                             const Spacer(),
                             Text(
                               cubit.myReport!.Percentage_completed_trips,
                               style: TextStyleManager.font17TextColor600
                                   .copyWith(color: ColorManager.red),
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                 ),
                 verticalSpace(15.h),
                 GestureDetector(
                   onTap: () {
                     showCustomDateRangePicker(
                       context,
                       dismissible: true,
                       minimumDate: DateTime.now().subtract(const Duration(days: 300)),
                       maximumDate: DateTime.now(),
                       endDate: cubit.secaundDateTime,
                       startDate: cubit.firstDateTime,
                       backgroundColor: Colors.white,
                       primaryColor: Colors.green,
                       onApplyClick: (start, end) {
                         cubit.firstDateTime = start;
                         cubit.secaundDateTime = end;
                         cubit.emitGetReport(to: end.toString(), from: start.toString());
                       },
                       onCancelClick: () {
                         cubit.firstDateTime = DateTime.now().subtract(Duration(days: 7));
                         cubit.secaundDateTime = DateTime.now();
                       },
                     );
                   },
                   child: Card(
                     color: ColorManager.originalWhite,
                     elevation: 2,
                     child: Padding(
                       padding: const EdgeInsets.symmetric(
                           horizontal: 16.0, vertical: 10.0),
                       child: Center(
                         child: Text(
                           '${DateFormat('dd-MM-yyyy').format(cubit.secaundDateTime)} : ${DateFormat('dd-MM-yyyy').format(cubit.firstDateTime)}',
                           style: TextStyleManager.font20BlackBold,
                         ),
                       ),
                     ),
                   ),
                 ),
                 verticalSpace(30.h),
                 Text(
                   LocaleKeys.myRides.tr(),
                   style: TextStyleManager.font20BlackBold,
                 ),
                 verticalSpace(10.h),
                 if(cubit.myReport != null)
                   const MyTripsWidget(),
               ],
             );
           } else {
             return Center(child: Text(LocaleKeys.noTripsFound.tr() ,style:  TextStyleManager.font20TextColor600,),);
           }
          }
        },
      ),
    );
  }
}
