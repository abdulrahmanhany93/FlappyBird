import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flappy_bird/const/const.dart';
import 'package:meta/meta.dart';

part 'gamecontroller_state.dart';

class GamecontrollerCubit extends Cubit<GamecontrollerState> {
  GamecontrollerCubit() : super(GamecontrollerInitial());

  double _time = 0;
  double _height = 0;
  final double _valocity = 1.5;
  double birdyAxis = 0.0;
  double inistailPosition = 0.0;
  bool gameStart = false;
  bool gameOver = false;
  int score = 0;

  resetGame() {
    /// reset game
    if (gameOver == true) {
      gameOver = false;
      gameStart = true;
      pipescontrollerCubit.score = 0;
      birdyAxis = 0.0;
      _time = 0;
      _height = 0;
      score = pipescontrollerCubit.score;
      inistailPosition = birdyAxis;
    }
  }

  void startGame() {
    /// move player
    ///
    resetGame();
    gameStart = true;
    inistailPosition = birdyAxis;
    emit(GameStarted());

    //! game start
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      _height = gravity * _time * _time + _valocity * _time;
      //* calculate height of bird in y axis (y = g*t^2 + v*t)
      //* where a = gravity and b = valocity of bird in y axis

      birdyAxis = inistailPosition - _height;
      if (_isPlayerDied(timer)) {
        //* check if player is died
        emit(GameOver());
      }

      _time += 0.04;
      emit(GravityWorking());
    });
  }

  void jump() {
    _time = 0;
    inistailPosition = birdyAxis;
    emit(PlayerMoving());
  }

  bool _isPlayerDied(Timer timer) {
    //* check if player is died

    if (birdyAxis < -1 || birdyAxis > 1) {
      timer.cancel();
      gameStart = false;
      gameOver = true;

      return true;
    } else {
      //* hits barriers
      //* checks if bird is within x coordinates and y coordinates of pipes
      for (int i = 0; i < pipesXaxis.length; i++) {
        if (isPlayeInPipeArea(i)) {
          timer.cancel();
          gameStart = false;
          gameOver = true;
          return true;
        }
      }
      return false;
    }
  }

  bool isPlayeInPipeArea(int i) {
    return pipesXaxis[i] <= birdWidth &&
        pipesXaxis[i] + fixedPipeWidth >= -birdWidth &&
        (birdyAxis - birdHeight <= -pipesHeight[i][0] + birdHeight ||
            birdyAxis + birdHeight >= 2 - pipesHeight[i][1]);
  }
}
