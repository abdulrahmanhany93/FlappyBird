import 'package:bloc/bloc.dart';
import 'package:flappy_bird/const/const.dart';
import 'package:flappy_bird/logic/bloc_observer.dart';
import 'package:flutter/services.dart';

void buildBlocObserver() {
  BlocOverrides.runZoned(() => {pipescontrollerCubit, gamecontrollerCubit},
      blocObserver: MyBlocObserver());
}

void disableMobileLandscape() {
  /// disable mobile landscape
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
