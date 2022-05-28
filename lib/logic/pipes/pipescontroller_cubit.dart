import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flappy_bird/const/const.dart';
import 'package:flappy_bird/helper/cache_manager.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'pipescontroller_state.dart';

class PipescontrollerCubit extends Cubit<PipescontrollerState> {
  PipescontrollerCubit() : super(PipescontrollerInitial());

  int score = 0;

  Timer movePip() {
    return Timer.periodic(const Duration(milliseconds: 10), (timer) {
      for (int i = 0; i < pipesXaxis.length; i++) {
        pipesXaxis[i] -= 0.05;

        //* change pipe position

        emit(PipeMoving());
        if (isPipeLeftScreen(i)) {
          pipesXaxis[i] = i == 0 ? 2 : 2.2;
          score++;
        } else if (isGameOver) {
          timer.cancel();
          setHighScore(); //* save high score
          pipesXaxis = [2, 2.2];
        }
      }
    });
  }

  void setHighScore() {
    if (CachManager.getHighScore() != null &&
        CachManager.getHighScore()! < score) {
      CachManager.cacheScore(score);
    } else if (CachManager.getHighScore() == null) {
      CachManager.cacheScore(score);
    }
  }

  bool get isGameOver => gamecontrollerCubit.gameStart == false;

  bool isPipeLeftScreen(int i) => pipesXaxis[i] < -1.5;
}
