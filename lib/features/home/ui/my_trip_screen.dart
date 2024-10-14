import 'package:awfar_captain/features/captain_gate/logic/captain_gate_cubit.dart';
import 'package:awfar_captain/features/captain_gate/logic/captain_gate_state.dart';
import 'package:awfar_captain/features/home/ui/widgets/my_trips_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/color_manager.dart';
import '../../../lang/locale_keys.g.dart';
import '../data/entity/trip_entity.dart';

class MyTripScreen extends StatefulWidget {
  const MyTripScreen({super.key});

  @override
  State<MyTripScreen> createState() => _MyTripScreenState();
}

class _MyTripScreenState extends State<MyTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: AppBar(
        title: Text(LocaleKeys.myRides.tr()),
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
      body: BlocConsumer<CaptainGateCubit, CaptainGateStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is GetAllTripsSuccess) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              itemBuilder: (context, index) => MyTripsItem(
                isEnabled: context.read<CaptainGateCubit>().myTripsActive[index],
                onTap: () {
                  setState(() {
                    context.read<CaptainGateCubit>().myTripsActive[index] =
                    !context.read<CaptainGateCubit>().myTripsActive[index];
                  });
                },
                tripEntity: context
                    .read<CaptainGateCubit>()
                    .trips
                    .map(
                      (e) => TripEntity(
                    id: e.id.toString(),
                    date: e.startAt == null
                        ? "undefined"
                        : DateFormat('MMM d, yyyy').format(
                      DateTime.parse(e.startAt!.split(" ")[0]),
                    ),
                    time: e.startAt == null
                        ? "undefined"
                        : DateFormat('h:mm a').format(
                      DateFormat('HH:mm').parse(
                        e.startAt!.split(" ")[1].substring(0, 5),
                      ),
                    ),
                    tripNumber: e.tripNumber,
                    from: e.from,
                    to: e.to,
                    coupon:
                    e.coupon == null ? "- 00.00" : e.coupon.toString(),
                    cost: e.price.toString(),
                    finalTotalCost: e.totalPrice.toString(),
                    status: e.status,
                  ),
                )
                    .toList()[index],
              ),
              separatorBuilder: (context, index) => verticalSpace(22.0),
              itemCount: context
                  .read<CaptainGateCubit>()
                  .trips.length,
            );
          } else if (state is GetAllTripsLoading) {
            return const Center(child: Text('Loading...'));
          } else {
            return const Center(child: Text('Error...'));
          }
        },
      ),
    );
  }
}