import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('\x1B[36m onCreate -- ${bloc.runtimeType}\x1B[0m');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('\x1B[36m onChange -- ${bloc.runtimeType}, $change\x1B[0m');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('\x1B[36m onError -- ${bloc.runtimeType}, $error\x1B[0m');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('\x1B[36m onClose -- ${bloc.runtimeType}\x1B[0m');
  }
}