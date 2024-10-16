import 'dart:convert';
import 'dart:developer';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awfar_captain/core/networking/local/prefs_manager.dart';
import 'package:awfar_captain/core/networking/local/shared_preferences.dart';
import 'package:awfar_captain/features/chat/ui/widget/chat_bottom_sheet.dart';
import 'package:awfar_captain/features/chat/ui/widget/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/color_manager.dart';
import '../../../core/utils/pusher_config.dart';
import '../../home/logic/home_cubit.dart';
import '../../home/logic/home_state.dart';
import '../data/models/response/get_meassage_response.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key,});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = ScrollController();
  late PusherConfig pusherConfig;

  void initializeRoom() async {
    pusherConfig = PusherConfig();

    pusherConfig.initPusher(
      onEvent,
      channelName: "message.Driver.${SharedPreferencesManager.getData(key: PrefsManager.driverId,)}",
    );
  }

  void onEvent(PusherEvent event) {
    try {
      if (event.eventName == r"pusher:subscription_succeeded") {
        log("here subscription_succeeded");
      }
      if (event.eventName == "event") {
        log("here chat");
        var message = json.decode(event.data);

        context.read<HomeCubit>().emitAddMessageState(
          messageInfo: MessageInfo(
            id: message["message"]["id"],
            message: message["message"]["message"],
            sender: message["message"]["sender"],
            createdAt: message["message"]["created_at"],
          ),
        );
      }

      animateListToTheEnd();
      setState(() {});
    } catch (e) {
      log(e.toString());
    }
  }

  animateListToTheEnd({int time = 1}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: time),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeRoom();
  }
  @override
  void dispose() {
    pusherConfig.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is SendMessageSuccessState) {
          AnimatedSnackBar.material(
            state.massageResponse.message,
            type: AnimatedSnackBarType.success,
            animationCurve: Curves.fastEaseInToSlowEaseOut,
            mobileSnackBarPosition: MobileSnackBarPosition.top,
            duration: const Duration(milliseconds: 1200),
          ).show(context);
          animateListToTheEnd();
        }
        if (state is SendMessageFailureState) {
          AnimatedSnackBar.material(
            state.errorMessage,
            type: AnimatedSnackBarType.error,
            animationCurve: Curves.fastEaseInToSlowEaseOut,
            mobileSnackBarPosition: MobileSnackBarPosition.top,
            duration: const Duration(milliseconds: 1200),
          ).show(context);
        }
        if (state is GetMessageSuccessState) {

        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          backgroundColor: ColorManager.scaffold,
          appBar: AppBar(),
          bottomSheet: const ChatBottomSheet(),
          body: SafeArea(
            child: state is GetMessageLoadingState
                ? Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                size: 40,
                color: ColorManager.green,
              ),
            )
                : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    controller: scrollController,
                    // reverse: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    itemBuilder: (context, index) => context
                        .read<HomeCubit>()
                        .messages[index]
                        .sender ==
                        "driver"
                        ? MessageItem(
                      clint: true,
                      message:
                      context.read<HomeCubit>().messages[index],
                    )
                        : MessageItem(
                      clint: false,
                      message:
                      context.read<HomeCubit>().messages[index],
                    ),
                    separatorBuilder: (context, index) =>
                        verticalSpace(12.0),
                    itemCount: context.read<HomeCubit>().messages.length,
                  ),
                ),
                verticalSpace(80.0),
              ],
            ),
          ),
        );
      },
    );
  }
}