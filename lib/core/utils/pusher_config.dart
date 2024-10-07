// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
// import 'package:http/http.dart' as http;

class PusherConfig {
  late PusherChannelsFlutter _pusher;

  String APP_ID = "1766181";
  String API_KEY = "3fc9bba59aceb10daa36";
  String SECRET = "4c9e879ad8be49b3d304";
  String API_CLUSTER = "eu";

  Future<void> initPusher(onEvent, {required String channelName }) async {
    _pusher = PusherChannelsFlutter.getInstance();

    try {
      await _pusher.init(
        apiKey: API_KEY,
        cluster: API_CLUSTER,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        //authEndpoint: "${ApiEndPoints.baseUrlPusher}/broadcasting/auth",
        // onAuthorizer: onAuthorizer,
      );

      try {
        await _pusher.subscribe(
          channelName: "$channelName",
        );

        log("trying to subscribe to :  $channelName");
      } catch (e) {
        log(e.toString());
      }

      await _pusher.connect();
    } catch (e) {
      log("error in initialization: $e");
    }
  }

  void disconnect() {
    _pusher.disconnect();
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    log("onEvent: $event");
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = _pusher.getChannel(channelName)?.me;
    log("Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  void onSubscriptionCount(String channelName, int subscriptionCount) {
    log("onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount");
  }

  // dynamic onAuthorizer(String channelName, String socketId, dynamic options) async {
  //   return {
  //     "auth": "foo:bar",
  //     "channel_data": '{"user_id": ${_pusher.getSocketId()}',
  //     "shared_secret": "foobar"
  //   };
  // }
}