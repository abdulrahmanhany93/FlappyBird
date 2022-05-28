part of 'gamecontroller_cubit.dart';

@immutable
abstract class GamecontrollerState {}

class GamecontrollerInitial extends GamecontrollerState {}

class GameStarted extends GamecontrollerState {}
class RestartGame extends GamecontrollerState {}
class GameOver extends GamecontrollerState {}

class PlayerMoving extends GamecontrollerState {}

class GravityWorking extends GamecontrollerState {}
