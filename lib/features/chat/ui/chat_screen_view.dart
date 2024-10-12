// import 'dart:developer';
//
// import 'package:animated_snack_bar/animated_snack_bar.dart';
// import 'package:awfar_captain/features/chat/ui/widget/message_model.dart';
// import 'package:awfar_captain/features/home/logic/home_cubit.dart';
// import 'package:awfar_captain/features/home/logic/home_state.dart';
// import 'package:awfar_client/core/helpers/spacing.dart';
// import 'package:awfar_client/features/chat/logic/chat_cubit.dart';
// import 'package:awfar_client/features/chat/logic/chat_states.dart';
// import 'package:awfar_client/features/chat/ui/widgets/message_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
//
// import '../../../core/helpers/spacing.dart';
// import '../../../core/theming/color_manager.dart';
// import '../../../core/utils/pusher_config.dart';
// import 'widgets/chat_bottom_sheet.dart';
//
// // clint token: xcuUbPsm8fjmjoLSK0Ez4SLNyEJ6aOEVMoX0SvIK0Udhui28hhcPp3TB3PgU
// // clint id: 56
// // trip id: 26
// // driver token: HO4zDg3mFOJsbiRRCa6as35IzdCfAFGTJ3q9IsdqtqrpJF0iAD2b1krKKxLe
// // driver id: 46
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   ScrollController scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit, HomeStates>(
//       listener: (context, state) {
//         if (state is SendMessageSuccessState) {
//           AnimatedSnackBar.material(
//             state.massageResponse.message,
//             type: AnimatedSnackBarType.success,
//             animationCurve: Curves.fastEaseInToSlowEaseOut,
//             mobileSnackBarPosition: MobileSnackBarPosition.top,
//             duration: const Duration(milliseconds: 1200),
//           ).show(context);
//         }
//         if (state is SendMessageFailureState) {
//           AnimatedSnackBar.material(
//             state.errorMessage,
//             type: AnimatedSnackBarType.error,
//             animationCurve: Curves.fastEaseInToSlowEaseOut,
//             mobileSnackBarPosition: MobileSnackBarPosition.top,
//             duration: const Duration(milliseconds: 1200),
//           ).show(context);
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           extendBodyBehindAppBar: true,
//           extendBody: true,
//           backgroundColor: ColorManager.scaffold,
//           appBar: AppBar(),
//           bottomSheet: const ChatBottomSheet(),
//           body: SafeArea(
//             child: state is GetMessagesLoadingState
//                 // ? Center(
//               child: LoadingAnimationWidget.staggeredDotsWave(
//                 size: 40,
//                 color: ColorManager.green,
//               ),
//             )
//                 : Column(
//               children: [
//                 Expanded(
//                   child: ListView.separated(
//                     controller: scrollController,
//                     // reverse: true,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16.0, vertical: 12.0),
//                     itemBuilder: (context, index) => context
//                         .read<HomeCubit>()
//                         .messages[index]
//                         .sender ==
//                         56
//                         ? MessageItem(
//                       clint: true,
//                       message:
//                       context.read<HomeCubit>().messages[index],
//                     )
//                         : MessageItem(
//                       clint: false,
//                       message:
//                       context.read<HomeCubit>().messages[index],
//                     ),
//                     separatorBuilder: (context, index) =>
//                         verticalSpace(12.0),
//                     itemCount: context.read<HomeCubit>().messages.length,
//                   ),
//                 ),
//                 verticalSpace(80.0),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }